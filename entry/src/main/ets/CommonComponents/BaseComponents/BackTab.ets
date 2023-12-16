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
          .width($r('app.float.size_30vp'))
          .height($r('app.float.size_30vp'))
          .margin({right:$r('app.float.size_20vp'),left:$r('app.float.size_20vp')})

        if (this.title !== ''){
          Text(this.title)
            .fontSize($r('app.float.font_size_18fp'))
            .fontWeight(FontWeight.Bold)
        }

      }
      .height('100%')

      if (this.rightIcon!==''){
        Image(this.rightIcon)
          .width($r('app.float.size_30vp'))
          .height($r('app.float.size_30vp'))
          .margin({right:20,left:10})
      }

    }
    .width('100%')
    .height($r('app.float.size_30vp'))
    .onClick(this.handleBack)
  }
}