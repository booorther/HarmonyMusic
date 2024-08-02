import router from '@ohos.router'
@Entry
@Component
struct MyMessagePage {
  @State message: string = 'Hello World'

  build() {
    Column(){
      //消息头部
      Row(){
        //消息头部-左
       Row({space:15}){
         Image($r('app.media.ic_close'))
           .height(20)
           .rotate({
             angle: 90
           })
           .onClick(()=>{
             router.replaceUrl({url:'pages/Index'})
           })
         Text('消息')
           .fontColor(Color.White)
           .fontSize(20)
           .fontWeight(800)
       }
        //消息头部-右
        Row({space:10}){
          Text('标记为已读')
            .fontColor(Color.White)
            .fontSize(15)
            .height(28)
            .width('28%')
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .borderColor(Color.White)
            .borderWidth(1)
          Image($r('app.media.ic_search'))
            .width(30)
            .fillColor(Color.White)

        }

      }
      .layoutWeight(1)
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .backgroundColor(Color.Black)
      .padding({left:10,right:10})
      //消息的，粉丝，评论，@我，通知
      Row(){
        //粉丝
        Column({space:10}){
          Column(){
            Image($r('app.media.user_head'))
              .width(40)
              .fillColor(Color.White)
              .margin({top:8})
          }
          .height(60)
          .width(60)
          .borderRadius(30)
          .backgroundColor('#DD3527')
          Text('粉丝')
            .fontColor(Color.White)
            .fontSize(15)
        }
        //评论
        Column({space:10}){
          Column(){
            Image($r('app.media.my_message'))
              .width(40)
              .fillColor(Color.White)
              .margin({top:8})
          }
          .height(60)
          .width(60)
          .borderRadius(30)
          .backgroundColor('#3994DB')
          Text('评论')
            .fontColor(Color.White)
            .fontSize(15)
        }
        //@我
        Column({space:10}){
          Column(){
            Image($r('app.media.myAt'))
              .width(40)
              .fillColor(Color.White)
              .margin({top:8})
          }
          .height(60)
          .width(60)
          .borderRadius(30)
          .backgroundColor('#DD6B20')
          Text('@我')
            .fontColor(Color.White)
            .fontSize(15)
        }
        //通知
        Column({space:10}){
          Column(){
            Image($r('app.media.ic_bells_o'))
              .width(40)
              .fillColor(Color.White)
              .margin({top:8})
          }
          .height(60)
          .width(60)
          .borderRadius(30)
          .backgroundColor('#DFCF42')
          Text('通知')
            .fontColor(Color.White)
            .fontSize(15)
        }


      }
      .backgroundColor('')
      .layoutWeight(2)
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
      //消息列表
      Column(){
        List(){
          ListItem(){
            Row(){
              Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.jpg')
                .width(60)
                .height(60)
                .borderRadius(30)
              Column({space:15}){
                Row(){
                  Text('官方号消息')
                    .fontColor(Color.White)
                    .fontSize(15)
                    .fontWeight(800)
                  Text('6月19')
                    .fontColor(Color.White)
                    .fontSize(10)
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
                Row(){
                  Text('[18条消息]云贝小助手：恭喜你获取50个欧洲杯竟...')
                    .fontSize(10)
                    .fontColor(Color.White)
                  Text(' ')
                    .fontSize(10)
                    .fontColor(Color.White)
                    .height(10)
                    .width(10)
                    .borderRadius(10)
                    .backgroundColor(Color.Red)
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
              }
              .width('84%')
              .padding(15)
              .alignItems(HorizontalAlign.Center)
              .height('85%')
              .borderWidth({bottom:1})
              .borderColor(Color.Gray)


            }
            .width('92%')
            .margin(10)
            .height(90)
            // .backgroundColor(Color.Gray)
            .border({width:1})
            //.borderWidth(5)
            //.borderColor(Color.Red)

          }
          .width('100%')

          //云音乐vip
          ListItem(){
            Row(){
              Row(){
                Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.jpg')
                  .width(60)
                  .height(60)
                  .borderRadius(30)
                Stack(){
                  Text("V")
                    .fontColor(Color.White)
                    .fontSize(10)
                    .fontWeight(800)
                    .width(15)
                    .height(15)
                    .backgroundColor(Color.Red)
                    .borderRadius(15)
                    .textAlign(TextAlign.Center)
                }
                .margin({bottom:-50,left:-20})
              }
              Column({space:15}){
                Row(){
                  Text('云音乐VIP')
                    .fontColor(Color.White)
                    .fontSize(15)
                    .fontWeight(800)
                  Text('3月12')
                    .fontColor(Color.White)
                    .fontSize(10)
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
                Row(){
                  Text('n你的黑胶VIP过期很久了喽，续费可享限时优...')
                    .fontSize(10)
                    .fontColor(Color.White)
                  Text('9')
                    .fontSize(10)
                    .fontColor(Color.White)
                    .height(15)
                    .width(15)
                    .borderRadius(10)
                    .backgroundColor(Color.Red)
                    .textAlign(TextAlign.Center)
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
              }
              .width('84%')
              .padding(15)
              .alignItems(HorizontalAlign.Center)
              .height('85%')
              .borderWidth({bottom:1})
              .borderColor(Color.Gray)


            }
            .width('92%')
            .margin(10)
            .height(90)
            // .backgroundColor(Color.Gray)
            .border({width:1})
            //.borderWidth(5)
            //.borderColor(Color.Red)

          }
          .width('100%')

          //云音乐小秘书
          ListItem(){
            Row(){
             Row(){
               Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.jpg')
                 .width(60)
                 .height(60)
                 .borderRadius(30)
               Stack(){
                 Text("V")
                   .fontColor(Color.White)
                   .fontSize(10)
                   .fontWeight(800)
                   .width(15)
                   .height(15)
                   .backgroundColor(Color.Red)
                   .borderRadius(15)
                   .textAlign(TextAlign.Center)
               }
               .margin({bottom:-50,left:-20})
             }
              Column({space:15}){
                Row(){
                  Text('云音乐小秘书')
                    .fontColor(Color.White)
                    .fontSize(15)
                    .fontWeight(800)
                  Text('1月27')
                    .fontColor(Color.White)
                    .fontSize(10)
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
                Row(){
                  Text('恭喜你获取3天网易云音乐黑胶VIP')
                    .fontSize(10)
                    .fontColor(Color.White)
                  Text('10')
                    .fontSize(10)
                    .fontColor(Color.White)
                    .height(15)
                    .width(15)
                    .borderRadius(10)
                    .backgroundColor(Color.Red)
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
              }
              .width('84%')
              .padding(15)
              .alignItems(HorizontalAlign.Center)
              .height('85%')
              .borderWidth({bottom:1})
              .borderColor(Color.Gray)



              // Stack(){
              //   Line()
              //     .width("90%")
              //     .height(1)
              //       // .startPoint([0, 0])
              //       // .endPoint([0, 100])
              //     .stroke('#484242')
              //     .backgroundColor('#484242')
              //     .margin({ top: 5, bottom: 5 })
              // }

            }
            .width('92%')
            .margin(10)
            .height(90)
            // .backgroundColor(Color.Gray)
            .border({width:1})
            //.borderWidth(5)
            //.borderColor(Color.Red)

          }
          .width('100%')

          //网易云音乐
          ListItem(){
            Row(){
              Row(){
                Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.jpg')
                  .width(60)
                  .height(60)
                  .borderRadius(30)
                Stack(){
                  Text("V")
                    .fontColor(Color.White)
                    .fontSize(10)
                    .fontWeight(800)
                    .width(15)
                    .height(15)
                    .backgroundColor(Color.Red)
                    .borderRadius(15)
                    .textAlign(TextAlign.Center)
                }
                .margin({bottom:-50,left:-20})
              }
              Column({space:15}){
                Row(){
                  Text('网易云音乐')
                    .fontColor(Color.White)
                    .fontSize(15)
                    .fontWeight(800)
                  Text('2022年2月3')
                    .fontColor(Color.White)
                    .fontSize(10)
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
                Row(){
                  Text('分享专辑[我们的春晚]:我的最新专辑是...')
                    .fontSize(10)
                    .fontColor(Color.White)
                  Text('3')
                    .fontSize(10)
                    .fontColor(Color.White)
                    .height(15)
                    .width(15)
                    .borderRadius(10)
                    .backgroundColor(Color.Red)
                    .textAlign(TextAlign.Center)
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
              }
              .width('84%')
              .padding(15)
              .alignItems(HorizontalAlign.Center)
              .height('85%')
              .borderWidth({bottom:1})
              .borderColor(Color.Gray)


              // Stack(){
              //   Line()
              //     .width("90%")
              //     .height(1)
              //       // .startPoint([0, 0])
              //       // .endPoint([0, 100])
              //     .stroke('#484242')
              //     .backgroundColor('#484242')
              //     .margin({ top: 5, bottom: 5 })
              // }

            }
            .width('92%')
            .margin(10)
            .height(90)
            // .backgroundColor(Color.Gray)
            .border({width:1})
            //.borderWidth(5)
            //.borderColor(Color.Red)

          }
          .width('100%')

          //两难万仇
          ListItem(){
            Row(){
              Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.jpg')
                .width(60)
                .height(60)
                .borderRadius(30)
              Column({space:15}){
                Row(){
                  Text('两难万仇')
                    .fontColor(Color.White)
                    .fontSize(15)
                    .fontWeight(800)
                  Text('2021年9月29')
                    .fontColor(Color.White)
                    .fontSize(10)
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
                Row(){
                  Text('晚上好')
                    .fontSize(10)
                    .fontColor(Color.White)
                  Text(' ')
                    .fontSize(10)
                    .fontColor(Color.White)
                    .height(15)
                    .width(15)
                    .borderRadius(10)
                    .backgroundColor(Color.Black)
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
              }
              .width('84%')
              .padding(15)
              .alignItems(HorizontalAlign.Center)
              .height('85%')
              .borderWidth({bottom:1})
              .borderColor(Color.Gray)



              // Stack(){
              //   Line()
              //     .width("90%")
              //     .height(1)
              //       // .startPoint([0, 0])
              //       // .endPoint([0, 100])
              //     .stroke('#484242')
              //     .backgroundColor('#484242')
              //     .margin({ top: 5, bottom: 5 })
              // }

            }
            .width('92%')
            .margin(10)
            .height(90)
            // .backgroundColor(Color.Gray)
            .border({width:1})
            //.borderWidth(5)
            //.borderColor(Color.Red)

          }
          .width('100%')

          //云村大喇叭
          ListItem(){
            Row(){
              Row(){
                Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.jpg')
                  .width(60)
                  .height(60)
                  .borderRadius(30)
                Stack(){
                  Text("V")
                    .fontColor(Color.White)
                    .fontSize(10)
                    .fontWeight(800)
                    .width(15)
                    .height(15)
                    .backgroundColor(Color.Red)
                    .borderRadius(15)
                    .textAlign(TextAlign.Center)
                }
                .margin({bottom:-50,left:-20})

              }
              Column({space:15}){
                Row(){
                  Text('云村大喇叭')
                    .fontColor(Color.White)
                    .fontSize(15)
                    .fontWeight(800)
                  Text('2020年3月14')
                    .fontColor(Color.White)
                    .fontSize(10)
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
                Row(){
                  Text('每一首歌都像一台时间机器，带着一段记忆...')
                    .fontSize(10)
                    .fontColor(Color.White)
                  Text('1')
                    .fontSize(10)
                    .fontColor(Color.White)
                    .height(15)
                    .width(15)
                    .borderRadius(10)
                    .backgroundColor(Color.Red)
                    .textAlign(TextAlign.Center)
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
              }
              .width('84%')
              .padding(15)
              .alignItems(HorizontalAlign.Center)
              .height('85%')
              .borderWidth({bottom:1})
              .borderColor(Color.Gray)


            }
            .width('92%')
            .margin(10)
            .height(90)
            // .backgroundColor(Color.Gray)
            .border({width:1})
            //.borderWidth(5)
            //.borderColor(Color.Red)

          }
          .width('100%')




          //////
        }
        .width('100%')
        .height('100%')




      }
      .layoutWeight(8)
      .width('100%')


    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)

  }
}