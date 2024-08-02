
import router from '@ohos.router'
@Entry
@Component
struct Page01 {
  @State message: string = '美团菜品列表'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        //  按钮
        Button('跳转到详情页面')
          .onClick(()=>{
            //   使用router进行页面跳转
            //   pushUrl跳转的路径是可以返回的
            router.pushUrl({url:'pages/HeimaMusicPage'})
            // replaceUrl跳转的路径是返回不了的
            // router.replaceUrl({url:'pages/router/Page02'})
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}