type t = int

include TableclothComparator.Make({
  type t = t

  let compare = (a, b) => compare(a, b)
})

//use RescriptCore.Int.Conatants.minValue instead
//let minimumValue = Js.Int.min

// use RescriptCore.Int.Constants.maxValue instead
//let maximumValue = Js.Int.max

let zero = 0

let one = 1

// use RescriptCore.Int.fromString instead
//let fromString = s =>
//  switch int_of_string(s) {
//  | i => Some(i)
//  | exception Failure(_) => None
//  }

let add = \"+"

let subtract = \"-"

let multiply = \"*"

let divide = (n, ~by) => n / by

let divideFloat = (n, ~by) => Int.toFloat(n) /. Int.toFloat(by)

// use RescriptCore.Math.Int.pow instead
//let power = (~base, ~exponent) => {
//  let result = Js.Math.pow_float(~base=Js.Int.toFloat(base), ~exp=Js.Int.toFloat(exponent))
//
//  let result = if result > TableclothFloat.maximumSafeInteger {
//    TableclothFloat.maximumSafeInteger
//  } else if result < TableclothFloat.minimumSafeInteger {
//    TableclothFloat.minimumSafeInteger
//  } else {
//    result
//  }
//
//  Js.Math.unsafe_trunc(result)
//}

let negate = \"~-"

let remainder = (n, ~by) => mod(n, by)

let modulo = (n, ~by) =>
  mod(
    if n <= 0 {
      abs(n) * 2
    } else {
      n
    },
    by,
  )

// use RescriptCore.Math.Int.max instead
//let maximum = (a, b) => Js.Math.max_int(a, b)

// use RescriptCore.Math.Int.min instead
//let minimum = (a, b) => Js.Math.min_int(a, b)

// use RescriptCore.Math.Int.abs instead
//let absolute = abs

let isEven = n => mod(n, 2) == 0

let isOdd = n => mod(n, 2) != 0

// use RescriptCore.Int.clamp instead
//let clamp = (n, ~lower, ~upper) =>
//  if upper < lower {
//    raise(Invalid_argument("~lower must be less than or equal to ~upper"))
//  } else {
//    max(lower, min(upper, n))
//  }

let inRange = (n, ~lower, ~upper) =>
  if upper < lower {
    raise(Invalid_argument("~lower must be less than or equal to ~upper"))
  } else {
    n >= lower && n < upper
  }

// use RescriptCore.Int.toFloat instead
// let toFloat = t => Js.Int.toFloat(t)

// use RescriptCore.Int.toString instead
//let toString = t => Js.Int.toString(t)

// use RescriptCore.Int.equal instead
// let equal = \"="

// let compare = RescriptCore.Int.compare
