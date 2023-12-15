import router from '@ohos.router';
import { PageConstants } from '../constants/PageConstants'
import promptAction from '@ohos.promptAction';


@Entry
@Component
struct SplashPage {
  // 初始化定时器
  private timer: number = 0

  // 跳转错误提示
  private errorTitle:string=''


  build() {
    Column() {
      Column() {
        Image($r('app.media.favicon'))

          .width($r('app.float.LOGO_INFO_size'))
          .height($r('app.float.LOGO_INFO_size'))
          .borderRadius($r('app.float.logo_info_radius'))
          .backgroundColor($r('app.color.baseColor'))

        Text($r('app.string.logo_title'))
          .fontSize('40rpx')
          .fontWeight(700)
          .fontColor('#f2f2f2')
          .margin({top:20})
      }
      Column() {
        LoadingProgress()
          .width('40rpx')
          .height('40rpx')
          .color(Color.White)

        Text($r('app.string.logo_info'))
          .fontSize('20rpx')
          .fontWeight(600)
          .fontColor('#f2f2f2')

      }
      .offset({x:0,y:200})

    }
    .justifyContent(FlexAlign.Center)
    .alignItems((HorizontalAlign.Center))
    .width('100%')
    .height('100%')
    .backgroundImage(PageConstants.LOGIN_BG, ImageRepeat.NoRepeat)
    .backgroundImageSize(ImageSize.Cover)
  }
  // 周期函数aboutToAppear里添加一个2秒的定时任务跳转到主页
  aboutToAppear() {
    this.timer = setTimeout(()=>{
      router.replaceUrl({url:PageConstants.MAIN_PAGE_URL})
        .catch(err=>{
          this.errorTitle = err==200002? '页面地址不存在':'进入首页异常，请退出后重新进入'
          promptAction.showToast({
            message:this.errorTitle ,
            duration: 2000,
          });
        })
    },PageConstants.DELAY_TIME)
  }

  // 销毁定时器
  aboutToDisappear() {
    clearTimeout(this.timer)
  }

}