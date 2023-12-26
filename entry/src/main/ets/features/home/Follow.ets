@Component
export default struct Follow {

  @Prop plate:number

  build() {
    Column() {
      Text('没有更多关注')
        .fontColor('#f00')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}