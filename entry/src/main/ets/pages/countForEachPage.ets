import router from '@ohos.router'
@Entry
@Component
struct ClockPage {
  @State sec: number = 1
  timeid:number = 2
  @State describe:string=''

  aboutToAppear() {
    this.timeid =  setInterval(
      () => {
        this.sec++ //时间减1
        if(this.sec%3== 0 && this.sec!=6){
          this.describe='重启会员成长之路'
        }else if (this.sec%5==0) {
          this.describe="点击恢复20项+专项特技"
        }else if (this.sec%7==0){
          this.describe='黑胶时光机 | 音乐之旅'
          this.sec=0
        }
        if (this.sec==8) {//防泄露
          this.timeid=2
        }
      },
      1000)
  }

  @Builder
  swiperText(){
    
}

  build() {
    Column() {
      //  显示一个倒计时的数字
         Swiper(){
           Text(this.describe)
             .fontSize(50)
             .fontColor(Color.Black)
         }
      Text(this.sec.toString())
        .fontSize(50)
        .fontColor(Color.Black)
    }
    .height('100%')
    .width('100%')
  }
}
