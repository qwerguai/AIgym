import router from '@ohos.router';

@Entry
@Component
export default struct Setting {
  build() {
    Column() {
      Text('我的')
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