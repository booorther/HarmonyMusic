import { AVPlayerManager } from '../services/AVPlayerManager'
import emitter from '@ohos.events.emitter'
import { songItemType } from '../model/datas'

@Entry
@Component
struct PlayPage {
  @State angle: number = 0 //cd唱片的初始角度
  @State song: songItemType = Object()
  @State isplaying: boolean = false
  @State curTime: number = 0 // 歌曲已播放时间长度
  @State totalTime: number = 0 // 歌曲的总长度
  @State h:number = 0 //歌曲列表容器的高度控制变量：0 - 400  - 0
  @State playState:'liner' | 'repeat' | 'random' = 'liner'  // 定义状态变量

  aboutToAppear() {
    //  从AVPlayerManager中获取到当前播放的歌曲
    this.song = AVPlayerManager.songs[AVPlayerManager.currentIndex]
    this.isplaying = AVPlayerManager.isplaying //进入页面的时候要同步播放状态
    this.playState = AVPlayerManager.playState

    //  监听切歌的时候发送过来的新歌曲信息
    emitter.on({ eventId: 0 }, (eventData) => {
      this.song = eventData.data as songItemType
      this.isplaying = AVPlayerManager.isplaying
      this.playState = AVPlayerManager.playState
      // this.totalTime = AVPlayerManager.avplayer.duration //歌曲的总时间,毫秒
    })

    // 监听歌曲的播放进度事件
    AVPlayerManager.avplayer.on('timeUpdate', (time) => {
      this.curTime = time //毫秒
      this.totalTime = AVPlayerManager.avplayer.duration //歌曲的总时间,毫秒
    })
  }

  // 定义格式化时间
  // time:毫秒数
  fmtTime(time: number) {
    // 将time这个毫秒数转换成 分钟:秒
    let seconds = time / 1000 // 毫秒转换秒

    // 获取分钟
    let min = Math.floor(seconds / 60) // 秒转为分钟 ->小数  1.17 所以要去的小于等于这个数字的最大整数

    // 获取秒
    let s = Math.ceil(seconds % 60) // 20.7

    return `${min.toString().padStart(2, '0')}:${s.toString().padStart(2, '0')}`
  }

  build() {
    Stack({alignContent:Alignment.Bottom}) {
      // 核心页面
      Stack() {
        // 一张图片宽高都是100%，同时使用.blur()进行雾化
        Image(this.song.img)
          .height('100%')
          .width('100%')
          .blur(1000) //雾化背景

        Column() {
          //   1. CD唱片区域
          Stack() {
            Stack() {
              // CD底图
              Image($r('app.media.ic_cd'))
                .height(300)

              // 在线的歌曲图片盖在上面
              Image(this.song.img)
                .height(200)
                .borderRadius(200)
            }
            .rotate({
              angle: this.isplaying ? this.angle : 0 // 使用播放状态来控制CD是否旋转
            })
            .onAppear(() => {
              this.angle = 360 //触发了值的改变
            })
            .animation({
              duration: 10000, // 表示监听到当前Stack的rotate中的angle属性值从0改到360度花费了5秒钟
              iterations: -1, // 循环旋转下去
              curve: Curve.Linear // 设置匀速旋转
            })

            // 唱针图片
            Image($r('app.media.ic_stylus'))
              .height(200)
              .margin({ top: -220 })
              .rotate({
                angle: this.isplaying ? -45 : -55, //暂停时：-55°   播放时：-45°
                centerX: '50%', // x的位置
                centerY: 30 //y的位置
              })

              .animation({
                duration: 1000 // 控制唱针在-45到-55°之前的切换花费了1秒钟时间,这样用户看起来就是一个动画效果
              })
          }
          .width('100%')
          // .backgroundColor(Color.Pink)
          .layoutWeight(6)

          //   2. 歌曲信息
          Column({ space: 5 }) {
            Text(this.song.name)
              .fontColor(Color.White)
              .fontSize(25)
              .fontWeight(800)
            Text(this.song.author)
              .fontColor(Color.White)
              .fontSize(15)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          // .backgroundColor(Color.Blue)
          .layoutWeight(2)

          //点赞，分享，收藏，下载
          Row(){
            //喜欢
            Row(){
              Image($r('app.media.ic_like'))
                .height(25)
                .fillColor(Color.White)
              Stack(){
                Text('99+')
                  .fontSize(12)
                  .fontColor(Color.White)
              }
              .height(15)
              .width(30)
              .backgroundColor('#9AA9B5')
              .borderRadius(10)
              .margin({bottom:18,left:-7})
              .opacity(0.7)//opacity:不透明。不传导


            }
            .width(50)
            .height(30)
            //评论
            Row(){
              Image($r('app.media.ic_comment_o'))
                .height(25)
                .fillColor(Color.White)
              Stack(){
                Text('100W')
                  .fontSize(12)
                  .fontColor(Color.White)
              }
              .height(15)
              .width(35)
              .backgroundColor('#9AA9B5')
              .borderRadius(10)
              .margin({bottom:18,left:-7})
              .opacity(0.7)


            }
            .width(50)
            .height(30)
            //热点
            Row(){
              Image($r('app.media.ic_bells_o'))
                .height(25)
                .fillColor(Color.White)
              Stack(){
                Text('hot')
                  .fontSize(12)
                  .fontColor(Color.White)
              }
              .height(15)
              .width(30)
              .backgroundColor('#C2453C')
              .borderRadius(10)
              .margin({bottom:18,left:-7})
              .opacity(0.7)


            }
            .width(50)
            .height(30)
            //下载
            Row(){
              Image($r('app.media.ic_download_o'))
                .height(25)
                .fillColor(Color.White)
              Stack(){
                Text('vip')
                  .fontSize(12)
                  .fontColor(Color.White)
              }
              .height(15)
              .width(30)
              .backgroundColor('#B0A865')
              .borderRadius(10)
              .margin({bottom:18,left:-7})
              .opacity(0.7)


            }
            .width(50)
            .height(30)

          }
          .width('100%')
          .layoutWeight(1)
          .justifyContent(FlexAlign.SpaceAround)
          .margin({top:50})



          //   3. 控制播放区
          Column() {
            Row() {
            }
            .layoutWeight(1)
            // 歌曲播放进度
            Row() {
              Text(this.fmtTime(this.curTime))
                .fontColor(Color.White)
                .fontSize(12)
              Slider({
                min: 0, // 最小值
                max: this.totalTime, //最大值
                value: this.curTime // 当前值 -》将来改变这个值就能控制小球的滑动
              })
                .selectedColor(Color.White) //设置已经选中的颜色
                .trackThickness(2) // 设置进度条的高度
                .layoutWeight(1)
                .onChange((time) => {
                  // 将当前用户选择的进度时间赋值给播放器对象的seek方法，就能重新设置播放器的播放起点
                  AVPlayerManager.seek(time)
                })
              Text(this.fmtTime(this.totalTime))
                .fontColor(Color.White)
                .fontSize(12)
            }
            .padding({ left: 10, right: 10 })
            .layoutWeight(1)
            // 歌曲播放控制按钮
            Row() {
              Image(this.playState=='liner'? $r('app.media.ic_auto'):this.playState=='repeat'? $r('app.media.ic_repeat'): $r('app.media.ic_random'))
                .height(30)
                .fillColor(Color.White)
                .onClick(()=>{
                  // 切换状态
                  AVPlayerManager.changePlayState()
                })

              Image($r('app.media.ic_prev'))
                .height(30)
                .fillColor(Color.White)
                .onClick(() => {
                  AVPlayerManager.preMusic()
                })

              Image(this.isplaying ? $r('app.media.ic_paused') : $r('app.media.ic_play'))
                .height(30)
                .fillColor(Color.White)
                .onClick(() => {
                  if (this.isplaying == true) {
                    AVPlayerManager.pause()
                  } else {
                    AVPlayerManager.reWork()
                  }

                  this.isplaying = !this.isplaying
                })

              Image($r('app.media.ic_next'))
                .height(30)
                .fillColor(Color.White)
                .onClick(() => {
                  AVPlayerManager.nextMusic()
                })

              Image($r('app.media.ic_song_list'))
                .height(30)
                .fillColor(Color.White)
                .onClick(()=>{
                  this.h = 400
                })
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceAround)
            .layoutWeight(1)
          }
          .width('100%')
          // .backgroundColor(Color.Green)
          .layoutWeight(3)
        }
        .height('100%')
        .width('100%')
        .backgroundColor(Color.Black)
      }

      // 歌曲列表容器
      Column(){
        // 上方
        Row() {
          Row({ space: 10 }) {
            Image($r('app.media.ic_play'))
              .height(25)
              .fillColor('#d2577c')

            Text('播放列表(16)')
              .fontColor(Color.White)
              .fontSize(18)
          }

          Image($r('app.media.ic_close'))
            .height(25)
            .onClick(()=>{
              this.h = 0
            })

        }
        .padding(20)
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        // 下方
        List() {
          ForEach(AVPlayerManager.songs, (item: songItemType, index: number) => {
            ListItem() {
              Row() {
                
                Text((index + 1).toString())
                  .fontColor(Color.White)
                  .width(40)
                  .textAlign(TextAlign.Center)
                Row({ space: 10 }) {
                  Column({ space: 5 }) {
                    Text(item.name)
                      .fontColor(this.song.img == item.img?'#d2577c':Color.White)
                      .fontSize(16)
                      .width('100%')

                    Text(item.author)
                      .fontColor(this.song.img == item.img?'#d2577c':Color.White)
                      .fontSize(13)
                      .width('100%')
                  }
                }
                .onClick(()=>{
                  this.song = item
                  AVPlayerManager.playMusic(item)  // 播放一首新歌
                })
                .layoutWeight(1)

                Image($r('app.media.ic_more'))
                  .fillColor(Color.White)
                  .width(20)
              }
              .width('100%')
              .padding({ top: 8, bottom: 8, right: 10 })
            }
          })
        }

      }
      .height(this.h)
      .width('100%')
      .backgroundColor('#ff484747')
      .animation({
        duration:500
      })
    }
  }
}