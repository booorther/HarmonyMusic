@Entry
@Component
struct tabPage {
  @State curIndex: number = 0 // 当前用户点击的索引

  @Builder //自定义构建函数
  tabBuilder(txt: string, img: Resource, index: number) {
    Column() {
      Image(img)
        .height(30)
        .width(30)
        .borderRadius(15)

      Text(txt)
        // 通过三元表达式来判断给什么颜色给文本
        .fontColor(this.curIndex == index ? Color.Red : Color.Black)
    }
  }

  build() {
    Column() {
      Tabs() {
        TabContent() {
          Text('推荐页面')
        }
        .tabBar(this.tabBuilder('推荐', $r('app.media.ic_recommend'), 0))

        TabContent() {
          Text('发现页面')
        }
        .tabBar(this.tabBuilder('发现', $r('app.media.ic_find'), 1))

      }
      .barPosition(BarPosition.End)
      .onChange((index: number) => {
        this.curIndex = index // 修改状态变量的值，用来触发整个页面的重新筛选
        console.log(index.toString())
      })

    }
    .width('100%')
    .height('100%')

  }
}