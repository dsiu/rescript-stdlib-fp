include Math

//
// [dsiu] my math utils
//
let rec gcd = (a, b) => {a > 0 ? gcd(mod(b, a), a) : b}
let lcm = (a, b) => a * b / gcd(a, b)

module BigInt = {
  module BigInt = BigInt

  let rec gcd: (bigint, bigint) => bigint = (a, b) => {
    open! BigInt
    a > 0->fromInt ? gcd(mod(b, a), a) : b
  }

  let lcm: (bigint, bigint) => bigint = (a, b) => {
    open! BigInt
    a * b / gcd(a, b)
  }

  let max: (bigint, bigint) => bigint = (a, b) => a > b ? a : b
  let min: (bigint, bigint) => bigint = (a, b) => a < b ? a : b
}
