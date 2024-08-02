//歌曲数据对象类型
import media from '@ohos.multimedia.media'
import { AVPlayerManager } from '../services/AVPlayerManager'
import emitter from '@ohos.events.emitter'
import { songItemType, songs } from '../model/datas'

@Entry
@Component
export struct MusicPage {
  // 歌曲数组列表
  @State songs: songItemType[] = songs
  avplayer: media.AVPlayer

  async aboutToAppear() {
    // 初始化播放器对象
    await AVPlayerManager.init()
  }

  build() {
    Column() {
      // 1. 信息区(占比1/3)
      Column() {
        Row({ space: 10 }) {
          Column() {
            Image($r('app.media.ic_favorite'))
              .height(60)
              .fillColor('#ec5c87')
          }
          .justifyContent(FlexAlign.Center)
          .width(110)
          .height(110)
          .backgroundColor(Color.White)
          .borderRadius(8)

          Column({ space: 10 }) {
            Text('我喜欢的音乐')
              .fontColor(Color.White)
              .fontSize(18)
              .fontWeight(800)
              .width('100%')

            Text('黑马程序员')
              .fontColor(Color.White)
              .width('100%')
          }
        }
        .width('100%')
        .padding(10)
        .layoutWeight(3)

        Row() {
          Button({ type: ButtonType.Normal }) {
            Row({ space: 10 }) {
              Image($r('app.media.ic_share'))
                .height(20)
                .fillColor('#ffe66666')
              Text('分享')
                .fontColor(Color.White)
                .fontSize(15)
            }
          }
          .width(90)
          .height(40)
          .borderRadius(20)
          .backgroundColor('#ff504f4f')

          Button({ type: ButtonType.Normal }) {
            Row({ space: 10 }) {
              Image($r('app.media.ic_comment'))
                .height(20)
                .fillColor('#ffe66666')
              Text('评论')
                .fontColor(Color.White)
                .fontSize(15)
            }
          }
          .width(90)
          .height(40)
          .borderRadius(20)
          .backgroundColor('#ff504f4f')

          Button({ type: ButtonType.Normal }) {
            Row({ space: 10 }) {
              Image($r('app.media.ic_collect'))
                .height(20)
                .fillColor('#ffe66666')
              Text('收藏')
                .fontColor(Color.White)
                .fontSize(15)
            }
          }
          .width(90)
          .height(40)
          .borderRadius(20)
          .backgroundColor('#ff504f4f')
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('100%')
        .layoutWeight(2)
        // .padding({left:10,right:10})
      }
      .width('100%')
      .layoutWeight(1)
      // 使用径向渐变实现发光的效果
      .radialGradient({
        center: ['140%', '-60%'], // 中心点
        radius: '190%', // 半径
        colors: [
          ['#614410', 0.5], // 颜色1
          [Color.Transparent, 1] // Transparent:透明色
        ] //渐变的颜色
      })

      // 2. 播放列表(占比2/3)
      Column() {
        // 1. 播放全部
        Row({ space: 10 }) {
          Image($r('app.media.ic_play'))
            .height(20)
            .fillColor('#ffee5f5f')

          Text('播放全部(16)')
            .fontColor(Color.White)
        }
        .width('100%')
        .padding(20)

        //   2. 歌曲列表
        List() {
          ForEach(this.songs, (item: songItemType, index: number) => {
            ListItem() {
              Row() {
                Text((index + 1).toString())
                  .width(40)
                  .textAlign(TextAlign.Center)
                  .fontSize(20)
                  .fontWeight(800)
                  .fontColor(
                      (index + 1).toString()=='1'? '#FFEB3B' :
                       (index + 1).toString()=='2'? '#F321E0' :
                        (index + 1).toString()=='3'? '#2196F3':Color.White
                  )

                Image(item.img)
                  .height(50)
                  .borderRadius(10)
                  .margin({ right: 10 })

                Row() {
                  Column({ space: 5 }) {
                    Text(item.name)
                      .width('100%')
                      .fontColor(Color.White)

                    Text(item.author)
                      .width('100%')
                      .fontColor(Color.White)
                      .fontSize(13)
                  }
                  .layoutWeight(5)

                  Image($r('app.media.ic_more'))
                    .height(40)
                    .fillColor(Color.White)
                    .layoutWeight(1)
                }
                .layoutWeight(1) // 表示占满剩下的屏幕宽度
                .justifyContent(FlexAlign.SpaceBetween)

              }
              .width('100%')
              .height(60)
              .onClick(async () => {
                AVPlayerManager.playMusic(item)

                // 将当前页面的歌曲数组赋值给avplaymananger.songs同时当前歌曲的索引赋值给avplaymananger.index
                AVPlayerManager.songs = this.songs
                AVPlayerManager.currentIndex = index



              })
            }
          })


          ListItem() {
            Text('-------------')
              .fontColor(Color.White)
              .width('100%')
              .textAlign(TextAlign.Center)
              .height(60)
          }
          .padding({ bottom: 60 })
        }

      }
      .width('100%')
      .backgroundColor('#353333')
      .layoutWeight(2)
      .borderRadius({ topLeft: 15, topRight: 15 })
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Black)
  }
}