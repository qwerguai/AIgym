
export class Constants{

  /**
   * 加载页背景图
   */
  static readonly LOADING_BG:ResourceStr = $r("app.media.loading")

  /**
   * the back icon
   */
  static readonly BACk:ResourceStr = $r('app.media.back')

  /**
   * the mainPage tabBar pages icon url
   */
  static readonly TABBARLIST = [
    {
      title:'首页',
      selectIcon:$r('app.media.homeSelect'),
      icon:$r('app.media.home'),
    },
    {
      title:'文章',
      selectIcon:$r('app.media.articleSelect'),
      icon:$r('app.media.article'),
    },
    {
      title:'社区',
      selectIcon:$r('app.media.communitySelect'),
      icon:$r('app.media.community'),
    },
    {
      title:'我的',
      selectIcon:$r('app.media.mineSelect'),
      icon:$r('app.media.mine'),
    },
  ]


  /**
   * jump to url after loading
   * start not have '/'
   */
  static readonly  loadingToJump:string = 'view/MainPage'

  /**
   * 定时器时间
   */
  static  readonly  DELAY_TIME_5s:number = 5000
  static  readonly  DELAY_TIME_1m:number = 1000 * 60

  /**
   * search text
   */
  static readonly SEARCH_TEXT:string = '搜索'

}