type t = string

include TableclothComparator.Make({
  type t = t

  let compare = (a, b) => compare(a, b)
})

let initialize = (length, ~f) =>
  Array.fromInitializer(~length, index => TableclothChar.toString(f(index)))->Array.join("")

// use String.charAt instead
// let get = (string: string, index: int) => String.get(string, index)

// use String.get instead
//let getAt = (string: string, ~index: int) =>
//  if index < 0 || index >= Js.String.length(string) {
//    None
//  } else {
//    Some(String.get(string, index))
//  }

let fromArray = characters =>
  characters
  ->Array.map(character => String.fromCharCode(TableclothChar.toCode(character)))
  ->Array.join("")

let fromList = t =>
  t
  ->List.toArray
  ->Array.map(character => String.fromCharCode(TableclothChar.toCode(character)))
  ->Array.join("")

let fromChar = c => String.fromCharCode(TableclothChar.toCode(c))

// use String.indexOf instead
//let indexOf = (haystack, needle): option<int> => {
//  let result = Js.String.indexOf(needle, haystack)
//  if result == -1 {
//    None
//  } else {
//    Some(result)
//  }
//}

// use String.lastIndexOfOpt instead
//let indexOfRight = (haystack, needle): option<int> => {
//  let result = Js.String.lastIndexOf(needle, haystack)
//  if result == -1 {
//    None
//  } else {
//    Some(result)
//  }
//}

let isEmpty = t => t == ""

// use String.length instead
// let length = t => Js.String.length(t)

// todo:
let uncons = s =>
  switch s {
  | "" => None
  | s => Some(String.getUnsafe(s, 0), String.sliceToEnd(s, ~start=1))
  }

let dropLeft = (s, ~count) => s->String.sliceToEnd(~start=count)

let dropRight = (s, ~count) =>
  if count < 1 {
    s
  } else {
    s->String.slice(~start=0, ~end=-count)
  }

// let split = (t, ~on) => Array.to_list(Js.String.split(on, t))

// let endsWith = (t, ~suffix) => Js.String.endsWith(suffix, t)

// let startsWith = (t, ~prefix) => Js.String.startsWith(prefix, t)

// let trim = t => String.trim(t)

// @send external trimLeft: string => string = "trimStart"

// @send external trimRight: string => string = "trimEnd"

//@send external padLeft: (string, int, string) => string = "padStart"

//let padLeft = (string, count, ~with_) => padLeft(string, count, with_)

//@send external padRight: (string, int, string) => string = "padEnd"

//let padRight = (string, count, ~with_) => padRight(string, count, with_)

//let toLowercase = t => Js.String.toLowerCase(t)

//let toUppercase = t => Js.String.toUpperCase(t)

//let uncapitalize = str =>
//  Js.String.toLowerCase(Js.String.charAt(0, str)) ++ Js.String.sliceToEnd(~from=1, str)
let uncapitalize = str => {
  module String = String
  String.toLowerCase(String.charAt(str, 0)) ++ String.sliceToEnd(~start=1, str)
}

//let capitalize = str =>
//  Js.String.toUpperCase(Js.String.charAt(0, str)) ++ Js.String.sliceToEnd(~from=1, str)

let capitalize = str => {
  module String = String
  String.toUpperCase(String.charAt(str, 0)) ++ String.sliceToEnd(~start=1, str)
}

let isCapitalized = s => s == capitalize(s)

//let includes = (t, ~substring) => Js.String.includes(substring, t)

//let repeat = (s, ~count) => Js.String.repeat(count, s)

let reverse = s => {
  let r = s->String.split("")
  r->Array.reverse
  r->Array.join("")
}

let toArray = (t: string): array<char> =>
  Js.Array.map(
    characterString => Belt.Option.getExn(TableclothChar.fromString(characterString)),
    Js.Array.from(Js.String.castToArrayLike(t)),
  )

let toList = (s: string): list<char> => Belt.List.fromArray(toArray(s))

//let slice = (~to_=?, t: string, ~from): string =>
//  Js.String.slice(~from, ~to_=Belt.Option.getWithDefault(to_, String.length(t)), t)

let insertAt = (t, ~index, ~value) =>
  String.slice(~start=0, ~end=index, t) ++ (value ++ String.sliceToEnd(~start=index, t))

let forEach = (t, f) => Js.Array.forEach(a => f(a), toArray(t))

//let forEach = (t, ~f) => {
//  t->toArray->Array.forEach(a => f(a))
//}

let fold = (t, ~initial, ~f) => Array.reduce(toArray(t), initial, (a, ch) => f(a, ch))

// let equal = \"="

let compare = String.compare
