import Task from "./Task";

export class TaskDataService {
  private targetData: Array<Task> = [];

  // 新增
  addData(task: Task) {
    if (!task) {
      return
    }
    this.targetData.push(task)
    console.log(JSON.stringify(this.targetData) + '进来了')
  }

  // 删除（根据id删除不会写，先全删了，用下面这个清空）
  // deleteData(ids: Array<number>) {
  //   if (!ids) {
  //     hilog.error(0xFF00, '[TaskDataService]', '删除数据没传')
  //   }
  //   this.targetData = []
  // }

  // 清空
  deleteData() {
    this.targetData = []
  }

  // 更新
  updateProgress(index: number, updateValue: number, updateDate: string): boolean {
    if (!this.targetData[index]) {
      return false
    }
    this.targetData[index].progressValue = updateValue
    this.targetData[index].updateDate = updateDate
    return true
  }

  // 查询全部
  getData(): Array<Task> {
    return this.targetData
  }

  // 查询目标的进度
  getLatestProgressValue(): number {
    if (this.targetData.length === 0) {
      return 0
    }
    return this.targetData[this.targetData.length-1].progressValue
  }
}

export default new TaskDataService()