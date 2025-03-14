module type S = {
  type t
  let jsonEncode: t => Js.Json.t
  let jsonDecode: Js.Json.t => option<t>
}

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
