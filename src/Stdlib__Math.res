include RescriptCore.Math

//
// [dsiu] my math utils
//
let rec gcd = (a, b) => {a > 0 ? gcd(RescriptCore.Int.mod(b, a), a) : b}
let lcm = (a, b) => a * b / gcd(a, b)

module BigInt = RescriptCore.BigInt

let rec gcdBigInt: (BigInt.t, BigInt.t) => BigInt.t = (a, b) => {
  open! BigInt
  a > 0->fromInt ? gcdBigInt(mod(b, a), a) : b
}
let lcmBigInt: (BigInt.t, BigInt.t) => BigInt.t = (a, b) => {
  open! BigInt
  a * b / gcdBigInt(a, b)
}
