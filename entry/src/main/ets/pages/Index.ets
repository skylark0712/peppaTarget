import CommonConstant from '../common/constant/CommonConstant'
import TargetInformation from '../components/TargetInformation'

@Entry
@Component
struct Index {
  @State arrData: Array<number> = [1, 2, 3, 4, 5]

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
      Column() {
        Row() {
          Text('子目标')
            .fontSize('20fp')
            .fontColor($r('app.color.title_black_color'))
            .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
          Blank()
          Text('编辑')
            .fontColor($r('app.color.main_blue'))
            .fontSize($r('app.float.button_font'))
            .fontWeight(CommonConstant.FONT_WEIGHT)
        }
        .padding({
          left: '14vp',
          right: '14vp'
        })
        .width(CommonConstant.FULL_WIDTH)

        List({ space: 10 }) {
          ForEach(this.arrData, (item: string) => {
            ListItem() {
              Column() {
                Row() {
                  Text(`${item}`)
                    .fontSize('16vp')
                    .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
                  Blank()
                  Column() {
                    Text('0%')
                      .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
                    Text('更新时间：2023/12/20 23:39:01')
                      .opacity(0.4)
                      .fontSize($r('app.float.text_font'))
                      .margin({ top: '3vp' })
                  }.alignItems(HorizontalAlign.End)
                }.width(CommonConstant.FULL_WIDTH)

                Row() {
                  Column() {
                    Row() {
                      Slider({
                        value: 1,
                        min: 0,
                        max: 100,
                        step: 1,
                        style: SliderStyle.InSet
                      }).width('70%')
                      Text('0%').fontSize('14fp')
                    }

                    Row() {
                      Button('取消')
                        .fontColor($r('app.color.main_blue'))
                        .backgroundColor(Color.White)
                      Button('确定')
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
          }, (item: string) => item)
        }
        .margin({ top: '10vp' })

        Blank()
        Button('添加子目标')
          .margin({ top: '16vp' })
          .backgroundColor(Color.Gray)
          .fontColor($r('app.color.main_blue'))
      }
      .padding({ top: '14vp' })
      .width(CommonConstant.FULL_WIDTH)
      .height('55%')
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