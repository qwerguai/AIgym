import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import { PageConstants } from '../constants/PageConstants'



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
        }, PageConstants.DELAY_TIME);
    }
}

  build() {
    Column() {

      Column() {

        // 标题
        Column() {
          Text($r('app.string.login_title'))
            .TextStyle()
            .fontSize($r('app.float.register_title'))
          Text($r('app.string.login_title_info'))
            .fontSize($r('app.float.register_title_info'))
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
            .fontColor($r('app.color.baseColor'))
        }else{
          LoadingProgress()
            .width(30)
            .height(30)
            .margin({ left: 12 })
            .color($r('app.color.baseColor'))
        }
      }
    }
    .width(PageConstants.FULL_BUTTON)
    .backgroundColor($r('app.color.baseGreen'))
    .height($r('app.float.login_register_input_height'))
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
        .selectedColor($r('app.color.baseGreen'))
        .onChange((isOn: boolean) => {
          this.agreement = isOn
        })
      Text('已阅读并同意')
        .fontSize('14fp')
      Text('《服务条款》')
        .fontSize('14fp')
        .fontColor($r('app.color.baseGreen'))
      Text('与')
        .fontSize('14fp')
      Text('《隐私权政策》')
        .fontSize('14fp')
        .fontColor($r('app.color.baseGreen'))
    }
    .margin({ top: $r('app.float.base_margin') })

  }


}


// 输入框样式
@Extend(TextInput) function inputStyle() {
  .fontColor($r('app.color.baseGreen'))
  .caretColor($r('app.color.baseGreen'))
  .placeholderColor($r('app.color.baseGreen'))
  .width(PageConstants.FULL_INPUT)
  .height($r('app.float.login_register_input_height'))
  .fontSize($r('app.float.big_text_size'))
  .backgroundColor($r('app.color.background'))
  .margin({ top: $r('app.float.base_margin') })
}

// 文本样式
@Extend(Text) function TextStyle() {
  .fontColor($r('app.color.baseGreen'))
  .fontWeight(FontWeight.Bold)
  .margin({ top: '20vp' })
}