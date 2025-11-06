import CommonConstant from '../common/constant/CommonConstant'
import getCurrentTime from '../common/utils/DateUtil'
import IdGen from '../common/utils/IdGen'
import Task from '../viewmodel/Task'
import TaskDataService from '../viewmodel/TaskDataService'
import AddTargetDialog from './AddTargetDialog'
import TargetListItem from './TargetListItem'

@Component
export default struct TargetList {
  @Link arrData: Array<Task>
  onClickOk?: () => void
  dialogController: CustomDialogController = new CustomDialogController({
    builder: AddTargetDialog({ onClickOk: (value: string): void => this.saveTask(value) }),
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -16 }
  })

  saveTask(value: string) {
    TaskDataService.addData(new Task(IdGen.genId(), value, getCurrentTime(), 0))
    this.arrData = TaskDataService.getData()
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
        ForEach(this.arrData, (item: Task) => {
          ListItem() {
            TargetListItem({
              taskItem: item, onClickOk: (progressValue: number) => {
                TaskDataService.updateProgress(
                  item.id,
                  progressValue,
                  getCurrentTime()
                )
                this.arrData = TaskDataService.getData()
              }
            })
          }
        }, (item: string) => JSON.stringify(item))
      }
      .height(CommonConstant.LIST_HEIGHT)
      .width(CommonConstant.FULL_WIDTH)
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