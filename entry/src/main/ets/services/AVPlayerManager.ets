// 管理类的作用：用来统一管理播放对象的初始化，播放一首歌，暂停，恢复播放，设置播放时间点
import media from '@ohos.multimedia.media'
import emitter from '@ohos.events.emitter'
import { songItemType, songs } from '../model/datas'
export class AVPlayerManager {
  static avplayer: media.AVPlayer // 静态成员
  static songs: songItemType[] = songs // 定义数组，接收外部传入的播放歌曲列表
  static currentIndex: number = 0 // 表示当前播放的歌曲在songs数组中的索引
  static isplaying: boolean = false      //歌曲播放状态
  static playState: 'liner' | 'repeat' | 'random' = 'liner' // 使用了联合类型来定义状态

  // 负责改变歌曲的播放状态
  static async changePlayState() {
    if (AVPlayerManager.playState == 'liner') {
      AVPlayerManager.playState = 'repeat'
    } else if (AVPlayerManager.playState == 'repeat') {
      AVPlayerManager.playState = 'random'
    } else if (AVPlayerManager.playState == 'random') {
      AVPlayerManager.playState = 'liner'
    }

    // emit通知页面更新状态
    //  调用消息通知方法
    AVPlayerManager.sendMusic(AVPlayerManager.songs[AVPlayerManager.currentIndex])
  }

  // 1. 负责初始化播放器对象
  static async init() {
    // 创建一个播放器的对象，主要负责播放歌曲的
    AVPlayerManager.avplayer = await  media.createAVPlayer()

    // 监听avplayer对象的状态
    AVPlayerManager.avplayer.on('stateChange', (state) => {
      console.log('mylog:播放状态：', state)
      if (state == 'initialized') {
        AVPlayerManager.avplayer.prepare() // 准备播放 -> prepared
      }

      if (state == 'prepared') {
        AVPlayerManager.avplayer.play() // 播放歌曲 -> playing
      }

      // 监听歌曲播放完成
      if (state == 'completed') {
        if (AVPlayerManager.playState == 'liner') {
          // 调用next方法开启播放下一曲
          AVPlayerManager.nextMusic()
        }

        if (AVPlayerManager.playState == 'repeat') {
          // 单曲循环
          AVPlayerManager.playMusic(AVPlayerManager.songs[AVPlayerManager.currentIndex])
        }

        if (AVPlayerManager.playState == 'random') {
          // 随机播放
          // AVPlayerManager.nextMusic()
          //  获取songs数组的长度 -> 随机生成一个索引号
          let r = Math.random() * AVPlayerManager.songs.length
          let index = Math.floor(r)
          //   根据索引获取歌曲播放
          AVPlayerManager.currentIndex = index  // 同步当前索引
          AVPlayerManager.playMusic(AVPlayerManager.songs[index])
        }

      }
    })
  }

  //   2. 播放一首歌
  static async playMusic(item: songItemType) {
    // 播放一首新歌曲
    AVPlayerManager.isplaying = true
    await AVPlayerManager.avplayer.reset() // ✨
    AVPlayerManager.avplayer.url = item.url

    //  调用消息通知方法
    AVPlayerManager.sendMusic(item)
  }

  //   3. 暂停方法
  static async pause() {
    AVPlayerManager.isplaying = false
    await AVPlayerManager.avplayer.pause()
    //  调用消息通知方法
    AVPlayerManager.sendMusic(AVPlayerManager.songs[AVPlayerManager.currentIndex])
  }

  //   4. 恢复播放
  static async reWork() {
    AVPlayerManager.isplaying = true
    await AVPlayerManager.avplayer.play()
    //  调用消息通知方法
    AVPlayerManager.sendMusic(AVPlayerManager.songs[AVPlayerManager.currentIndex])
  }

  //   5. 通过emiiter.emit方法将当前播放的歌曲数据进行消息发送
  static async sendMusic(item: songItemType) {
    // emitter.emit发送数据
    emitter.emit({ eventId: 0 }, {
      data: {
        img: item.img, //播放歌曲的图片
        name: item.name, // 歌曲名称
        author: item.author //歌手
      }
    })
  }

  //   6. 上一首歌
  static async preMusic() {
    AVPlayerManager.isplaying = true
    //  将currentIndex减一
    AVPlayerManager.currentIndex--
    // 如果当前播放的歌曲已经是第一首歌，则从songs数组中的最后一首歌开始播
    if (AVPlayerManager.currentIndex < 0) {
      AVPlayerManager.currentIndex = AVPlayerManager.songs.length - 1
    }

    //   获取songs数组中对应最新索引值的歌曲数据
    let music = AVPlayerManager.songs[AVPlayerManager.currentIndex]

    //  调用playMusic播放歌曲即可
    AVPlayerManager.playMusic(music)
  }

  //   7. 下一首歌曲
  static async nextMusic() {
    AVPlayerManager.isplaying = true
    // 将当前索引++
    AVPlayerManager.currentIndex++
    if (AVPlayerManager.currentIndex >= AVPlayerManager.songs.length) {
      AVPlayerManager.currentIndex = 0 //重置为第一首歌
    }

    //  获取到最新的歌曲
    let music = AVPlayerManager.songs[AVPlayerManager.currentIndex]

    //   播放歌曲
    AVPlayerManager.playMusic(music)
  }

  //   8. 重新设置播放起点
  static async seek(time: number) {
    AVPlayerManager.avplayer.seek(time)
  }
}

