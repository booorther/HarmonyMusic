import router from '@ohos.router'
@Entry
@Component
struct ClockPage {
  @State sec: number = 5
  timeid:number = -1

  aboutToAppear() {
    this.timeid =  setInterval(
      () => {
        this.sec--  //时间减1
        if(this.sec == 0){
          // 停止定时器
          clearInterval(this.timeid)
          //  跳转页面
          router.pushUrl({url:'pages/HeimaMusicPage'})
        }
      },
      1000)
  }

  build() {
    Column() {
      //  显示一个倒计时的数字
      Text(this.sec.toString())
        .fontSize(50)
    }
    .height('100%')
    .width('100%')
  }
}