import router from '@ohos.router';

@Entry
@Component
export default struct Setting {
  build() {
    Row() {
      Text('登录')
        .fontColor('#f00')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .onClick(()=>{
          router.pushUrl({url:'pages/auth/Login'})
        })
      Text('注册')
        .margin({left:'50vp'})
        .fontColor('#f00')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .onClick(()=>{
          router.pushUrl({url:'pages/auth/Register'})
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}