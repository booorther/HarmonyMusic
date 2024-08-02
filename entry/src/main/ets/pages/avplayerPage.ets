import media from '@ohos.multimedia.media'

@Entry
@Component
struct AvplayerPage {
  @State totalTime:number=0
  @State currentTime:number=0
  @State message: string = 'Hello World'
  avplayer: media.AVPlayer

  async aboutToAppear() {
    this.avplayer = await media.createAVPlayer()
//监听avplayer对象的播放状态
    this.avplayer.on("stateChange", (state) => {
      console.log("mylog:播放状态", state)
      if (state == "initialized")
        this.avplayer.prepare()
      if (state == "prepared")
        this.avplayer.play()
    })
    this.avplayer.url="http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.m4a"
   //获取当前播放时间的事件监听
    this.avplayer.on("timeUpdate",(time)=>{
      this.currentTime=time
      this.totalTime=this.avplayer.duration
    })

  }

  build() {
    Column() {
      Text("total:"+this.totalTime)
      Text("current:"+this.currentTime)
      Button("播放")
        .onClick(async ()=>{
          await this.avplayer.reset()
       //this.avplayer.url="http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.mp3"
        })


    }

  }
}