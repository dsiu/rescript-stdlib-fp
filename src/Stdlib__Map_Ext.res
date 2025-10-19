module Serializable = Stdlib__Serializable
module JSONSerializable = Stdlib__JSONSerializable

module type S = {
  type key

  // these types are from Core__Map
  type t<'k, 'v>
  let make: unit => t<'k, 'v>

  let fromArray: array<(key, 'v)> => t<'k, 'v>
  let fromIterator: Iterator.t<(key, 'v)> => t<'k, 'v>

  let size: t<'k, 'v> => int
  let isEmpty: t<'k, 'v> => bool
  let clear: t<'k, 'v> => unit

  let forEach: (t<'k, 'v>, 'v => unit) => unit
  let forEachWithKey: (t<'k, 'v>, ('v, key) => unit) => unit

  let get: (t<'k, 'v>, key) => option<'v>
  let has: (t<'k, 'v>, key) => bool
  let set: (t<'k, 'v>, key, 'v) => unit
  let delete: (t<'k, 'v>, key) => bool

  let keys: t<'k, 'v> => Iterator.t<key>
  let values: t<'k, 'v> => Iterator.t<'v>
  let entries: t<'k, 'v> => Iterator.t<(key, 'v)>

  let ignore: t<'k, 'v> => unit
}

module type T = {
  type t
}

module MakeWithPrimitive = (T: T): (S with type key = T.t) => {
  type key = T.t

  type t<'k, 'v> = Map.t<key, 'v>

  let make = Map.make

  let fromArray = Map.fromArray
  let fromIterator = Map.fromIterator

  let size = Map.size
  let isEmpty = Map.isEmpty
  let clear = Map.clear

  let forEach = Map.forEach
  let forEachWithKey = Map.forEachWithKey

  let get = Map.get
  let has = Map.has
  let set = Map.set
  let delete = Map.delete

  let keys = Map.keys
  let values = Map.values
  let entries = Map.entries

  let ignore = Map.ignore
}

module Make = (Serializable: Serializable.S): (S with type key = Serializable.t) => {
  type key = Serializable.t

  type t<'k, 'v> = Map.t<string, 'v>

  let make: unit => t<'k, 'v> = Map.make

  let fromArray = arr =>
    arr
    ->Array.map(((k, v)) => (k->Serializable.toString, v))
    ->Map.fromArray

  let fromIterator = iter => iter->Iterator.toArray->fromArray

  let size: t<'k, 'v> => int = Map.size
  let isEmpty = Map.isEmpty
  let clear: t<'k, 'v> => unit = Map.clear

  let forEach: (t<'k, 'v>, 'v => unit) => unit = Map.forEach
  let forEachWithKey: (t<'k, 'v>, ('v, key) => unit) => unit = (t, f) =>
    Map.forEachWithKey(t, (v, k) => f(v, k->Serializable.fromStringUnsafe))

  let get = (t, k) => Map.get(t, k->Serializable.toString)
  let has = (t, k) => Map.has(t, k->Serializable.toString)
  let set = (t, k, v) => Map.set(t, k->Serializable.toString, v)
  let delete = (t, k) => Map.delete(t, k->Serializable.toString)

  let keys = t => {
    t
    ->Map.keys
    ->Iterator.map(x => x->Serializable.fromStringUnsafe)
  }

  let values = Map.values

  let entries = t => {
    t
    ->Map.entries
    ->Iterator.map(((k, v)) => (k->Serializable.fromStringUnsafe, v))
  }

  let ignore = Map.ignore
}

module Key = {
  module Int = MakeWithPrimitive({
    type t = int
  })

  module String = MakeWithPrimitive({
    type t = string
  })

  module Float = MakeWithPrimitive({
    type t = float
  })

  module BigInt = MakeWithPrimitive({
    type t = BigInt.t
  })

  module Symbol = MakeWithPrimitive({
    type t = Symbol.t
  })

  module Array = {
    module Make = (A: JSONSerializable.S) => Make(Serializable.MakeArray(A))

    module Int = Make(JSONSerializable.Int)
    module String = Make(JSONSerializable.String)
    module Float = Make(JSONSerializable.Float)
  }

  module Tuple2 = {
    module Make = (A: JSONSerializable.S, B: JSONSerializable.S) => Make(
      Serializable.MakeTuple2(A, B),
    )

    module IntString = Make(JSONSerializable.Int, JSONSerializable.String)
    module StringInt = Make(JSONSerializable.String, JSONSerializable.Int)
    module IntInt = Make(JSONSerializable.Int, JSONSerializable.Int)
    module FloatFloat = Make(JSONSerializable.Float, JSONSerializable.Float)
  }

  module Tuple3 = {
    module Make = (A: JSONSerializable.S, B: JSONSerializable.S, C: JSONSerializable.S) => Make(
      Serializable.MakeTuple3(A, B, C),
    )

    module IntIntInt = Make(JSONSerializable.Int, JSONSerializable.Int, JSONSerializable.Int)
    module FloatFloatFloat = Make(
      JSONSerializable.Float,
      JSONSerializable.Float,
      JSONSerializable.Float,
    )
  }
}
