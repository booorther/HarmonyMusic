import media from '@ohos.multimedia.media'
import emitter from '@ohos.events.emitter'
import { songItemType, songItemTypeModel } from '../models/music'
import { EmitEventType, PublishEventType } from '../constants/EventContants'
import { defaultState, PlayStateType } from '../models/playState'
import router from '@ohos.router'
import { PreferencesClass } from './PreferencesClass'
import formProvider from '@ohos.app.form.formProvider'
import formBindingData from '@ohos.app.form.formBindingData'
import { SubscriberClass } from './SubscriberClass'
import { Http2BufferClass } from './Http2Buffer'

export default class AVPlayerClass {
  // 1.创建一个播放器
  static player: null | media.AVPlayer = null
  // 当前播放器播放歌曲的时长
  static duration: number = 0
  // 当前播放器播放的时长
  static time: number = 0
  // 当前播放器是否播放
  static isPlay: boolean = false
  // 当前播放器的播放模式
  static playMode: 'auto' | 'repeat' | 'random' = 'auto'
  // 当前播放器的播放列表
  static playList: songItemType[] = []
  // 当前播放的歌曲索引
  static playIndex: number = 0

  // 播放器上记录上下文
  static context:Context|null = null
  // 节流阀表示
  static timer = -1

  // 监听卡片推送过来的ID
  static subscriber = null

  // 2.初始化
  static async init() {
    const preferences:PreferencesClass = new PreferencesClass(this.context)
    // 监听卡片创建的事件
    SubscriberClass.subscribe(PublishEventType.CARD_PUBLISH,this.subscriber,(event)=>{
      switch (event){
        case 'next':
          this.next()
          break
        case 'prev':
          this.previous()
          break
        default:
        // event是卡片ID
          preferences.setFormId(event)
      }
    })

    // 在next版本需要用静态类的写法，不能用this
    this.player = await media.createAVPlayer()
    // 读取首选项的状态
    // 并且更新（防止应用强杀导致的状态不一样）
    const playState = await preferences.getPlayState()
    playState.isPlay = false
    this.time = playState.time
    this.duration = playState.duration
    this.playIndex = playState.playIndex
    this.playList = playState.playList
    this.playMode = playState.playMode
    // 回写首选项
    await preferences.setPlayState(playState)
    // 监听播放器的状态(状态机)
    this.player.on('stateChange', (state: media.AVPlayerState) => {
      switch (state) {
      // 初始化
        case 'initialized':
          this.player.prepare()
          break
      // 准备
        case 'prepared':
        // 播放操作(从头播)
        //   this.player.play()
        //   this.isPlay = true
          this.player.seek(this.time)
          break
      // 播放完成
        case 'completed':
          if (this.playMode === 'random' && this.playList.length > 1) {
            let index = 0
            do {
              index = Math.floor(Math.random() * this.playList.length)
            } while (index === this.playIndex)
            // 已经拿到了非自身的索引
            this.playIndex = index
          } else if (this.playMode === 'auto') {
            this.playIndex++
            this.playIndex = (this.playIndex + this.playList.length) % this.playList.length
          }
          this.singlePlay(this.playList[this.playIndex])
          break

      }
    })
    // 监听歌曲时长
    this.player.on('durationUpdate', (duration: number) => {
      this.duration = duration
    })
    // 监听播放时长
    this.player.on('timeUpdate', (time) => {
      if(time!==0 && time!==this.time){
        this.time = time
        // 更新页面状态、首选项
        this.updateState()
      }
    })
    // 监听设置播放时长
    this.player.on('seekDone', () => {
      this.player.play()
      this.isPlay = true
    })
  }
  // 单曲播放
  static singlePlay(song: songItemType) {
    const isList = this.playList.some(item => item.id === song.id)
    // 是不是播放列表里
    if (isList) {
      // 如果是第一次打开播放器，那么播放器的url一定是''
      // console.log('logData:',this.player.url)
      if (song.url === this.player.url) {
        // 当前是否正在播放
        if (this.isPlay) {
          // 重新播放
          this.changePlay()
        } else {
          // 继续播放(设置播放器到指定的时间)
          this.player.seek(this.time)
        }

      }
      else {
        // 断点续播if
        if(this.player.url===''){
          // 继续播放
          this.player.url = song.url
        }else{
          // 切换歌曲(切的索引)else
          const index = this.playList.findIndex(item => item.id === song.id)
          this.playIndex = index
          this.changePlay()
        }

      }
    } else {
      // 加到列表的最前面，然后从头开始播放
      this.playList.unshift(song)
      this.playIndex = 0
      this.changePlay()
    }
  }
  // 切换歌曲
  static async changePlay() {
    // 将播放状态置为闲置
    await this.player.reset()
    // 播放器的状态+播放类
    this.time = 0
    this.duration = 0
    this.player.url = this.playList[this.playIndex].url
  }
  // 暂停歌曲
  static async pause() {
    this.player.pause()
    this.isPlay = false
    const data = {
      playState: JSON.stringify({
        img: this.playList[this.playIndex].img,
        name: this.playList[this.playIndex].name,
        author: this.playList[this.playIndex].author,
        time: this.time,
        duration: this.duration,
        playMode: this.playMode,
        isPlay: this.isPlay,
        url: this.playList[this.playIndex].url,
        playList: this.playList,
        playIndex: this.playIndex
      } as PlayStateType)
    }
    // 1.更新页面
    emitter.emit({
      eventId: EmitEventType.UPDATE_STATE
    }, {
      data
    })
    // 2.更新首选项
    // 怎么获取首选项？
    const preferences:PreferencesClass = new PreferencesClass(this.context)
    await preferences.setPlayState(JSON.parse(data.playState))
  }
  // 切换播放模式
  static changeMode(mode: 'auto' | 'repeat' | 'random') {
    this.playMode = mode
    // 更新页面状态、首选项
    this.updateState()
  }
  // 上一首
  static previous() {
    if (this.playList.length === 0) {
      return
    }
    if (this.playMode === 'random' && this.playList.length > 1) {
      let index = 0
      do {
        index = Math.floor(Math.random() * this.playList.length)
      } while (index === this.playIndex)
      // 已经拿到了非自身的索引
      this.playIndex = index
    } else {
      this.playIndex--
      // 有可能会变为负数
      this.playIndex = (this.playIndex + this.playList.length) % this.playList.length
    }
    this.singlePlay(this.playList[this.playIndex])
  }
  // 下一首
  static next() {
    if (this.playList.length === 0) {
      return
    }
    if (this.playMode === 'random' && this.playList.length > 1) {
      let index = 0
      do {
        index = Math.floor(Math.random() * this.playList.length)
      } while (index === this.playIndex)
      // 已经拿到了非自身的索引
      this.playIndex = index
    } else {
      this.playIndex++
      // 有可能会变为负数
      this.playIndex = (this.playIndex + this.playList.length) % this.playList.length
    }
    this.singlePlay(this.playList[this.playIndex])
  }
  // 删除列表歌曲
  static async remove(index){
    // 当前是否正在播放这首歌曲
    if(this.playIndex === index){
      //  删完还有歌曲吗?
      if(this.playList.length>1){
        this.playList.splice(index,1)
        // 切换歌曲前,要计算出切换歌曲的索引
        // 复杂点:有一定的计算逻辑需要理解,如果不能理解那就if else
        this.playIndex = (this.playIndex+this.playList.length)%this.playList.length
        this.singlePlay(this.playList[this.playIndex])
      }else{
        // 返回上一页
        // 播放停止了
        await this.player.reset()
        this.playList.splice(index,1)
        this.isPlay = false
        this.duration = 0
        this.time = 0
        // 问题:由于我已经重置状态机了,所以没有给页面推送我删除后的状态
        // this.updateState()
        // 因为删除完了,playList是空数组了,不能用this.playList[].url的写法了
        const data = {
          playState: JSON.stringify(defaultState)
        }
        // 1.推送到了页面
        emitter.emit({
          eventId: EmitEventType.UPDATE_STATE
        }, {
          data
        })
        // 2.推送到首选项
        const preferences:PreferencesClass = new PreferencesClass(this.context)
        await preferences.setPlayState(JSON.parse(data.playState))
        router.back()
      }
    }else{
      // 删除播放前面的
      if(this.playIndex>index){
        this.playIndex--
      }
      this.playList.splice(index,1)
    }
  }
  // 列表播放
  static listPlay(list:songItemTypeModel[],index:number){
    this.playList = list
    this.playIndex = index
    this.singlePlay(this.playList[this.playIndex])
  }
  // 更新页面状态 首选项 卡片
  static async updateState() {
    if(this.timer===-1){
      console.log('logData:','update')
      const data = {
        playState: JSON.stringify({
          img: this.playList[this.playIndex].img,
          name: this.playList[this.playIndex].name,
          author: this.playList[this.playIndex].author,
          time: this.time,
          duration: this.duration,
          playMode: this.playMode,
          isPlay: this.isPlay,
          url: this.playList[this.playIndex].url,
          playList: this.playList,
          playIndex: this.playIndex
        } as PlayStateType)
      }
      // 1.更新页面
      emitter.emit({
        eventId: EmitEventType.UPDATE_STATE
      }, {
        data
      })
      // 2.更新首选项
      // 怎么获取首选项？
      const preferences:PreferencesClass = new PreferencesClass(this.context)
      await preferences.setPlayState(JSON.parse(data.playState))
      // 3.更新到卡片
      const id = await preferences.getFormId()
      // 将playState.img下载下来
      Http2BufferClass.get(this.playList[this.playIndex].img,this.context,(res)=>{
        // 通知卡片页面
        formProvider.updateForm(id,formBindingData.createFormBindingData({
          playState:data,
          fileName:res.fileName,
          // 必须得传递的
          formImages:res.formImages
        }))
      })
      //锁上
      this.timer = setTimeout(()=>{
        this.timer = -1
      },1000)
    }

  }
}