import fs from "fs"

export function sum(list: number[]): number {

  return list.reduce((acc, x) => {
    return acc + x
  }, 0)

}

declare global {
  interface Array<T> {
    each_cons(chunks: number, func: (...arg: T[]) => any): any
  }
}

Array.prototype.each_cons = function(chunks, func) {
  for (let i = 0; i < this.length - chunks; i++) {
    func(...this.slice(i, i + chunks))
  }
}

export function withInput(name: string, callback: (input: string) => void) {
  fs.readFile(name, (err, buf) => {
    if (err) {
      throw err
    }
    const input = buf.toString()
    callback(input)
  })
}

export function cmp<T extends (number | string)>(x: T, y:T): number {
  return x.toString().localeCompare(y.toString());
}