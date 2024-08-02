import { AVPlayerManager } from '../services/AVPlayerManager'
import { FindPage } from './FindPage'
import { MinePage } from './minePage'
import { MomentPage } from './momentPage'
import { MusicPage } from './musicPage'
import { RecommendPage } from './recommendPage'
import emitter from '@ohos.events.emitter'
import router from '@ohos.router'
import { songItemType } from '../model/datas'

@Entry
@Component
struct Index {
  @State curIndex: number = 0
  @State curSong: songItemType = Object() // 准备一个songItemType类型的状态变量

  @State isplaying: boolean = false // false：表示当前歌曲暂停中  true:表示歌曲播放中

  aboutToAppear() {
    //  注册emitter 的on事件，用来监听 emitter.emit发送过来的数据
    emitter.on({ eventId: 0 }, (eventData) => {
      console.log('mylog->emitter接收数据：', JSON.stringify(eventData))
      this.curSong = eventData.data as songItemType
      this.isplaying = AVPlayerManager.isplaying
    })
  }

  @Builder
  tabBuilder(txt: string, img: Resource, index: number) {
    Column({ space: 5 }) {
      Image(img)
        .height(25)
        .fillColor(this.curIndex == index ? '#ffffff' : '#4bb0c4')
        .backgroundColor(this.curIndex == index ? '#ec5c87' : '')
        .borderRadius(13)
        .padding(3)

      Text(txt)
        .fontColor(this.curIndex == index ? '#ec5c87' : '#4bb0c4')
    }
    .padding(5)
  }

  build() {

    Column() {
      //  首页承载的功能
      Stack({ alignContent: Alignment.Bottom }) {
        //   1. tab栏
        Tabs() {
          // 推荐
          TabContent() {
            // 这个部分是用来显示内容的，将来我们是要放页面的
            //  现在使用Text来显示占位
            // 使用页面(自动导入)
            RecommendPage()
          }
          .backgroundColor(Color.Black) //设置内容背景色为黑色
          .tabBar(this.tabBuilder('推荐', $r('app.media.ic_recommend'), 0))

          // 发现
          TabContent() {
            // 这个部分是用来显示内容的，将来我们是要放页面的
            //  现在使用Text来显示占位
            // @ts-ignore
            FindPage()
          }
          .backgroundColor(Color.Black) //设置内容背景色为黑色
          .tabBar(this.tabBuilder('发现', $r('app.media.ic_find'), 1))

          //   music
          TabContent() {

            MusicPage()
          }
          .backgroundColor(Color.Black)
          .tabBar(this.tabBuilder('music', $r('app.media.ic_music'), 2))


          //   动态
          TabContent() {

            MomentPage()
          }
          .backgroundColor(Color.Black)
          .tabBar(this.tabBuilder('动态', $r('app.media.ic_moment'), 3))


          //   我的
          TabContent() {

            if (this.curIndex == 4) {
              MinePage()
            }
            // MinePage()
          }
          .backgroundColor(Color.Black)
          .tabBar(this.tabBuilder('我的', $r('app.media.ic_mine'), 4))

        }
        .barHeight(65) //调整bar的高度
        .barPosition(BarPosition.End)
        .backgroundColor('#ff3e3e3e')
        .onChange((index: number) => {
          this.curIndex = index
        })

        //   2. 播放歌曲的基本信息
        Row() {
          // 歌曲信息
          Row({ space: 5 }) {
            Image(this.curSong.img)
              .height(50)
              .borderRadius(10)

            Column() {
              Text(this.curSong.name)
                .fontColor(Color.White)
                .width('100%')
              Text(this.curSong.author)
                .fontColor(Color.White)
                .fontSize(12)
                .width('100%')
            }
          }
          .layoutWeight(1)

          // 播放控制
          Row({ space: 10 }) {
            Image($r('app.media.ic_prev'))
              .height(30)
              .fillColor(Color.White)
              .onClick(() => {
                //   上一首
                AVPlayerManager.preMusic()
              })

            Image(this.isplaying == true ? $r('app.media.ic_paused') : $r('app.media.ic_play'))
              .height(30)
              .fillColor(Color.White)
              .onClick(() => {
                // 取反 ->播放和暂停来回切换
                this.isplaying = !this.isplaying

                if (this.isplaying == true) {
                  //  播放歌曲
                  AVPlayerManager.reWork()
                } else {
                  //    暂停歌曲
                  AVPlayerManager.pause()
                }
              })

            Image($r('app.media.ic_next'))
              .height(30)
              .fillColor(Color.White)
              .onClick(() => {
                AVPlayerManager.nextMusic() //下一首
              })
          }
          .width(120)

        }
        .backgroundColor(Color.Black)
        .width('100%')
        .height(60)
        .margin({ bottom: 60 })
        .padding({ left: 10 })
        .onClick(() => {
          router.pushUrl({ url: 'pages/playPage' })
        })
      }
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Black)

  }
}