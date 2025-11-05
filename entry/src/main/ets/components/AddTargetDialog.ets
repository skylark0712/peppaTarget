import CommonConstant from "../common/constant/CommonConstant"

@CustomDialog
export default struct AddTargetDialog {
  controller: CustomDialogController
  @State textInputValue: string = ''
  onClickOk: Function = () => {
  }

  build() {
    Column() {
      Text('子目标')
        .fontSize('16fp')
        .fontWeight(CommonConstant.FONT_WEIGHT_LARGE)
        .width(CommonConstant.FULL_WIDTH)
        .textAlign(TextAlign.Start)
      Row() {
        TextInput({ text: this.textInputValue }).onChange((value: string) => {
          this.textInputValue = value
        })
      }.margin({ top: 5 })

      Row() {
        Button('取消')
          .backgroundColor(Color.White)
          .fontColor($r('app.color.main_blue'))
          .onClick(() => {
            this.controller.close()
          })
        Button('确定')
          .backgroundColor(Color.White)
          .fontColor($r('app.color.main_blue'))
          .onClick(() => {
            this.onClickOk(this.textInputValue)
            this.controller.close()
          })
      }
    }.width(CommonConstant.FULL_WIDTH)
    .padding(10)
  }
}