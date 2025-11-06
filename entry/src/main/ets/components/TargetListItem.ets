import CommonConstant from "../common/constant/CommonConstant"
import getCurrentTime from "../common/utils/DateUtil"
import Task from "../viewmodel/Task"

@Component
export default struct TargetListItem {
  taskItem?: Task
  @State progressValue?: number = 0
  @State lastsProgressValue?: number = 0
  onClickOk: Function = (progress: number) => {
  }
  @State isExpanded: boolean = false
  @State updateDate?: string = '-'

  aboutToAppear() {
    this.progressValue = this.taskItem?.progressValue
    this.lastsProgressValue = this.taskItem?.progressValue
    this.updateDate = this.taskItem?.updateDate
  }

  @Builder
  targetItem() {
    Row() {
      Text(`${this.taskItem?.taskName}`)
        .fontSize('16vp')
        .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
      Blank()
      Column() {
        Text(`${this.taskItem?.progressValue}%`)
          .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
        Text(`更新时间：${this.updateDate}`)
          .fontSize($r('app.float.text_font'))
          .margin({ top: '3vp' })
          .opacity(0.4)
      }
      .alignItems(HorizontalAlign.End)
    }
    .width(CommonConstant.FULL_WIDTH)
  }

  build() {
    Column() {
      this.targetItem()
      Row() {
        Column() {
          Row() {
            Slider({
              value: this.progressValue,
              min: CommonConstant.SLIDER_MIN_VALUE,
              max: CommonConstant.SLIDER_MAX_VALUE,
              step: CommonConstant.SLIDER_STEP,
              style: SliderStyle.InSet
            })
              .onChange((value: number) => {
                this.progressValue = Math.floor(value)
              })
              .width(CommonConstant.SLIDER_INNER_WIDTH)
            Text(`${this.progressValue}%`)
              .fontSize($r("app.float.progress_font"))
              .fontWeight(CommonConstant.FONT_WEIGHT)
              .margin({ left: $r('app.float.slider_margin_left') })
              .textAlign(TextAlign.Center)
          }

          Row() {
            Button($r('app.string.cancel_button'))
              .backgroundColor(Color.White)
              .fontColor($r('app.color.main_blue'))
            Button($r('app.string.confirm_button'))
              .backgroundColor(Color.White)
              .fontColor($r('app.color.main_blue'))
              .onClick(() => {
                this.lastsProgressValue = this.progressValue
                this.updateDate = getCurrentTime()
                this.onClickOk(this.progressValue)
                this.isExpanded = false
              })
          }
          .justifyContent(FlexAlign.SpaceAround)
          .width(CommonConstant.FULL_WIDTH)
        }
        .transition({
          scale: {
            x: 1,
            y: 0
          }
        })

      }
    }
    .onClick(() => {
      animateToImmediately({ duration: 300 }, () => {
        this.isExpanded = !this.isExpanded
      })
    })
    .backgroundColor(Color.White)
    .borderRadius('16vp')
    .padding('10vp')
    .width(CommonConstant.FULL_WIDTH)
  }
}