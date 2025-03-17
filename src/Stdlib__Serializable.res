module JSONSerializable = Stdlib__JSONSerializable

module type S = {
  type t
  let toString: t => string
  let fromString: string => option<t>
  let fromStringUnsafe: string => t
}

module MakeArray = (A: JSONSerializable.S): (S with type t = array<A.t>) => {
  type t = array<A.t>

  let toString = arr => arr->Array.map(A.jsonEncode)->JSON.Encode.array->JSON.stringify

  let fromString = str => {
    str
    ->JSON.parseExn
    ->JSON.Decode.array
    ->Option.flatMap(arr => arr->Array.map(x => x->A.jsonDecode->Option.getExn)->Some)
  }

  let fromStringUnsafe = str => str->fromString->Option.getExn
}

module MakeTuple2 = (A: JSONSerializable.S, B: JSONSerializable.S): (
  S with type t = (A.t, B.t)
) => {
  type t = (A.t, B.t)

  let toString = ((a, b)) => [a->A.jsonEncode, b->B.jsonEncode]->JSON.Encode.array->JSON.stringify

  let fromString = str => {
    let arr =
      str
      ->JSON.parseExn
      ->JSON.Decode.array

    let a = arr->Option.flatMap(arr => arr[0]->Option.flatMap(A.jsonDecode))
    let b = arr->Option.flatMap(arr => arr[1]->Option.flatMap(B.jsonDecode))

    switch (a, b) {
    | (Some(a), Some(b)) => Some((a, b))
    | _ => None
    }
  }

  let fromStringUnsafe = str => str->fromString->Option.getExn
}

module MakeTuple3 = (A: JSONSerializable.S, B: JSONSerializable.S, C: JSONSerializable.S): (
  S with type t = (A.t, B.t, C.t)
) => {
  type t = (A.t, B.t, C.t)

  let toString = ((a, b, c)) =>
    [a->A.jsonEncode, b->B.jsonEncode, c->C.jsonEncode]->JSON.Encode.array->JSON.stringify

  let fromString = str => {
    let arr =
      str
      ->JSON.parseExn
      ->JSON.Decode.array

    let a = arr->Option.flatMap(arr => arr[0]->Option.flatMap(A.jsonDecode))
    let b = arr->Option.flatMap(arr => arr[1]->Option.flatMap(B.jsonDecode))
    let c = arr->Option.flatMap(arr => arr[2]->Option.flatMap(C.jsonDecode))

    switch (a, b, c) {
    | (Some(a), Some(b), Some(c)) => Some((a, b, c))
    | _ => None
    }
  }

  let fromStringUnsafe = str => str->fromString->Option.getExn
}

module String = {
  type t = string
  let toString = s => s
  let fromString = s => Some(s)
  let fromStringUnsafe = s => s
}
