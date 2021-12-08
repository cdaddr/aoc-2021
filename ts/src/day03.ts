import * as util from "./util"
import {parseInt} from "lodash"

function part1(input: string) {
  let counts: Array<Map<string, number>> = []
  input.split(/\n/).map(line => {
    [...line].forEach((chr, i) => {
      counts[i] ||= new Map()
      counts[i].set(chr, (counts[i].get(chr) || 0) + 1)
    })
  })

  let gamma = ''
  let epsilon = ''
  counts.forEach((m, _) => {
    // @ts-ignore
    gamma = gamma + (m.get('0') > m.get('1') ? '0' : '1')
    // @ts-ignore
    epsilon = epsilon + (m.get('0') > m.get('1') ? '1' : '0')

  })
  console.log(parseInt(gamma,2) * parseInt(epsilon, 2))

}

function part2(input: string) {
  let lines = [...input.split(/\n/)]
  let pos = 0;
  while (lines.length > 1) {
    let count:any = {'0': 0, '1': 0}
    for (const line of lines) {
      if(line[pos] === '0' || line[pos] === '1') {
        count[line[pos]] ||= 0
        count[line[pos]]++
      }
    }
    const sorted = Object.entries(count).sort((a:any,b:any) => {
      return a[1] > b[1] ? 1 : a[1] < b[1] ? -1 : 0
      })
    lines = lines.filter(line => {return line[pos] === sorted[1][0]})
    pos++

  }
  const o2 = parseInt(lines[0], 2)

  lines = [...input.split(/\n/)]
  pos = 0
  while (lines.length > 1) {
    let count:any = {'0': 0, '1': 0}
    for (const line of lines) {
      if(line[pos] === '0' || line[pos] === '1') {
        count[line[pos]] ||= 0
        count[line[pos]]++
      }
    }
    const sorted = Object.entries(count).sort((a:any,b:any) => {
      return a[1] > b[1] ? 1 : a[1] < b[1] ? -1 : 0
    })
    lines = lines.filter(line => {return line[pos] === sorted[0][0]})
    pos++

  }
  const co2 = parseInt(lines[0], 2)
  console.log(o2 * co2)
}

util.withInput("input/day03.txt", input => {
  part1(input)
  part2(input)
})