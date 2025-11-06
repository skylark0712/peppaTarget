import CommonConstant from '../common/constant/CommonConstant'
import AddTargetDialog from './AddTargetDialog'
import TargetListItem from './TargetListItem'

@Component
export default struct TargetList {
  @Link arrData: Array<number>
  onClickOk?: () => void
  dialogController: CustomDialogController = new CustomDialogController({
    builder: AddTargetDialog({ onClickOk: (value: string): void => this.saveTask(value) }),
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -16 }
  })

  saveTask(value: string) {
    console.log(value)
  }

  @Builder
  targetItem() {
    Row() {
      Text($r('app.string.sub_goals'))
        .fontColor($r('app.color.title_black_color'))
        .fontSize($r('app.float.secondary_title'))
        .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
      Blank()
      Text($r('app.string.edit_button'))
        .fontColor($r('app.color.main_blue'))
        .fontSize($r('app.float.button_font'))
        .fontWeight(CommonConstant.FONT_WEIGHT)
    }
    .padding({ left: $r('app.float.operate_row_margin'), right: $r('app.float.operate_row_margin') })
    .width(CommonConstant.FULL_WIDTH)
  }

  build() {
    Column() {
      this.targetItem()
      List({ space: CommonConstant.LIST_SPACE }) {
        ForEach(this.arrData, (item: number) => {
          ListItem() {
            TargetListItem({ taskItem: item })
          }
        }, (item: string) => item)
      }
      .height(CommonConstant.LIST_HEIGHT)
      .margin({ top: $r('app.float.list_margin_top') })

      Blank()
      Button($r('app.string.add_task'))
        .backgroundColor($r('app.color.button_background'))
        .fontColor($r('app.color.main_blue'))
        .margin({ top: '16vp' })
        .onClick(() => {
          this.dialogController.open()
        })
    }
    .padding({ top: '14vp' })
    .width(CommonConstant.FULL_WIDTH)
    .height('55%')
  }
}