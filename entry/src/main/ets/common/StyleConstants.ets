
interface IBaseStyle {
  backGroundColor:string;
  fontColor:string;
  inputBackGroundColor:string
}

export class StyleConstants{

  /**
   * common style
   * TODO:将全局共用的背景颜色，字体颜色提到这里来，便于后期做主题切换
   */
  static BASE_STYLE:IBaseStyle = {
    backGroundColor:'#ffffff',
    fontColor:'#008080',
    inputBackGroundColor:'#f1f3f5'
  }

  /**
   * the width of button
   */
  static  readonly FULL_BUTTON:string = '70%'

  /**
   * the width of input
   */
  static  readonly  FULL_INPUT:string = '100%'

  /**
   * the height of input
   */
  static readonly INPUT_HEIGHT:string =  '40vp'

  /**
   * the baseGrey
   */
  static readonly BASE_GREY:string = "#f2f2f2"

  /**
   * the tabBar size
   */
static readonly TABBAR_SIZE:string = '24vp'

  /**
   * the tabBar selection and default
   */
  static readonly TABBAR_SELECT_DEFAULT = {
    SELECT:'#008080',
    DEFAULT:'#000000'
  }

}