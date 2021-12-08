import * as util from "./util"

function part1(input: string) {
  let ans: number = 0
  let horiz = 0
  let depth = 0
  input.split(/\n/).map(line => {
    let _, [dir, num] = line.split(/ /)
    let n = Number(num)

    if (dir === "up") {
      depth -= n
    } else if (dir === "down") {
      depth += n
    } else if (dir === "forward") {
      horiz += n
    } else {
      throw `Invalid ${line}`
    }
  })

  ans = horiz * depth
  console.log(ans)
}

function part2(input: string) {
  let ans: number = 0
  let horiz = 0
  let depth = 0
  let aim = 0
  input.split(/\n/).map(line => {
    let _, [dir, num] = line.split(/ /)
    let n = Number(num)

    if (dir === "up") {
      aim -= n
    } else if (dir === "down") {
      aim += n
    } else if (dir === "forward") {
      horiz += n
      depth += aim * n
    } else {
      throw `Invalid ${line}`
    }
  })

  ans = horiz * depth
  console.log(ans)
}

util.withInput("input/day02.txt", input => {
  part1(input)
  part2(input)
})