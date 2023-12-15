@Entry
@Component
export default struct Home {
  build() {
    Column() {
      Text('home')
        .fontColor('#f00')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}