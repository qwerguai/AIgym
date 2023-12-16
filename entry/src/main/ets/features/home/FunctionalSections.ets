import {StyleConstants} from '../../common/StyleConstants'
import {homeShowList} from  '../../common/mock'

@Component
export default struct FunctionalSections {
  // 后期后端所需板块标识
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
                      Text(item.info)
                        .fontSize($r('app.float.font_size_12fp'))
                        .margin({left:$r('app.float.size_20vp')})
                    }
                  .margin({top:$r('app.float.size_10vp'),bottom:$r('app.float.size_10vp')})
                }
                .width('70%')
                .height('100%')

                Column(){
                  Image($r('app.media.programmer'))
                    .width('100%')
                    .height('100%')
                }
                .width('30%')
                .height('100%')

              }
              .width('100%')
              .height('60%')


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
                .height('100%')

                Flex({justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
                  Text(item.like)
                    .fontSize($r('app.float.font_size_12fp'))
                  Text(item.stort)
                    .fontSize($r('app.float.font_size_12fp'))
                }
                .width('50%')
                .height('100%')

              }
              .height('20%')

            }
            .width('100%')
            .height('100%')
          }
          .backgroundColor(StyleConstants.BASE_STYLE.backGroundColor)
          .width('100%')
          .height($r('app.float.size_140vp'))
          .padding({left:StyleConstants.SPACING,right:StyleConstants.SPACING,top:$r('app.float.size_10vp')})

        }, (item,idx) => idx.toString())
      }
      .width('100%')
      .height('100%')
      .margin({top:$r('app.float.size_8vp')})
      .listDirection(Axis.Vertical) // 排列方向
      .edgeEffect(EdgeEffect.Spring) // 滑动到边缘弹性物理动效
      /**
       * 触发该事件的条件：列表初始化时会触发一次
       * List显示区域内第一个子组件的索引值
       * 最后一个子组件的索引值有变化时会触发。
       */
      .onScrollIndex((firstIndex: number, lastIndex: number) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
      })

    }
    .width('100%')
    .height('100%')
  }
}