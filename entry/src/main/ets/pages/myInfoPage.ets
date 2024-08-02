@Entry
@Component
struct MyInfoPage {

  build() {
    //我的信息设置
/*    Column(){
      //我的基本信息
      Scroll() {
        Column() {


          Row() {
            Row() {
              Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.jpg')
                .width(40)
                .borderRadius(20)
                .margin({ left: 10 })
              Text('君不乐ANGER')
                .fontSize(20)
                .fontWeight(800)
                .fontColor(Color.White)
              Image($r('app.media.ic_close'))
                .height(20)
                .rotate({
                  angle: -90
                })

            }

            Image($r('app.media.ic_back'))
              .width(30)
              .margin({ right: 10 })
              .fillColor(Color.White)
              .onClick(() => {
                this.myInfoHeight = 0
                this.myInfoWidth = 0

              })

          }
          .margin(15)
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          //我的基本设置
          Column() {
            Stack() {
              Column() {
                Row({ space: 10 }) {
                  Text('超级会员')
                    .fontSize(20)
                    .fontWeight(800)
                    .fontColor(Color.White)
                  Row() {
                    Text('￥' + '4.8' + '续费')
                      .fontColor(Color.Red)
                      .fontSize(10)
                  }
                  .width('20%')
                  .height('20%')
                  .alignItems(VerticalAlign.Center)
                  .borderRadius(12)
                  .backgroundColor(Color.White)
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)

                Text('黑胶时光机 | 音乐之旅 >')
                  .fontSize(13)
                  .width("60%")
                  .fontColor(Color.White)
                  .align(Alignment.Start)
                  .margin({ left: -100, top: 10 })
                Line()
                  .width("90%")
                  .height(1)
                    // .startPoint([0, 0])
                    // .endPoint([0, 100])
                  .stroke(Color.Black)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 15, bottom: 10 })

                Row() {
                  Text('黑胶VIP学生特惠,仅需￥5/月！')
                    .fontColor(Color.White)
                    .fontSize(13)
                  Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.jpg')
                    .width(22)
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')

              }
              .backgroundColor(Color.Gray)
              .margin(10)
              .height(120)
              .borderRadius(10)
              .padding(10)
              .width('96%')
            }
            .margin({ top: -10, left: -10 })

            Row() {
              Row() {
                Text('免')
                  .fontSize(10)
                  .fontColor(Color.White)
                  .backgroundColor('#CD4A40')
                  .width(15)
                  .height(15)
                  .borderRadius(7.5)
                  .textAlign(TextAlign.Center)
                  .margin({ left: 10 })
                Text('看广告免费听VIP歌曲')
                  .fontColor(Color.White)
                  .fontSize(15)
                  .fontWeight(800)
                  .fontStyle(FontStyle.Italic)
              }

              Text('一键开启')
                .fontColor(Color.Red)
                .fontSize(10)
                .fontWeight(800)
                .height(15)
                .width(45)
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
                .margin({ right: 10 })
                .borderRadius(5)


            }
            .width("100%")
            .justifyContent(FlexAlign.SpaceBetween)


            //
          }
          .height(160)
          .backgroundColor("#282832")
          .width('90%')
          .borderRadius(10)

          List(){
            ListItem(){
              Column() {
                //我的消息
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.ic_comment_o'))
                      .width(25)
                      .fillColor(Color.White)
                    Text('我的消息')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })

                  Row({ space: 10 }) {
                    Text("24")
                      .fontSize(10)
                      .fontColor(Color.White)
                      .height(20)
                      .width(20)
                      .borderRadius(10)
                      .backgroundColor(Color.Red)
                      .textAlign(TextAlign.Center)
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)

                Line()
                  .width("90%")
                  .height(0.4)
                  .stroke(Color.White)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 5, bottom: 5 })

                //'云贝中心
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.ic_find'))
                      .width(25)
                    Text('云贝中心')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })

                  Row({ space: 10 }) {
                    Text("欧洲杯竞猜兑会员")
                      .fontSize(10)
                      .fontColor(Color.White)
                      .height(20)
                      .width(100)
                      .borderRadius(10)
                      .borderColor(Color.Red)
                      .borderWidth(1)
                      .textAlign(TextAlign.Center)
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)

                Line()
                  .width("90%")
                  .height(0.3)
                  .stroke(Color.Black)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 5, bottom: 5 })
                //徽章中心
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.ic_collect'))
                      .width(25)
                      .fillColor(Color.White)
                    Text('徽章中心')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })

                  Row({ space: 10 }) {
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)

                Line()
                  .width("90%")
                  .height(0.3)
                  .stroke(Color.Black)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 5, bottom: 5 })
                //创作者中心
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.ic_recommend'))
                      .width(25)
                    Text('创作者中心')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })

                  Row({ space: 10 }) {
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)
              }
              .width("90%")
              .height(200)
              .backgroundColor("#282832")
              .opacity(0.87)
              .margin({ top: 18, bottom: 10 })
              .borderRadius(10)
            }
            //音乐服务
            ListItem(){
              Column() {
                Row() {
                  Row({ space: 10 }) {
                    Text('音乐服务')
                      .fontColor(Color.White)
                      .fontSize(15)
                  }
                  .margin({ left: 10 })

                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)

                Line()
                  .width("90%")
                  .height(0.4)
                  .stroke(Color.White)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 5, bottom: 5 })

                //'免费听歌
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.ic_song_list'))
                      .width(25)
                      .fillColor(Color.White)
                    Text('免费听歌')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })

                  Row({ space: 10 }) {
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                .borderRadius(10)

                Line()
                  .width("90%")
                  .height(0.3)
                  .stroke(Color.Black)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 5, bottom: 5 })
                //云村有票
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.ticket'))
                      .width(25)
                      .fillColor(Color.White)
                    Text('云村有票')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })

                  Row({ space: 10 }) {
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)

                Line()
                  .width("90%")
                  .height(0.3)
                  .stroke(Color.Black)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 5, bottom: 5 })
                //商城
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.buy'))
                      .width(25)
                      .fillColor(Color.White)
                    Text('商城')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })

                  Row({ space: 10 }) {
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                .borderRadius(10)
                Line()
                  .width("90%")
                  .height(0.3)
                  .stroke(Color.Black)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 5, bottom: 5 })
                //设计大赛
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.trophy'))
                      .width(25)
                      .fillColor(Color.White)
                    Text('设计大赛')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })

                  Row({ space: 10 }) {
                    Text("专家评审中")
                      .fontSize(10)
                      .fontColor(Color.White)
                      .height(20)
                      .width(100)
                      .textAlign(TextAlign.Center)
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)
                Line()
                  .width("90%")
                  .height(0.3)
                  .stroke(Color.Black)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 5, bottom: 5 })
                //Beat-专区
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.ic_favorite'))
                      .width(25)
                    Text('Beat-专区')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })
                  Row({ space: 10 }) {
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)
                Line()
                  .width("90%")
                  .height(0.3)
                  .stroke(Color.Black)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 5, bottom: 5 })
                //音乐收藏家
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.colletor'))
                      .width(25)
                    Text('音乐收藏家')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })
                  Row({ space: 10 }) {
                    Text("与音乐人共享收益")
                      .fontSize(10)
                      .fontColor(Color.White)
                      .height(20)
                      .width(100)
                      .textAlign(TextAlign.Center)
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)
                Line()
                  .width("90%")
                  .height(0.3)
                  .stroke(Color.Black)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 5, bottom: 5 })
                //彩铃专区
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.ic_bells_o'))
                      .width(25)
                    Text('彩铃专区')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })
                  Row({ space: 10 }) {
                    Text("pick你的音乐彩铃")
                      .fontSize(10)
                      .fontColor(Color.White)
                      .height(20)
                      .width(100)
                      .textAlign(TextAlign.Center)
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)
                Line()
                  .width("90%")
                  .height(0.3)
                  .stroke(Color.Black)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 5, bottom: 5 })
                //云推歌
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.cloud_song'))
                      .width(25)
                    Text('云推歌')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })

                  Row({ space: 10 }) {
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)
              }
              .width("90%")
              .height(600)
              .backgroundColor("#282832")
              .opacity(0.87)
              .margin({ top: 18, bottom: 10 })
              .borderRadius(10)
            }
            //其他
            ListItem(){
              //其他
              Column() {
                //我的消息
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.ic_share'))
                      .width(25)
                    Text('我的消息')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })

                  Row({ space: 10 }) {
                    Text("24")
                      .fontSize(10)
                      .fontColor(Color.White)
                      .height(20)
                      .width(20)
                      .borderRadius(10)
                      .backgroundColor(Color.Red)
                      .textAlign(TextAlign.Center)
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)

                Line()
                  .width("90%")
                  .height(0.4)
                  .stroke(Color.White)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 5, bottom: 5 })

                //'云贝中心
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.ic_share'))
                      .width(25)
                    Text('云贝中心')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })

                  Row({ space: 10 }) {
                    Text("欧洲杯竞猜兑会员")
                      .fontSize(10)
                      .fontColor(Color.White)
                      .height(20)
                      .width(100)
                      .borderRadius(10)
                      .borderColor(Color.Red)
                      .borderWidth(1)
                      .textAlign(TextAlign.Center)
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)

                Line()
                  .width("90%")
                  .height(0.3)
                  .stroke(Color.Black)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 5, bottom: 5 })
                //徽章中心
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.ic_share'))
                      .width(25)
                    Text('徽章中心')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })

                  Row({ space: 10 }) {
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)

                Line()
                  .width("90%")
                  .height(0.3)
                  .stroke(Color.Black)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 5, bottom: 5 })
                //创作者中心
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.ic_share'))
                      .width(25)
                    Text('创作者中心')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })

                  Row({ space: 10 }) {
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)
              }
              .width("90%")
              .height(200)
              .backgroundColor("#282832")
              .opacity(0.87)
              .margin({ top: 18, bottom: 10 })
              .borderRadius(10)
            }
            //切换/关闭登录
            ListItem(){
              //切换登录和退出
              Column() {
                //切换账号
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.ic_share'))
                      .width(25)
                    Text('切换账号')
                      .fontColor(Color.White)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })

                  Row({ space: 10 }) {
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)

                Line()
                  .width("90%")
                  .height(0.3)
                  .stroke(Color.Black)
                  .backgroundColor('#F5F5F5')
                  .margin({ top: 5, bottom: 5 })
                //退出登录/关闭
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.ic_share'))
                      .width(25)
                    Text('退出登录/关闭')
                      .fontColor(Color.Red)
                      .fontSize(20)
                  }
                  .margin({ left: 10 })

                  Row({ space: 10 }) {
                    Image($r('app.media.ic_close'))
                      .height(20)
                      .rotate({
                        angle: -90
                      })
                  }
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
                .height(40)
                .alignItems(VerticalAlign.Center)
                // .backgroundColor(Color.Blue)
                .borderRadius(10)
              }
              .width("90%")
              .height(200)
              .backgroundColor("#282832")
              .opacity(0.87)
              .margin({ top: 18, bottom: 10 })
              .borderRadius(10)
            }
          }
          .alignListItem(ListItemAlign.Center)

        }
        .width('100%')
        .height('100%')

      }
      .width('100%')
      .height('100%')

    }
    .opacity(0.9)
    .margin({right:80})
    .backgroundColor('#2D2D31')
    .height(this.myInfoHeight)
    .width(this.myInfoWidth)
    .animation({
      duration:300
    })*/
  }
}