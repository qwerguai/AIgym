
import { StyleConstants } from '../../common/StyleConstants'

/**
 * 列表页单元格
 *
 * title [主标题]
 *
 * subTitle [副标题 描述]
 *
 * event  [事件处理函数]
 */
@Component
struct Cell {
  @Prop title:string
  @Prop subTitle:string
  @Prop event:()=>void

  build(){
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