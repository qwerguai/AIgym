import BackTab from '../CommonComponents/BaseComponents/BackTab'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {

    Column() {
      BackTab({title:'首页'})
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