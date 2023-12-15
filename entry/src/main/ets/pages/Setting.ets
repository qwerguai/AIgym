@Entry
@Component
export default struct Setting {
  build() {
    Column() {
      Text('Setting界面')
        .fontColor('#f00')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}