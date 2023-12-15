import Home from '../pages/home/Index'
import Mine from '../pages/mine/Index'
import Article from '../pages/article/Index'
import Comments from '../pages/community/Index'
import {StyleConstants} from '../common/StyleConstants'
import {Constants} from '../common/Constants'

@Entry
@Component
struct TabPage {
  @State currentIndex: number = 0
  private tabsController: TabsController = new TabsController();


  @Builder TabBuilder(title: string, index: number, selectImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectImg : normalImg)
        .width(StyleConstants.TABBAR_SIZE)
        .height(StyleConstants.TABBAR_SIZE)
      Text(title)
        .margin({ top: 4 })
        .fontSize($r('app.float.font_size_14fp'))
        .fontColor(this.currentIndex === index ? StyleConstants.TABBAR_SELECT_DEFAULT.SELECT :StyleConstants.TABBAR_SELECT_DEFAULT.DEFAULT)
    }
    .justifyContent(FlexAlign.Center)
    .height($r('app.float.size_50vp'))
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
      /**
       * TODO:对于tabBar页面的循环必须严格遵循Constants.TABBARLIST的索引顺序进行条件渲染
       */
      ForEach(Constants.TABBARLIST,(item,idx)=>{
        TabContent() {
          if (idx==0) {
            Home()
          }else if (idx==1){
            Article()
          }else if (idx==2){
            Comments()
          }else if (idx==3){
            Mine()
          }
        }
        .tabBar(this.TabBuilder(item.title, idx, item.selectIcon, item.icon))

      },(item,idx)=>idx.toString())

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
