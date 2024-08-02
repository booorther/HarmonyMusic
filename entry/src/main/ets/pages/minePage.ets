import { songItemType } from '../model/datas'
import { AVPlayerManager } from '../services/AVPlayerManager'
import emitter from '@ohos.events.emitter'

@Entry
@Component
export struct MinePage {
  @State curIndex:number = 0

  aboutToAppear() {
    // AlertDialog.show({message:'ok'})
    this.curIndex = AVPlayerManager.currentIndex

    emitter.on({eventId:0},(eventData)=>{
      // 当切歌的时候更新索引
      this.curIndex = AVPlayerManager.currentIndex
    })
  }

  build() {
    Column() {
      // 歌曲图片列表区域
      // 注意点：1. 固定Scroll  2. 当Scroll里面的内容超出了Scroll的高度，就会自动出滚动效果
      Scroll() {
        Column() {
          GridRow({ columns: 4 }) {
            ForEach(AVPlayerManager.songs, (item: songItemType, index: number) => {
              GridCol() {

                Stack(){
                  Image(item.img)
                    .height(100)
                  // 判断如果遍历到当前的歌曲信息时，这个歌曲正在播放，则显示跳动音符
                  if(this.curIndex == index ){
                    Image($r('app.media.ic_playing'))
                      .height(50)
                  }
                }
                .onClick(()=>{
                  // 当用户点击一首新歌时，要把AVPlayerManager.currentIndex值改为新歌索引index
                  AVPlayerManager.currentIndex = index
                  // this.curIndex = index
                  // 播放歌曲
                  AVPlayerManager.playMusic(item)
                  // this.curIndex = index
                })
              }
            })
            ForEach(AVPlayerManager.songs, (item: songItemType, index: number) => {
              GridCol() {
                Image(item.img)
                  .height(100)
              }
            })
          }
        }
      }
      // .scrollable(ScrollDirection.Horizontal)  //设置滚动方向 垂直或者水平
      .scrollBar(BarState.Off)  // 关闭滚动条
      .layoutWeight(5)

      // 基本信息
      Column({space:10}) {
        //音乐logo，name
        Stack(){
          Column(){
            Image($r('app.media.ic_logo'))
              .width(40)
              .fillColor('#ea136f')
              .objectFit(ImageFit.Fill)
            Text('MyMusic')
              .fontColor(Color.White)
              .fontSize(22)
              .fontWeight(800)
              .fontColor(Color.White)
            Text('freedom')
              .fontColor('#1d8bd7')
              .fontSize(10)
          }
          .alignItems(HorizontalAlign.Center)
        }
        .margin({top:-50})
        .width(100)
        .height(100)
        .borderRadius(50)
        .backgroundColor(Color.Black)
        //我的音乐中文名称
        Row({space:10}){
          Text('我的音乐')
            .fontSize(20)
            .fontColor(Color.White)
            .fontWeight(800)
          Image($r('app.media.ic_vip'))
            .height(30)
        }
        .alignItems(VerticalAlign.Center)

        //我的信息
           Column({space:15}){
             Row({space:10}){
               Row(){
                 Image($r('app.media.ic_girl'))
                   .height(15)
                   .fillColor('#1d8bd7')
                 Text('00后')
                   .fontColor(Color.White)
                   .fontSize(15)
                   .margin({left:5})
               }
               Text('双子座')
                 .fontColor(Color.White)
                 .fontSize(15)
               Text('北京')
                 .fontColor(Color.White)
                 .fontSize(15)
               Text('歌龄:'+'18年')
                 .fontColor(Color.White)
                 .fontSize(15)
             }
             .alignItems(VerticalAlign.Center)
             Row({space:10}){
                 Text('1'+"关注")
                   .fontColor(Color.White)
                   .fontSize(15)
               Text('100W '+"粉丝")
                 .fontColor(Color.White)
                 .fontSize(15)
               Text('16亿'+'点赞')
                 .fontColor(Color.White)
                 .fontSize(15)
             }
             .alignItems(VerticalAlign.Center)
           }



      }
      .layoutWeight(2)


    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }
}