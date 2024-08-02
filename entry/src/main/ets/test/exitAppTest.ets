import app from '@system.app';
import prompt from '@ohos.prompt';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  // 记录上一次点击时间
  private pretime: number = new Date().getTime();
  onBackPress() {
    if (-1 == this.pretime) {
      // 第一次点击返回键，提示toast
      prompt.showToast({
        message: "再按一次退出应用"
      })
      return true;
    } else {
      let currentTime = new Date().getTime();
      let flag = currentTime - this.pretime;
      if (flag > 2000) {
        //两次点击时间太长不做处理
        this.pretime = currentTime;
        return true;
      } else {

        app.terminate(); // 2秒内点击，退出当前Ability。
      }
    }
    return false;
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}