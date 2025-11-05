import CommonConstant from '../common/constant/CommonConstant'

@Component
export default struct TargetInformation {
  @Builder
  targetItem() {
    Row() {
      Image($r('app.media.headerPic'))
        .width($r('app.float.information_image'))
        .height($r('app.float.information_image'))
        .objectFit(ImageFit.Fill)
        .borderRadius(CommonConstant.IMAGE_BORDER_RADIUS)
      Column() {
        Text($r('app.string.target_name'))
          .fontSize($r('app.float.target_name_font'))
          .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
        Text($r('app.string.target_info'))
          .opacity(0.4)
          .fontSize($r('app.float.target_desc_font'))
          .margin({ top: $r('app.float.title_margin') })
      }
      .width(CommonConstant.FULL_WIDTH)
      .alignItems(HorizontalAlign.Start)
      .margin({ left: CommonConstant.TARGET_MARGIN_LEFT })
    }
  }

  @Builder
  targetProgress() {
    Row() {
      Column() {
        Text($r('app.string.overall_progress'))
          .fontSize($r('app.float.button_font'))
          .fontColor($r('app.color.title_black_color'))
          .fontWeight(CommonConstant.FONT_WEIGHT)
        Text("更新时间: 2023/12/20 23:29.01")
          .opacity(CommonConstant.OPACITY)
          .fontSize('12fp')
          .fontWeight(CommonConstant.FONT_WEIGHT)
      }
      .alignItems(HorizontalAlign.Start)

      Stack() {
        Row() {
          Text('0')
            .fontSize($r('app.float.progress_font'))
            .fontWeight(CommonConstant.FONT_WEIGHT)
            .fontColor($r('app.color.main_blue'))
          Text('/1')
            .fontSize($r('app.float.progress_font'))
            .fontWeight(CommonConstant.FONT_WEIGHT)
        }

        Progress({
          value: 1,
          total: 100,
          type: ProgressType.Ring
        })
          .color($r('app.color.main_blue'))
          .style({
            strokeWidth: CommonConstant.STROKE_WIDTH
          })
          .width($r('app.float.progress_length'))
          .width($r('app.float.progress_length'))
      }
    }
    .margin({ top: $r('app.float.progress_margin_top') })
    .width(CommonConstant.FULL_WIDTH)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
    Column() {
      this.targetItem()
      this.targetProgress()
    }
    .backgroundColor(Color.White)
    .borderRadius(CommonConstant.TARGET_BORDER_RADIUS)
    .padding($r('sys.float.account_list_corner_radius'))
  }
}