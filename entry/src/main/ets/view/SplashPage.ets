import router from '@ohos.router';
import { Constants } from '../common/Constants'
import { StyleConstants } from '../common/StyleConstants'
import promptAction from '@ohos.promptAction';


@Entry
@Component
struct SplashPage {
  // 初始化定时器
  private timer: number = 0

  build() {
    Column() {

      Column() {

        Image($r('app.media.favicon'))
          .width($r('app.float.size_100vp'))
          .height($r('app.float.size_100vp'))
          .borderRadius($r('app.float.radius_12vp'))
          .backgroundColor(StyleConstants.BASE_GREY)

        Text($r('app.string.logo_title'))
          .fontSize($r('app.float.font_size_40fp'))
          .fontWeight(700)
          .fontColor(StyleConstants.BASE_STYLE.fontColor)
          .margin({top:StyleConstants.SPACING})
      }

      Column() {
        LoadingProgress()
          .width($r('app.float.size_40vp'))
          .height($r('app.float.size_40vp'))
          .color(Color.White)

        Text($r('app.string.logo_info'))
          .fontSize($r('app.float.font_size_20fp'))
          .fontWeight(600)
          .fontColor(StyleConstants.BASE_STYLE.fontColor)

      }
      .offset({x:0,y:200})

    }
    .justifyContent(FlexAlign.Center)
    .alignItems((HorizontalAlign.Center))
    .width('100%')
    .height('100%')
  }
  // 周期函数aboutToAppear里添加一个2秒的定时任务跳转到主页
  aboutToAppear() {
    this.timer = setTimeout(()=>{
      router.replaceUrl({url:Constants.loadingToJump})
        .catch(err=>{
          promptAction.showToast({
            message:err==200002? $r('app.string.not_found_url'):$r('app.string.loading_to_jump_error'),
            duration: 2000,
          });
        })
    },Constants.DELAY_TIME_5s)
  }

  // 销毁定时器
  aboutToDisappear() {
    clearTimeout(this.timer)
  }

}