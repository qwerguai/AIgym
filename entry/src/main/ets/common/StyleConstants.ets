
interface IBaseStyle {
  backGroundColor:string;
  fontColor:string;
  inputBackGroundColor:string
  defaultBackGround:string
}

export class StyleConstants{


  static BASE_STYLE:IBaseStyle = {
    defaultBackGround:'#f2f3f5',
    backGroundColor:'#ffffff',
    fontColor:'#008080',
    inputBackGroundColor:'#f1f3f5'
  }


  static readonly SPACING = '20vp'

  static readonly SPACING_SMAIL = '8vp'

  static  readonly FULL_BUTTON:string = '70%'

  static  readonly  FULL_WIDTH:string = '100%'

  static  readonly  FULL_HEIGHT:string = '100%'

  static readonly INPUT_HEIGHT:string =  '40vp'

  static readonly BASE_GREY:string = "#8a919f"

  static readonly LINE_BASE_GREY:string = "#e4e6eb"

static readonly TABBAR_SIZE:string = '24vp'

  static readonly TABBAR_SELECT_DEFAULT = {
    SELECT:'#008080',
    DEFAULT:'#000000'
  }



}