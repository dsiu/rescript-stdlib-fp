let getExnWithMessage = (option, message) => {
  switch option {
  | Some(value) => value
  | None => Js.Exn.raiseError(message)
  }
}

// from haskell
let fromMaybe = RescriptCore.Option.getOr

module A = Stdlib__Array
// from haskell
let arrayToMayBe = A.get(_, 0)

module L = Stdlib__List
// from haskell
let listToMayBe = L.get(_, 0)
