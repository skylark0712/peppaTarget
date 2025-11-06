export class IdGen {
  id: number = 0

  genId() {
    this.id = this.id++
    return this.id
  }
}

export default new IdGen()