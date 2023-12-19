import router from '@ohos.router'
import { Constants } from '../../common/Constants'
import { StyleConstants } from '../../common/StyleConstants'
import HeaderNavigation from '../../CommonComponents/BaseComponents/HeaderNavigation'

type IBlockList = {
  title: string // 主标题
  subTitle?: string // 副标题
  targetUrl: ResourceStr // 跳转路径
}

type ISetUpList = {
  name: string //板块
  children: IBlockList[] // 板块列表
}

@Entry
@Component
struct SetUp {
  private setUpList: ISetUpList[] = [
    {
      name: 'person',
      children: [
        {
          title: '编辑资料',
          subTitle: '',
          targetUrl: ''
        },
        {
          title: '账号设置',
          subTitle: '',
          targetUrl: ''
        }
      ]
    },
    {
      name: 'system',
      children: [
        {
          title: '深色模式',
          subTitle: '跟随系统',
          targetUrl: ''
        }
      ]
    },
    {
      name: 'device',
      children: [
        {
          title: '检查更新',
          subTitle: '',
          targetUrl: ''
        },
        {
          title: '关于',
          subTitle: '',
          targetUrl: ''
        }
      ]
    }
  ]

  build() {
    Column() {
      HeaderNavigation({
        leftIconGroup: {
          icon: Constants.BACk,
          event: () => {
            router.back()
          }
        },
        middle: {
          title:$r('app.string.setup')
        }
      })
      ForEach(this.setUpList, (item) => {
        this.PlateGroup(item.children)
      }, (item, idx) => idx.toString())

      Flex({justifyContent:FlexAlign.Center,alignItems:ItemAlign.Center}){
        Text($r('app.string.logout'))
          .TextStyle()
          .fontColor(Color.Red)
      }
      .width(StyleConstants.FULL_WIDTH)
      .height($r('app.float.size_60vp'))
      .margin({ top: StyleConstants.SPACING_SMAIL })
      .backgroundColor(StyleConstants.BASE_STYLE.backGroundColor)
    }
    .width(StyleConstants.FULL_WIDTH)
    .height(StyleConstants.FULL_HEIGHT)
    .backgroundColor(StyleConstants.BASE_STYLE.defaultBackGround)
  }

  @Builder
  PlateGroup(i) {
    Column() {
      ForEach(i, (item) => {
        this.PlateItem(item)
      }, (item, idx) => idx.toString())
    }
    .width(StyleConstants.FULL_WIDTH)
    .margin({ top: StyleConstants.SPACING_SMAIL, bottom: StyleConstants.SPACING_SMAIL })
    .backgroundColor(StyleConstants.BASE_STYLE.backGroundColor)
  }

  @Builder
  PlateItem(i) {
    Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
      Column() {
        Text(i.title)
          .TextStyle()
          .fontColor(StyleConstants.BASE_STYLE.fontColor)

      }

      Row() {
        Text(i.subTitle)
          .TextStyle()
          .fontColor(StyleConstants.BASE_GREY)
        Image($r("app.media.arrow_right"))
          .width($r('app.float.size_16vp'))
          .height($r('app.float.size_16vp'))
      }
    }
    .width(StyleConstants.FULL_WIDTH)
    .height($r('app.float.size_60vp'))
    .padding({left:StyleConstants.SPACING,right:StyleConstants.SPACING})
    .border({
      width: { bottom: '1vp' },
      color: StyleConstants.LINE_BASE_GREY,
      style: BorderStyle.Solid })
    .onClick(()=>{
      router.pushUrl({
        url:i.targetUrl
      })
    })

  }
}

// 文本样式
@Extend(Text) function TextStyle() {
  .fontWeight(FontWeight.Medium)
  .fontSize($r('app.float.font_size_16fp'))
}