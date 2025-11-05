import CommonConstant from '../common/constant/CommonConstant'
import TargetListItem from './TargetListItem'

@Component
export default struct TargetList {
  @Link arrData: Array<number>

  @Builder
  targetItem() {
    Row() {
      Text($r('app.string.sub_goals'))
        .fontSize($r('app.float.secondary_title'))
        .fontColor($r('app.color.title_black_color'))
        .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
      Blank()
      Text($r('app.string.edit_button'))
        .fontColor($r('app.color.main_blue'))
        .fontSize($r('app.float.button_font'))
        .fontWeight(CommonConstant.FONT_WEIGHT)
    }
    .padding({
      left: $r('app.float.operate_row_margin'),
      right: $r('app.float.operate_row_margin')
    })
    .width(CommonConstant.FULL_WIDTH)
  }

  build() {
    Column() {
      this.targetItem()
      List({ space: CommonConstant.LIST_SPACE }) {
        ForEach(this.arrData, (item: number) => {
          ListItem() {
            TargetListItem({
              taskItem: item
            })
          }
        }, (item: string) => item)
      }
      .height(CommonConstant.LIST_HEIGHT)
      .margin({ top: $r('app.float.list_margin_top') })

      Blank()
      Button($r('app.string.add_task'))
        .backgroundColor($r('app.color.button_background'))
        .margin({ top: '16vp' })
        .fontColor($r('app.color.main_blue'))
    }
    .padding({ top: '14vp' })
    .width(CommonConstant.FULL_WIDTH)
    .height('55%')
  }
}