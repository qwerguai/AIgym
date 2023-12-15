import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import { Constants } from '../../common/Constants'
import { StyleConstants } from '../../common/StyleConstants'



@Entry
@Component
struct Register {

  // 用户账号
  @State username: string = ''

  // 用户密码
  @State password: string = ''

  // 隐私协议
  @State agreement: boolean = false

  // 是否显示LoadingProgress
  @State isShowLoadingProgress:boolean = false

  // 定时器
  @State timer:number = 0


  // 注册
  handleRegister():void{
    if (this.username === '' || this.password === '') {
      promptAction.showToast({
        message: $r('app.string.input_empty_tips'),
        duration: 2000,
      });
    } else {
      if (!this.agreement) {
        promptAction.showToast({
          message: $r('app.string.agreement'),
          duration: 2000,
        });
        return
      }
      this.isShowLoadingProgress = true;
        this.timer = setTimeout(() => {
          this.isShowLoadingProgress = false;
          router.replaceUrl({ url: 'view/MainPage' });
        }, Constants.DELAY_TIME);
    }
}

  build() {
    Column() {

      Column() {

        // 标题
        Column() {
          Text($r('app.string.login_title'))
            .TextStyle()
            .fontSize($r('app.float.font_size_30fp'))
          Text($r('app.string.login_title_info'))
            .fontSize($r('app.float.font_size_16fp'))
            .TextStyle()
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Start)
        .height('20%')

        // 表单
        Column() {
          this.Form()
        }
        .justifyContent(FlexAlign.Center)
        .height('60%')

        // 提交按钮
        Flex({ justifyContent: FlexAlign.Center }) {
          this.RegisterButton()
        }

        // 隐私协议
        this.Agreement()

      }
      .alignItems(HorizontalAlign.Start)
      .width('80%')
      .height('80%')

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    // .backgroundImage(PageConstants.LOGIN_BG, ImageRepeat.NoRepeat)
    // .backgroundImageSize(ImageSize.Cover)
  }


  /**
   * 登录表单
   */
  @Builder
  Form() {

    TextInput({ placeholder: $r('app.string.register_user') })
      .inputStyle()
      .onChange((value: string) => {
        this.username = value;
      })

    TextInput({ placeholder: $r('app.string.register_password')})
      .type(InputType.Password)
      .inputStyle()
      .onChange((value: string) => {
        this.password = value;
      })

  }

  /**
   * 注册按钮
   */
  @Builder
  RegisterButton(){
    Button( { type: ButtonType.Capsule }){
      Row() {
        if (!this.isShowLoadingProgress){
          Text($r('app.string.register'))
            .fontSize('16fp')
            .fontColor(StyleConstants.BASE_GREY)
        }else{
          LoadingProgress()
            .width(30)
            .height(30)
            .margin({ left: 12 })
            .color(StyleConstants.BASE_GREY)
        }
      }
    }
    .width(StyleConstants.FULL_BUTTON)
    .backgroundColor(StyleConstants.BASE_STYLE.fontColor)
    .height(StyleConstants.INPUT_HEIGHT)
    .onClick(()=>this.handleRegister())
  }

  /**
   * 隐私协议
   */
  @Builder
  Agreement() {
    Row() {
      Toggle({ type: ToggleType.Checkbox, isOn: this.agreement })
        .size({ width: 20, height: 20 })
        .selectedColor(StyleConstants.BASE_STYLE.fontColor)
        .onChange((isOn: boolean) => {
          this.agreement = isOn
        })
      Text('已阅读并同意')
        .fontSize($r('app.float.font_size_14fp'))
      Text('《服务条款》')
        .fontSize($r('app.float.font_size_14fp'))
        .fontColor(StyleConstants.BASE_STYLE.fontColor)
      Text('与')
        .fontSize($r('app.float.font_size_14fp'))
      Text('《隐私权政策》')
        .fontSize($r('app.float.font_size_14fp'))
        .fontColor(StyleConstants.BASE_STYLE.fontColor)
    }
    .margin({ top: $r('app.float.base_margin') })

  }


}


// 输入框样式
@Extend(TextInput) function inputStyle() {
  .fontColor(StyleConstants.BASE_STYLE.fontColor)
  .caretColor(StyleConstants.BASE_STYLE.fontColor)
  .placeholderColor(StyleConstants.BASE_STYLE.fontColor)
  .width(StyleConstants.FULL_INPUT)
  .height(StyleConstants.INPUT_HEIGHT)
  .fontSize($r('app.float.font_size_18fp'))
  .backgroundColor(StyleConstants.BASE_STYLE.inputBackGroundColor)
  .margin({ top: $r('app.float.base_margin') })
}

// 文本样式
@Extend(Text) function TextStyle() {
  .fontColor(StyleConstants.BASE_STYLE.fontColor)
  .fontWeight(FontWeight.Bold)
  .margin({ top: '20vp' })
}