import { TestType } from '@ohos/hypium'
import { dailyRecommend, recommendDailyType, recommendList, recommendListType, songItemType, songs, swiperList } from '../model/datas'
import { AVPlayerManager } from '../services/AVPlayerManager'
//app
import app from '@system.app';
import router from '@ohos.router';
@Entry
@Component
  // export导出页面
export struct RecommendPage {
  @State musicName:string = '只因你太美🔥'
  @State keyword:string = ''
  songIndex:number = 0
  timeid:number = -1
  @State searchHeight:string = '0%'
  @State musicList:songItemType[] = songs

  @State myInfoHeight:number=0
  @State myInfoWidth:number=0

  //间隔记时器,我的信息中文字切换
  @State sec: number = 1
  textTime:number = 2
  @State describe:string=''


  // 负责过滤歌曲数据
  searchMusicList(){
    // 根据搜索条件获取符合条件的歌曲数据数组
    // includes模糊查找
    // '直到世界的'.includes('世界') -> true
    // '直到世界的'.includes('s') -> false
    let newArr =  AVPlayerManager.songs.filter(item=>item.name.includes(this.keyword))
    this.musicList = newArr
  }

  // 进入页面执行
  aboutToAppear(){
    this.timeid = setInterval(()=>{
      // 从songs数组中每隔1秒钟取一个进行显示
      let song = AVPlayerManager.songs[this.songIndex]
      this.musicName =  song.name

      this.songIndex++
      if(this.songIndex >= AVPlayerManager.songs.length){
        this.songIndex = 0
      }
    },5000)
    //设置我的信息中文字切换定时器
    this.textTime =  setInterval(
      () => {
        this.sec++ //时间减1
        if(this.sec%3== 0 && this.sec!=6){
          this.describe='重启会员成长之路 >'
        }else if (this.sec%5==0) {
          this.describe="点击恢复20项+专项特技 >"
        }else if (this.sec%7==0){
          this.describe='黑胶时光机 | 音乐之旅🔥'
          this.sec=0
        }
        if (this.sec==8) {//防泄露
          this.sec=1
        }
      },
      500)
  }

  // 销毁页面前执行
  aboutToDisappear(){
    // 关闭定时器
    clearInterval(this.timeid)
  }

  // 搜索框自定义构建函数
  @Builder
  searchBuilder() {
    Row() {
      // 左边的搜索图标和文字
      Row({ space: 5 }) {
        Image($r('app.media.ic_search'))
          .height(25)
          .fillColor(Color.White)

        Text(this.musicName)
          .fontColor(Color.White)
          .height('100%')
          .width('80%')
          .onClick(()=>{
            //   打开搜索页面
            //  打开一个容器层
            this.searchHeight = '95%'
            // 将当前的歌曲名称赋值给搜索关键字变量
            this.keyword = this.musicName

            this.searchMusicList() //获取过滤后的数据
          })
      }

      //   右边的扫码图标
      Image($r('app.media.ic_code'))
        .height(25)
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ left: 10, right: 10 })
    .width('80%')
    .height(50)
    .backgroundColor('#ff444242')
    .borderRadius(20)
  }

  // 轮播图
  @Builder
  swiperBuilder() {
    Swiper() {
      ForEach(swiperList, (imgUrl: string) => {
        Image(imgUrl)
          .height(200)
          .objectFit(ImageFit.Fill)
      })
    }
    .borderRadius(8)
  }

  // title显示
  @Builder
  titleBuilder(title: string) {
    Row() {
      Text(title)
        .fontColor(Color.White)
        .fontSize(23)
        .fontWeight(800)

      Text('更多')
        .fontWeight(600)
        .fontSize(23)
        .fontColor('#ffb6b1b1')
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }

  // 每日推荐
  @Builder
  dayTopBuilder() {
    // Scroll组件天生自带滚动效果-> 让自身的宽度固定 + Scroll里面的内容如果超出了自身宽度就会自动出现滚动条
    Scroll() {
      Row({space:5}) {
        ForEach(dailyRecommend, (item:recommendDailyType) => {
          Column() {
            Text(item.type)
              .fontColor(Color.White)
              .backgroundColor(item.top)
              .width('100%')
              .padding(10)
              .fontWeight(700)
              .borderRadius({topLeft:10,topRight:10})

            Image(item.img)
              .height(150)

            Text(item.title)
              .fontColor(Color.White)
              .backgroundColor(item.bottom)
              .maxLines(2)
              .textOverflow({overflow:TextOverflow.Ellipsis})
              .fontSize(12)
              .padding(8)
              .borderRadius({bottomLeft:10,bottomRight:10})
          }
          .height(240)
          .width('40%')
          // .backgroundColor(Color.Pink)
        })
      }
    }
    .scrollable(ScrollDirection.Horizontal) //让scroll组件变为水平滚动
    .scrollBar(BarState.Off) //关闭滚动条
    .width('100%') // 要固定Scroll组件的宽度
  }

  // 推荐歌单
  @Builder
  topMusicListBuilder() {
    Scroll(){
      Row({space:10}){
        ForEach(recommendList,(item:recommendListType)=>{
          Column(){
            Stack({alignContent:Alignment.TopStart}){
              Image(item.img)
                .height(100)
              Text(item.count)
                .fontColor(Color.White)
                .fontWeight(800)
                .margin({top:5,left:5})
            }

            Text(item.title)
              .fontColor(Color.White)
              .padding(5)
              .fontSize(12)
              .maxLines(2)
              .textOverflow({overflow:TextOverflow.Ellipsis})
          }
          .width('30%')
          .height(150)
        })
      }
    }
    .width('100%')
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off) //关闭滚动条
    .margin({bottom:50})
  }

  build() {
    Stack({alignContent:Alignment.Top}){
      Scroll(){
        Column({ space: 15 }) {
          Row(){
            Image($r('app.media.ic_list'))
              .fillColor(Color.White)
              .width(30)
              .margin({right:'10%'})
              .onClick(()=>{
                this.myInfoHeight=800
                this.myInfoWidth= 300

              })
            this.searchBuilder()
          }
          this.swiperBuilder()
          this.titleBuilder('每日推荐')
          this.dayTopBuilder()
          this.titleBuilder('推荐歌单')
          this.topMusicListBuilder()
        }
        .padding(15)
        // .height('100%')
        .width('100%')
        .backgroundColor(Color.Black)
      }
      .height('100%')

      // 搜索页面弹层
      Column(){
        // 搜索框和返回图片
        Row({space:10}){
          Image($r('app.media.ic_back'))  //关闭搜索面板
            .height(this.searchHeight =='0%'?0: 30)
            .fillColor(Color.White)
            .onClick(()=>{
              this.searchHeight = '0%'
            })

          //  文本框
          TextInput({text:this.keyword})
            .layoutWeight(1)
            .backgroundColor('#ff696666')
            .onChange(value=>{
              console.log('mylog:',value)
              this.keyword = value
            })
            .onSubmit(()=>{
              // AlertDialog.show({message:this.keyword})
              console.log('mylog:',this.keyword)
              this.searchMusicList()
            })

        }
        .padding(10)
        .width('100%')

        // List
        List(){
          ForEach(this.musicList,(item:songItemType,index:number)=>{
            ListItem(){
              Row() {
                Text((index + 1).toString())
                  .width(40)
                  .textAlign(TextAlign.Center)
                  .fontSize(20)
                  .fontWeight(800)
                  .fontColor(Color.White)

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
                  .onClick(()=>{
                    AVPlayerManager.playMusic(item)
                    AVPlayerManager.currentIndex=index

                  })

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
            }
          })
        }
      }
      .height(this.searchHeight)
      .width('100%')
      .animation({duration:200})
      //  线性渐变
      .linearGradient({
        colors:[
          ['#7f7979',0.1],
          // ['#b33038',0.2],
          // ['#b33038',0.3],
          ['#b33038',1]
        ]
      })

      //我的信息设置
      Column(){
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
                      .fontColor('#FFEB3B')
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

                  Text(this.describe)
                    .fontSize(13)
                    // .width("60%")
                    .fontColor(Color.White)
                    .align(Alignment.Start)
                    .margin({ left: -100, top: 10 })
                    .textAlign(TextAlign.Start)

                  Line()
                    .width("90%")
                    .height(0.5)
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
            // .backgroundColor("#282832")
            .backgroundColor('#3E3E41')
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
                // .borderWidth({bottom:1})
                // .borderColor(Color.Gray)
                .onClick(()=>{
                  router.replaceUrl({url:"pages/myMessagePage"})
                })

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
                  .height(0.5)
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
              .opacity(0.85)
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
                  .height(0.5)
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
                  .height(0.5)
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
                      .fillColor(Color.White)
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
                      .fillColor(Color.White)
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
              // .height(600)
              .backgroundColor("#282832")
              .opacity(0.85)
              .margin({ top: 18, bottom: 10 })
              .borderRadius(10)
            }
/*            //其他
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
            }*/
            //切换/关闭登录
            ListItem(){
              //切换登录和退出
              Column() {
                //切换账号
                Row() {
                  Row({ space: 10 }) {
                    Image($r('app.media.replace'))
                      .width(25)
                      .fillColor(Color.White)
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
                    Image($r('app.media.close_down'))
                      .width(25)
                      .fillColor(Color.Red)
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
                .onClick(()=>{
                  app.terminate()
                })
              }
              .width("90%")
              .height(300)
              .backgroundColor("#282832")
              .opacity(0.85)
              .margin({ top: 18, bottom: 100 })
              .borderRadius(10)
            }
          }
          .height('100%')
          .width('100%')
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
      })



    }
  }
}