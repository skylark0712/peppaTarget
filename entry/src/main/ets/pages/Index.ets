import CommonConstant from '../common/constant/CommonConstant'
import TargetInformation from '../components/TargetInformation'
import TargetList from '../components/TargetList'

@Entry
@Component
struct Index {
  @State arrData: Array<number> = []

  @Builder
  titleBar() {
    Text($r('app.string.title'))
      .height($r('app.float.title_height'))
      .fontSize($r('app.float.title_font_size'))
      .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
      .textAlign(TextAlign.Start)
      .width(CommonConstant.TITLE_WIDTH)
      .margin({
        top: $r('app.float.title_margin'),
        bottom: $r('app.float.title_margin')
      })
  }

  build() {
    Column() {
      this.titleBar()
      TargetInformation()
      TargetList({ arrData: $arrData })
    }
    .height(CommonConstant.FULL_HEIGHT)
    .width(CommonConstant.FULL_WIDTH)
    .padding({
      left: $r('app.float.main_padding'),
      right: $r('app.float.main_padding')
    })
    .backgroundColor($r('app.color.index_background'))
  }
}