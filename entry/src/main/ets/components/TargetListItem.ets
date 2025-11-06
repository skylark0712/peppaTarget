import CommonConstant from "../common/constant/CommonConstant"
import Task from "../viewmodel/Task"

@Component
export default struct TargetListItem {
  taskItem?: Task
  @Prop latestUpdateDate: string

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
        Text(`更新时间：${this.latestUpdateDate}`)
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
              value: this.taskItem?.progressValue,
              min: CommonConstant.SLIDER_MIN_VALUE,
              max: CommonConstant.SLIDER_MAX_VALUE,
              step: CommonConstant.SLIDER_STEP,
              style: SliderStyle.InSet
            })
              // .onChange((value: number) => {
              //   this.taskItem?.progressValue = value
              // })
              .width(CommonConstant.SLIDER_INNER_WIDTH)
            Text('0%')
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
          }
          .justifyContent(FlexAlign.SpaceAround)
          .width(CommonConstant.FULL_WIDTH)
        }
      }
    }
    .backgroundColor(Color.White)
    .borderRadius('16vp')
    .padding('10vp')
    .width(CommonConstant.FULL_WIDTH)
  }
}