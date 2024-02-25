include RescriptCore.Math

//
// [dsiu] my math utils
//
let rec gcd = (a, b) => {a > 0 ? gcd(RescriptCore.Int.mod(b, a), a) : b}
let lcm = (a, b) => a * b / gcd(a, b)

module BigInt = {
  module BigInt = RescriptCore.BigInt

  let rec gcd: (BigInt.t, BigInt.t) => BigInt.t = (a, b) => {
    open! BigInt
    a > 0->fromInt ? gcd(mod(b, a), a) : b
  }

  let lcm: (BigInt.t, BigInt.t) => BigInt.t = (a, b) => {
    open! BigInt
    a * b / gcd(a, b)
  }

  let max: (BigInt.t, BigInt.t) => BigInt.t = (a, b) => a > b ? a : b
  let min: (BigInt.t, BigInt.t) => BigInt.t = (a, b) => a < b ? a : b
}
