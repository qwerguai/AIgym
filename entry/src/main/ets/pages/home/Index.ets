import { Constants } from '../../common/Constants'
import { StyleConstants } from '../../common/StyleConstants'
import Follow from '../../features/home/Follow'
import FunctionalSections from '../../features/home/FunctionalSections'


interface ITabBarList {
  title:string,
  plateId:number
}

@Entry
@Component
export default struct Home {

  // 当前选择项
  @State currentIndex: number = 0

  // tabBarList
  @State tabBarList: ITabBarList[] = [
    {
      title: '关注',
      plateId:0
    },
    {
      title: '推荐',
      plateId:1
    },
    {
      title: '减脂',
      plateId:2
    },
    {
      title: '增肌',
      plateId:3
    },
    {
      title: '客制化训练',
      plateId:4
    },
  ]

  // tab构造器
  private tabController: TabsController = new TabsController()

  // 搜索
  @State search: string = '大家都在搜：如何健康减脂'

  // 设置Search组件控制器。
  private searchController: SearchController = new SearchController()

  build() {
    Column() {

      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Search({ value: this.search, placeholder: Constants.SEARCH_TEXT, controller: this.searchController })
          .placeholderColor($r('app.color.baseGreen'))
          .height($r('app.float.size_34vp'))
          .borderRadius($r('app.float.radius_8vp'))

        Image($r('app.media.todo'))
          .width($r('app.float.size_30vp'))
          .margin({ left: $r('app.float.size_12vp') })
      }
      .backgroundColor(StyleConstants.BASE_STYLE.backGroundColor)
      .padding({ left: StyleConstants.SPACING, right: StyleConstants.SPACING,top:StyleConstants.SPACING  })
      

      Tabs({ barPosition: BarPosition.Start, controller: this.tabController }) {
        ForEach(this.tabBarList,(item,idx)=>{
          TabContent() {
            if(item.plateId===0){
                Follow({plate:item.plateId})// 组件单向通信
            }else {
              FunctionalSections({plate:item.plateId})
            }
          }
          .tabBar(this.TabBarBuilder(idx, item.title))

        },(item,idx)=>idx.toString())

      }
      .vertical(false)
      .barMode(BarMode.Scrollable)
      .width(StyleConstants.FULL_WIDTH)
      .height(StyleConstants.FULL_HEIGHT)
      .barWidth(StyleConstants.FULL_WIDTH)
      .barHeight($r('app.float.size_40vp'))
      .animationDuration(400)
      .onChange((index: number) => {
        this.currentIndex = index
      })

    }
    .backgroundColor(StyleConstants.BASE_STYLE.defaultBackGround)
    .width('100%')
    .height('100%')

  }

  // 构建tab
  @Builder TabBarBuilder(idx: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === idx ?StyleConstants.BASE_STYLE.fontColor : $r('app.color.baseBlack'))
        .fontSize($r('app.float.font_size_16fp'))
        .fontWeight(this.currentIndex === idx ? 500 : 400)
        .margin({ top:$r('app.float.size_10vp'), bottom: $r('app.float.size_6vp') })
      Divider()
        .strokeWidth(2)
        .color($r('app.color.baseGreen'))
        .opacity(this.currentIndex === idx ? 1 : 0)
    }
    .backgroundColor(StyleConstants.BASE_STYLE.backGroundColor)
    .width($r('app.float.size_80vp'))
    .height(StyleConstants.FULL_HEIGHT)
  }
}

