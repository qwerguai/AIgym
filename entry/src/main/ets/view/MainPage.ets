import Home from '../pages/Home'
import Setting from '../pages/Setting'

@Entry
@Component
struct TabPage {
  @State currentIndex: number = 0
  private tabsController: TabsController = new TabsController();

  @Builder TabBuilder(title: string, index: number, selectImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectImg : normalImg)
        .width(25)
        .height(25)
      Text(title)
        .margin({ top: 4 })
        .fontSize(10)
        .fontColor(this.currentIndex === index ? '#1698ce' : "#6b6b6b")
    }
    .justifyContent(FlexAlign.Center)
    .height(56)
    .width('100%')
    .onClick(() => {
      this.currentIndex = index
      this.tabsController.changeIndex(this.currentIndex)
    })
  }

  build() {
    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabsController
    }) {
      TabContent() {
        Home()
      }
      .padding({ left: 12, right: 12 })
      .backgroundColor('#f1f3f5')
      .tabBar(this.TabBuilder('首页', 0, $r('app.media.icon'), $r('app.media.back')))

      TabContent() {
        Setting()
      }
      .padding({ left: 12, right: 12 })
      .backgroundColor('#f1f3f5')
      .tabBar(this.TabBuilder('我的', 1, $r('app.media.icon'), $r('app.media.back')))
    }
    .width('100%')
    .backgroundColor(Color.White)
    .barHeight(56)
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentIndex = index
    })
  }
}