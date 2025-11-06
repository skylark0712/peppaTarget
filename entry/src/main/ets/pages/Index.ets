import CommonConstant from '../common/constant/CommonConstant'
import getCurrentTime from '../common/utils/DateUtil'
import TargetInformation from '../components/TargetInformation'
import TargetList from '../components/TargetList'
import Task from '../viewmodel/Task'
import TaskDataService from '../viewmodel/TaskDataService'

@Entry
@Component
struct Index {
  @State @Watch('onProgressChanged') arrData: Array<Task> = TaskDataService.getData()
  @State totalTaskNum: number = 0
  @State latestUpdateDate: string = '-'
  @State completedTaskNumber: number = 0

  onProgressChanged() {
    this.totalTaskNum = this.arrData.length
    this.latestUpdateDate = getCurrentTime();
    this.completedTaskNumber = this.arrData.filter((item: Task) => {
      return item.progressValue === 100
    }).length
  }

  @Builder
  titleBar() {
    Text($r('app.string.title'))
      .fontSize($r('app.float.title_font_size'))
      .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
      .height($r('app.float.title_height'))
      .margin({ top: $r('app.float.title_margin'), bottom: $r('app.float.title_margin') })
      .textAlign(TextAlign.Start)
      .width(CommonConstant.TITLE_WIDTH)
  }

  build() {
    Column() {
      this.titleBar()
      TargetInformation({
        totalTaskNum: this.totalTaskNum,
        latestUpdateDate: this.latestUpdateDate,
        completedTaskNumber: this.completedTaskNumber
      })
      TargetList({ arrData: $arrData })
    }
    .backgroundColor($r('app.color.index_background'))
    .height(CommonConstant.FULL_HEIGHT)
    .padding({ left: $r('app.float.main_padding'), right: $r('app.float.main_padding') })
    .width(CommonConstant.FULL_WIDTH)
  }
}