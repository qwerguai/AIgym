@Component
export default struct Follow {

  // 后期后端所需板块标识
  @Prop plate:number

  build() {
    Column() {
      Text('功能尚未完成，移步其他板块')
        .fontColor('#f00')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}