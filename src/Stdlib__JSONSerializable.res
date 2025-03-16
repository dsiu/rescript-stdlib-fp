module type S = {
  type t
  let jsonEncode: t => Js.Json.t
  let jsonDecode: Js.Json.t => option<t>
}

// ref: https://forum.rescript-lang.org/t/difficulties-with-functors-and-abstract-types/6007/2?u=dsiu
// do NOT need to annotate the type here with type S since modules are structurally typed. using
// module type annotation will REMOVE information
module Int = {
  type t = int
  let jsonEncode = JSON.Encode.int
  let jsonDecode = j => j->JSON.Decode.float->Option.map(Float.toInt)
}

module String = {
  type t = string
  let jsonEncode = JSON.Encode.string
  let jsonDecode = j => j->JSON.Decode.string
}

module Bool = {
  type t = bool
  let jsonEncode = JSON.Encode.bool
  let jsonDecode = j => j->JSON.Decode.bool
}

module Float = {
  type t = float
  let jsonEncode = JSON.Encode.float
  let jsonDecode = j => j->JSON.Decode.float
}
