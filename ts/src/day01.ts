import * as util from "./util"

function part1(input: string) {
  let ans: number = 0
  let last = Number.MAX_VALUE
  input.split(/\n/).map(Number).map(n => {
    if (n > last) {
      ans++
    }
    last = n
  })

  console.log(ans)
}

function part2(input: string) {
  let ans: number = 0
  let last = Number.MAX_VALUE
  input.split(/\n/)
    .map(Number)
    .each_cons(3,
      (...nums) => {
        const next = util.sum(nums)
        if (next > last) {
          ans++
        }
        last = next
      })

  console.log(ans)
}

util.withInput("input/day01.txt", input => {
  part1(input)
  part2(input)
})