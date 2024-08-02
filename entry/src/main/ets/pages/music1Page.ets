@Entry
@Component
export  struct Music1Page {
  @State message: string = 'music页面'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
      }
      .width('100%')
    }
    .height('100%')
  }
}