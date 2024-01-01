let getExnWithMessage = (option, message) => {
  switch option {
  | Some(value) => value
  | None => Js.Exn.raiseError(message)
  }
}

/**
  option(a,b): returns a if a is Some(_) other wise return b
 */
let optionOr: (option<'a>, option<'a>) => option<'a> = (a, b) => {
  switch a {
  | Some(_) => a
  | None => b
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
