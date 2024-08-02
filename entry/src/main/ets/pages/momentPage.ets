import promptAction from '@ohos.promptAction'
import { momentList } from '../constants'
import { momentListType } from '../models'
import { AVPlayerManager } from '../services/AVPlayerManager'
import AVPlayerClass from '../utils/AVPlayerClass'

@Entry
@Component
export struct MomentPage {
  //暴力求解
  @State isTrueArray: boolean[] = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
  @State numberArray: number[] = [1231,233,4243,33,143,12,44,46,553,856,17,82,21,23,42,48]
  build() {
    Column() {
      Row() {
        Text('互动广场')
          .fontColor('#eaeaec')
      }
      .padding(24)
      .width('100%')
      Row() {
        List({ space: 12 }) {
          ForEach(momentList, (item: momentListType, index: number) => {
            ListItem() {
              Row({ space: 12 }) {
                Row() {
                  Image(item.avatar)
                    .borderRadius(40)
                    .width(40)
                }

                Column({ space: 12 }) {
                  // 作者
                  Text(item.author)
                    .fontColor('#e9e9e7')
                  // 内容
                  Text(item.content)
                    .fontColor('#aaa9af')
                    .fontSize(12)
                  // 音乐卡片
                  Row() {
                    Image(item.song.img)
                      .width(60)
                      .aspectRatio(1)
                    Column({ space: 10 }) {
                      Text(item.song.name)
                        .fontColor('#f4f4f6')
                        .fontSize(12)
                      Text(item.song.author)
                        .fontColor('#a8a8ad')
                        .fontSize(10)
                    }
                    .layoutWeight(1)
                    .height(60)
                    .alignItems(HorizontalAlign.Start)
                    .justifyContent(FlexAlign.SpaceBetween)
                    .padding(12)
                    Image($r("app.media.ic_single_play"))
                      .width(20)
                      .fillColor('#ececec')
                      .margin({ right: 12 })
                  }
                  .backgroundColor('#46474c')
                  .width('100%')
                  .borderRadius(8)
                  .clip(true)
                  .onClick(()=>{
                    // AVPlayerClass.singlePlay(item.song)
                    AVPlayerManager.playMusic(item.song)
                    AVPlayerManager.currentIndex=index


                  })

                  Row({ space: 20 }) {
                    Row() {
                      Image($r('app.media.ic_share'))
                        .width(20)
                        .fillColor('#c9c8cd')
                      Text('分享')
                        .fontColor('#9e9da2')
                        .fontSize(12)
                        .margin({ left: 4 })
                    }

                    Row() {
                      Image($r('app.media.ic_comment_o'))
                        .width(20)
                        .fillColor('#c9c8cd')
                      Text(item.comment.toString())
                        .fontColor('#9e9da2')
                        .fontSize(12)
                        .margin({ left: 4 })
                    }

                    Row() {
                      Image($r('app.media.ic_like'))
                        .width(20)
                        .fillColor((this.isTrueArray[index]) ? Color.Red : Color.White)
                        //解决函数的二义性
                        .onClick(() => {
                          this.isTrueArray[index] = !this.isTrueArray[index]
                          if (this.isTrueArray[index]) this.numberArray[index]++
                          else if (!this.isTrueArray[index]) this.numberArray[index]--

                          //弹窗显示
                          promptAction.showToast({
                            message:( (this.isTrueArray[index]) ? '谢谢您对黑马云音乐的支持' : '我们一定会做得更好的'),
                            duration: 3000,
                            bottom:320
                          }
                          )
                        })

                      Text(this.numberArray[index].toString())
                        .fontColor('#9e9da2')
                        .fontSize(12)
                        .margin({ left: 4 })
                    }
                  }
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)
              }
              .alignItems(VerticalAlign.Top)
              .padding({
                top: 24,
                bottom: 24
              })
              .borderWidth({
                bottom: 1
              })
              .borderColor('#292931')
            }
          })
          ListItem() {
            Row() {
              Text('我是有底线的~')
                .fontColor(Color.Gray)
            }
            .width('100%')
            .justifyContent(FlexAlign.Center)
            .padding(16)
          }
        }
        .width('100%')
        .height('100%')
        .padding({ right: 32, left: 16})

      }
      .layoutWeight(1)
    }
    .backgroundColor(Color.Black)
    .width('100%')
    .height('100%')
  }
}
