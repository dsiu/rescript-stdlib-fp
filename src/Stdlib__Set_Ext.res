module Serializable = Stdlib__Serializable
module JSONSerializable = Stdlib__JSONSerializable

module type S = {
  type a
  type t<'a>

  let make: unit => t<_>

  let fromArray: array<a> => t<'a>
  let fromIterator: Iterator.t<a> => t<'a>

  let size: t<'a> => int
  let isEmpty: t<'a> => bool
  let clear: t<'a> => unit

  let add: (t<'a>, a) => unit
  let delete: (t<'a>, a) => bool
  let has: (t<'a>, a) => bool

  let forEach: (t<'a>, a => unit) => unit

  let values: t<'a> => Iterator.t<a>

  let difference: (t<'a>, t<'a>) => t<'a>
  let intersection: (t<'a>, t<'a>) => t<'a>
  let union: (t<'a>, t<'a>) => t<'a>
  let symmetricDifference: (t<'a>, t<'a>) => t<'a>
  let isSubsetOf: (t<'a>, t<'a>) => bool
  let isSupersetOf: (t<'a>, t<'a>) => bool
  let isDisjointFrom: (t<'a>, t<'a>) => bool

  let toArray: t<'a> => array<a>
  let ignore: t<'a> => unit
}

module type T = {
  type t
}

module MakeWithPrimitive = (T: T): (S with type a = T.t) => {
  type a = T.t
  type t<'a> = Set.t<a>

  let make = Set.make

  let fromArray = Set.fromArray
  let fromIterator = Set.fromIterator

  let size = Set.size
  let isEmpty = Set.isEmpty
  let clear = Set.clear

  let add = Set.add
  let delete = Set.delete
  let has = Set.has

  let forEach = Set.forEach

  let values = Set.values

  let difference = Set.difference
  let intersection = Set.intersection
  let union = Set.union
  let symmetricDifference = Set.symmetricDifference
  let isSubsetOf = Set.isSubsetOf
  let isSupersetOf = Set.isSupersetOf
  let isDisjointFrom = Set.isDisjointFrom

  let toArray = Set.toArray
  let ignore = Set.ignore
}

module Make = (Serializable: Serializable.S): (S with type a = Serializable.t) => {
  type a = Serializable.t
  type t<'a> = Set.t<string>

  let make: unit => t<'a> = Set.make

  let fromArray = arr =>
    arr
    ->Array.map(Serializable.toString)
    ->Set.fromArray

  let fromIterator = iter => iter->Iterator.toArray->fromArray

  let size = Set.size
  let isEmpty = Set.isEmpty
  let clear = Set.clear

  let add = (t, a) => t->Set.add(a->Serializable.toString)
  let delete = (t, a) => t->Set.delete(a->Serializable.toString)
  let has = (t, a) => t->Set.has(a->Serializable.toString)

  let forEach = (t, f) => t->Set.forEach(a => f(a->Serializable.fromStringUnsafe))

  let values = t => {
    t
    ->Set.values
    ->Iterator.map(Serializable.fromStringUnsafe) // Lazy deserialization
  }

  let difference = Set.difference
  let intersection = Set.intersection
  let union = Set.union
  let symmetricDifference = Set.symmetricDifference
  let isSubsetOf = Set.isSubsetOf
  let isSupersetOf = Set.isSupersetOf
  let isDisjointFrom = Set.isDisjointFrom

  let toArray = t => t->Set.toArray->Array.map(Serializable.fromStringUnsafe)
  let ignore = Set.ignore
}

module Value = {
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
