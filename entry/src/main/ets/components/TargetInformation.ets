import CommonConstant from '../common/constant/CommonConstant'

@Component
export default struct TargetInformation {
  @Prop totalTaskNum: number
  @Prop latestUpdateDate: string
  @Prop completedTaskNumber: number

  @Builder
  targetItem() {
    Row() {
      Image($r('app.media.headerPic'))
        .borderRadius(CommonConstant.IMAGE_BORDER_RADIUS)
        .height($r('app.float.information_image'))
        .objectFit(ImageFit.Fill)
        .width($r('app.float.information_image'))
      Column() {
        Text($r('app.string.target_name'))
          .fontSize($r('app.float.target_name_font'))
          .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
        Text($r('app.string.target_info'))
          .fontSize($r('app.float.target_desc_font'))
          .margin({ top: $r('app.float.title_margin') })
          .opacity(0.4)
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: CommonConstant.TARGET_MARGIN_LEFT })
      .width(CommonConstant.FULL_WIDTH)
    }
  }

  @Builder
  targetProgress() {
    Row() {
      Column() {
        Text($r('app.string.overall_progress'))
          .fontColor($r('app.color.title_black_color'))
          .fontSize($r('app.float.button_font'))
          .fontWeight(CommonConstant.FONT_WEIGHT)
        Text(`更新时间：${this.latestUpdateDate}`)
          .fontSize('12fp')
          .fontWeight(CommonConstant.FONT_WEIGHT)
          .opacity(CommonConstant.OPACITY)
      }
      .alignItems(HorizontalAlign.Start)

      Stack() {
        Row() {
          Text(`${this.completedTaskNumber}`)
            .fontColor($r('app.color.main_blue'))
            .fontSize($r('app.float.progress_font'))
            .fontWeight(CommonConstant.FONT_WEIGHT)
          Text(`/${this.totalTaskNum}`)
            .fontSize($r('app.float.progress_font'))
            .fontWeight(CommonConstant.FONT_WEIGHT)
        }

        Progress({ value: this.completedTaskNumber, total: this.totalTaskNum, type: ProgressType.Ring })
          .color($r('app.color.main_blue'))
          .style({ strokeWidth: CommonConstant.STROKE_WIDTH })
          .width($r('app.float.progress_length'))
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .margin({ top: $r('app.float.progress_margin_top') })
    .width(CommonConstant.FULL_WIDTH)
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