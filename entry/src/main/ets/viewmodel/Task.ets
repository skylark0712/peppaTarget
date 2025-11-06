export default class Task {
  id: number
  taskName: string
  updateDate: string
  progressValue: number

  constructor(id: number, taskName: string, updateDate: string, progressValue: number) {
    this.id = id
    this.taskName = taskName
    this.updateDate = updateDate
    this.progressValue = progressValue
  }
}