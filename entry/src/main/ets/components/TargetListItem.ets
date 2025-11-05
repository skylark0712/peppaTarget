import CommonConstant from "../common/constant/CommonConstant"

@Component
export default struct TargetListItem {
  private taskItem?: number

  @Builder
  targetItem() {
    Row() {
      Text(`${this.taskItem}`)
        .fontSize('16vp')
        .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
      Blank()
      Column() {
        Text('0%')
          .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
        Text('更新时间：2023/12/20 23:39:10')
          .opacity(0.4)
          .fontSize($r('app.float.text_font'))
          .margin({ top: '3vp' })
      }.alignItems(HorizontalAlign.End)
    }.width(CommonConstant.FULL_WIDTH)
  }

  build() {
    Column() {
      this.targetItem()
      Row() {
        Column() {
          Row() {
            Slider({
              value: 1,
              min: CommonConstant.SLIDER_MIN_VALUE,
              max: CommonConstant.SLIDER_MAX_VALUE,
              step: CommonConstant.SLIDER_STEP,
              style: SliderStyle.InSet
            })
              .width(CommonConstant.SLIDER_INNER_WIDTH)

            Text('0%')
              .fontSize($r("app.float.progress_font"))
              .fontWeight(CommonConstant.FONT_WEIGHT)
              .textAlign(TextAlign.Center)
              .margin({ left: $r('app.float.slider_margin_left') })
          }

          Row() {
            Button($r('app.string.cancel_button'))
              .fontColor($r('app.color.main_blue'))
              .backgroundColor(Color.White)
            Button($r('app.string.confirm_button'))
              .fontColor($r('app.color.main_blue'))
              .backgroundColor(Color.White)
          }
          .justifyContent(FlexAlign.SpaceAround)
          .width(CommonConstant.FULL_WIDTH)
        }

      }
    }
    .width(CommonConstant.FULL_WIDTH)
    .borderRadius('16vp')
    .padding('10vp')
    .backgroundColor(Color.White)
  }
}