import router from '@ohos.router';


@Component
export default struct BackTab {
  // 标题
  private title:string;
  // 右边图标 -- 图片路径
  private  rightIcon:ResourceStr

  // 点击返回
  handleBack(){
    router.back();
  }

  build(){
    Flex({justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
      Flex({alignItems:ItemAlign.Center}){

        Image($r('app.media.back'))
          .width('30rpx')
          .height('30rpx')
          .margin({right:20,left:10})

        Text(this.title)
          .fontSize('20rpx')
          .fontWeight(FontWeight.Bold)

      }
      .height('100%')

      if (this.rightIcon!==''){
        Image(this.rightIcon)
          .width('30rpx')
          .height('30rpx')
          .margin({right:20,left:10})
      }

    }
    .width('100%')
    .height('60rpx')
    .onClick(this.handleBack)
  }
}