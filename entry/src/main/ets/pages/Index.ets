import CommonConstant from '../common/constant/CommonConstant'
import TargetInformation from '../components/TargetInformation'
import TargetList from '../components/TargetList'

@Entry
@Component
struct Index {
  @State arrData: Array<number> = [1, 2]

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
      TargetInformation()
      TargetList({ arrData: $arrData })
    }
    .backgroundColor($r('app.color.index_background'))
    .height(CommonConstant.FULL_HEIGHT)
    .padding({ left: $r('app.float.main_padding'), right: $r('app.float.main_padding') })
    .width(CommonConstant.FULL_WIDTH)
  }
}