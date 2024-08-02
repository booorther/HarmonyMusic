import media from '@ohos.multimedia.media'
import emitter from '@ohos.events.emitter'
import { AVPlayerManager } from '../services/AVPlayerManager'
//歌曲数据对象类型
export interface songItemType {
  img: string
  name: string
  author: string
  url: string
  id: string
}
@Entry
@Component
export struct HeimaMUsicPage {
  // 歌曲数组列表
  @State songs: songItemType[] = [
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/0.jpg',
      name: '直到世界的尽头',
      author: 'WANDS',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/0.m4a',
      id: '0000'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.jpg',
      name: '画',
      author: '赵磊',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.mp3',
      id: '0001'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.jpg',
      name: 'Sweet Dreams',
      author: 'TPaul Sax / Eurythmics',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.mp3',
      id: '0002'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.jpg',
      name: '奢香夫人',
      author: '凤凰传奇',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.m4a',
      id: '0003'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.jpg',
      name: '空心',
      author: '光泽',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.mp3',
      id: '0004'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.jpg',
      name: '反转地球',
      author: '潘玮柏',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.mp3',
      id: '0005'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/6.jpg',
      name: 'No.9',
      author: 'T-ara',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/6.m4a',
      id: '0006'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/7.jpg',
      name: '孤独',
      author: 'G.E.M.邓紫棋',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/7.m4a',
      id: '0007'
    },

    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/8.jpg',
      name: 'Lose Control',
      author: 'Hedley',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/8.m4a',
      id: '0008'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.jpg',
      name: '倩女幽魂',
      author: '张国荣',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.m4a',
      id: '0009'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/10.jpg',
      name: '北京北京',
      author: '汪峰',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/10.m4a',
      id: '0010'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.jpg',
      name: '苦笑',
      author: '汪苏泷',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.mp3',
      id: '0011'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.jpg',
      name: '一生所爱',
      author: '卢冠廷 / 莫文蔚',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.m4a',
      id: '0012'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.jpg',
      name: '月半小夜曲',
      author: '李克勤',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.mp3',
      id: '0013'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.jpg',
      name: 'Rolling in the Deep',
      author: 'Adele',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.m4a',
      id: '0014'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.jpg',
      name: '海阔天空',
      author: 'Beyond',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.m4a',
      id: '0015'
    }
  ]

  async  aboutToAppear() {
    await AVPlayerManager.init()
  }


  build() {
    Column() {
      Column() {
        Row({space: 10}) {
          Column() {
            Image($r('app.media.ic_favorite'))
              .height(70)
              .fillColor('#ec5c87')
          }
          .borderRadius(14)
          .justifyContent(FlexAlign.Center)
          .width(110)
          .height(110)
          .backgroundColor(Color.White)

          Column({space: 10}) {
            Text('我喜欢的音乐')
              .fontColor(Color.White)
              .fontWeight(800)
              .width('100%')
              .fontSize(20)
            Row() {
              Text('黑马程序员')
                .width('100%')
                .fontSize(14)
                .fontColor(Color.Gray)
            }
          }
        }
        .height('70%')
        Column() {
          Row({space: 10}) {
            Button({type: ButtonType.Normal}) {
              Row() {
                Image($r('app.media.ic_share'))
                  .height(20)
                  .margin({left: 12})
                  .fillColor('#e6ee5f5f')
                Text('分享')
                  .fontSize(15)
                  .fontColor(Color.White)
                  .margin({left: 5, right: 12})
              }
            }
            .height(40)
            .width(80)
            .borderRadius(20)
            .backgroundColor(Color.Gray)
            Button({type: ButtonType.Normal}) {
              Row() {
                Image($r('app.media.ic_comment'))
                  .height(20)
                  .margin({left: 12})
                  .fillColor('#e6ee5f5f')
                Text('评论')
                  .fontSize(15)
                  .fontColor(Color.White)
                  .margin({left: 5, right: 12})
              }
            }
            .height(40)
            .width(80)
            .borderRadius(20)
            .backgroundColor(Color.Gray)
            Button({type: ButtonType.Normal}) {
              Row() {
                Image($r('app.media.ic_collect'))
                  .height(20)
                  .margin({left: 12})
                  .fillColor('#e6ee5f5f')
                Text('收藏')
                  .fontSize(15)
                  .fontColor(Color.White)
                  .margin({left: 5, right: 12})
              }
            }
            .height(40)
            .width(80)
            .borderRadius(20)
            .backgroundColor(Color.Gray)
          }
          .width('100%')
          .height('30%')
          .justifyContent(FlexAlign.SpaceAround)
          //.layoutWeight(1)
        }
        .width('100%')
        .height('100%')
      }
      .width('100%')
      .layoutWeight(1)
      .borderRadius({bottomLeft:15, bottomRight:15})
      .radialGradient({
        center: ['190%','-60%'],
        radius: '240%',
        colors: [
          ['#e614410', 0.5],
          [Color.Transparent, 1]]
      })
      Column(){
        Row({space: 10}) {
          Image($r('app.media.ic_play'))
            .height(20)
            .fillColor('#ffee5f5f')
          Text('播放全部（16）')
            .fontColor(Color.White)
        }
        .width('100%')
        .padding(20)
        List() {
          ForEach(this.songs, (item: songItemType, index: number) => {
            ListItem() {
              Row({space: 10}) {
                Text((index + 1).toString())
                  .width(40)
                  .textAlign(TextAlign.Center)
                  .fontSize(20)
                  .fontWeight(800)
                  .fontColor(Color.White)
                Image(item.img)
                  .height(50)
                  .borderRadius(12)
                  .margin({right: 10})
                Row() {
                  Column({space: 5}) {
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
                    .fillColor(Color.Red)
                    .layoutWeight(1)
                }
                .layoutWeight(1) //占满剩下的屏幕
                .justifyContent(FlexAlign.SpaceBetween)
              }
              .width('100%')
              .height(60)
              .onClick(async ()=>{
                AVPlayerManager.playMusic(item)

                //emitter.emit
                emitter.emit({eventId:0},{
                  data:{
                    img:item.img,
                    name:item.name,
                    author:item.author
                  }
                })
              })

            }
          })
          //补一个item
          ListItem() {
            Text('我是有底线的---')
              .fontColor(Color.White)
              .width('100%')
              .textAlign(TextAlign.Center)
          }
          .padding({bottom: 60})

        }
      }
      .width('100%')
      .backgroundColor('#353333')
      .layoutWeight(2)
      .borderRadius({topLeft:15, topRight:15})
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }
}