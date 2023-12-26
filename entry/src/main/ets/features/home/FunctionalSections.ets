import {StyleConstants} from '../../common/StyleConstants'
import {homeShowList} from  '../../common/mock'

 @Component
export default struct FunctionalSections {
  @Prop plate:number

  build() {
    Column() {
      List({ space: 8, initialIndex: 0 }) {
        ForEach(homeShowList, (item) => {
          ListItem() {
            Column(){
              // 标题
              Flex(){
                Text(item.title)
                  .fontSize($r('app.float.font_size_18fp'))
                  .fontWeight(700)
                  .fontColor(StyleConstants.BASE_STYLE.fontColor)
              }
              .height('20%')

              // 主体
              Flex({justifyContent:FlexAlign.SpaceBetween}){

                Column(){
                    Flex(){
                      Image($r('app.media.programmer'))
                        .width($r('app.float.size_20vp'))
                        .height($r('app.float.size_20vp'))
                        .borderRadius($r('app.float.radius_full'))
                      Text(item.info)
                        .fontSize($r('app.float.font_size_12fp'))
                        .margin({left:$r('app.float.size_20vp')})
                    }
                  .margin({top:$r('app.float.size_10vp'),bottom:$r('app.float.size_10vp')})

                    Text(`${item.title},${item.info}更多健身课程请联系作者或健身房`){
                    }
                    .width(StyleConstants.FULL_WIDTH)
                    .textAlign(TextAlign.Start)
                    .fontSize($r('app.float.font_size_14fp'))
                    .maxLines(2)
                    .textOverflow({ overflow:TextOverflow.Ellipsis })

                }
                .width('70%')
                .height(StyleConstants.FULL_HEIGHT)

                Column(){
                  Image($r('app.media.programmer'))
                    .width(StyleConstants.FULL_WIDTH)
                    .height(StyleConstants.FULL_HEIGHT)
                }
                .width('30%')
                .height(StyleConstants.FULL_HEIGHT)

              }
              .width(StyleConstants.FULL_WIDTH)
              .height('54%')


              // 其他
              Flex({justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
                Flex({justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
                  Flex(){
                    Text(item.time)
                      .fontSize($r('app.float.font_size_12fp'))
                    Text(item.hot)
                      .fontSize($r('app.float.font_size_12fp'))
                  }
                  .margin({top:$r('app.float.size_10vp'),bottom:$r('app.float.size_10vp')})
                }
                .width('50%')
                .height(StyleConstants.FULL_HEIGHT)

                Flex({justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
                  Text(item.like)
                    .fontSize($r('app.float.font_size_12fp'))
                  Text(item.stort)
                    .fontSize($r('app.float.font_size_12fp'))
                }
                .width('50%')
                .height(StyleConstants.FULL_HEIGHT)

              }
              .height('26%')

            }
            .width(StyleConstants.FULL_WIDTH)
            .height(StyleConstants.FULL_HEIGHT)
          }
          .backgroundColor(StyleConstants.BASE_STYLE.backGroundColor)
          .width(StyleConstants.FULL_WIDTH)
          .height($r('app.float.size_140vp'))
          .padding({left:StyleConstants.SPACING,right:StyleConstants.SPACING,top:$r('app.float.size_10vp')})

        }, (item,idx) => idx.toString())
      }
      .width(StyleConstants.FULL_WIDTH)
      .height(StyleConstants.FULL_HEIGHT)
      .margin({top:$r('app.float.size_8vp')})
      .listDirection(Axis.Vertical) // 排列方向
      .edgeEffect(EdgeEffect.Spring) // 滑动到边缘弹性物理动效

      .onScrollIndex((firstIndex: number, lastIndex: number) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
      })

    }
    .width(StyleConstants.FULL_WIDTH)
    .height(StyleConstants.FULL_HEIGHT)
  }
}