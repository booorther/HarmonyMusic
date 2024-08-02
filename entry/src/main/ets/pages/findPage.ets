import media from '@ohos.multimedia.media'
import { AVPlayerManager } from '../services/AVPlayerManager'
import emitter from '@ohos.events.emitter'
import { songItemType, songs } from '../model/datas'

@Entry
@Component
export struct FindPage {
  // 歌曲数组列表
  @State songs: songItemType[] = songs
  avplayer: media.AVPlayer

  async aboutToAppear() {
    // 初始化播放器对象
    await AVPlayerManager.init()
  }

  build() {
    Column() {
      // 2. 播放列表(占比2/3)
      Column() {
        // 1. 播放全部
        Row({ space: 10 }) {

          Text('猜你喜欢')
            .fontColor('#e1dddd')
        }
        .width('100%')
        .margin(20)
        .padding({left:20})

        //   2. 歌曲列表
        List() {
          ForEach(this.songs, (item: songItemType, index: number) => {
            ListItem() {
              Row() {
                Image(item.img)
                  .height(50)
                  .borderRadius(10)
                  .margin({ right: 10 })

                Row() {
                  Column({ space: 5 }) {
                    Text(item.name)
                      .width('100%')
                      .fontColor('#e1dddd')

                    Text(item.author)
                      .width('100%')
                      .fontColor('#e1dddd')
                      .fontSize(13)
                  }
                  .layoutWeight(5)

                  Image($r('app.media.ic_more'))
                    .height(30)
                    .fillColor(Color.White)
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
            .margin({left:10,right:10,top:5})
          })


          ListItem() {
            Text('没有更多的歌曲~~~')
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