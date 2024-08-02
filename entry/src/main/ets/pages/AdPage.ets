import router from '@ohos.router'
@Entry
@Component
struct AdPage {
 @State sec:number=5
 timeId:number= -1

  aboutToAppear(){
   this.timeId= setInterval(()=>{
       this.sec --
      if(this.sec==0){
        clearInterval(this.timeId) //跳转页面之前清除定时器
         router.replaceUrl({url:"pages/Index"})
      }

    },1000)


  }
  build() {
    Stack({alignContent:Alignment.TopEnd}){
      Image($r("app.media.ad"))
        .height("100%")
        .width("100%")

      Button("跳过"+this.sec)
        .backgroundColor("#ffbfbaba")
        .margin({top:10,right:10})
        .onClick(()=>{
          // @ts-ignore
          router.replaceUrl({url:"pages/Index"})

        })

    }

  }
}