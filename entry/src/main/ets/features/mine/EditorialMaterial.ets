
import router from '@ohos.router'
import { Constants } from '../../common/Constants'
import { StyleConstants } from '../../common/StyleConstants'
import HeaderNavigation from '../../CommonComponents/BaseComponents/HeaderNavigation'

type IUserInfo = {
  title:string
  value:string
}

@Entry
@Component

struct  EditorialMaterial{
@State userInfo:IUserInfo[] = [
  {
    title:'头像',
    value:''
  },
  {
    title:'用户名',
    value:'linhan'
  },
  {
    title:'昵称',
    value:'林寒'
  },
  {
    title:'邮箱',
    value:'2188817393@qq.com'
  },
  {
    title:'手机号',
    value:''
  },
  {
    title:'生日',
    value:''
  },
  {
    title:'座右铭',
    value:'永不言弃！'
  },
]
  build(){
    Column(){
      HeaderNavigation({
        leftIconGroup: {
          icon: Constants.BACk,
          event: () => {
            router.back()
          }
        },
        middle: {
          title:$r('app.string.editorial_material')
        }
      })
    }
    .width(StyleConstants.FULL_WIDTH)
    .width(StyleConstants.FULL_HEIGHT)

  }
}