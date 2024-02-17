open RescriptCore
open Result

type u<'ok, 'error> = result<'ok, 'error>

let ok = a => Ok(a)

let error = e => Error(e)

let fromOption = (ma, ~error) =>
  switch ma {
  | None => Error(error)
  | Some(right) => Ok(right)
  }

//let isError = t => Belt.Result.isError(t)

//let isOk = t => Belt.Result.isOk(t)

let both = (a, b) =>
  switch (a, b) {
  | (Ok(a'), Ok(b')) => Ok(a', b')
  | (Error(a'), _) => Error(a')
  | (_, Error(b')) => Error(b')
  }

let flatten = a =>
  switch a {
  | Ok(a') => a'
  | Error(error) => Error(error)
  }

let orElse = (a, b) =>
  switch a {
  | Ok(_) => a
  | _ => b
  }

let or_ = orElse

//let or_else = (a, b) =>
//  switch b {
//  | Ok(_) => b
//  | _ => a
//  }

let and_ = (a, b) =>
  switch a {
  | Ok(_) => b
  | _ => a
  }

let unwrap = Result.getOr

let unwrapLazy = (t, ~default) =>
  switch t {
  | Ok(t') => t'
  | Error(_) => Lazy.force(default)
  }

let unwrapUnsafe = t => Belt.Result.getExn(t)

let unwrapError = (t, ~default) =>
  switch t {
  | Ok(_) => default
  | Error(value) => value
  }

let map2 = (a, b, f) =>
  switch (a, b) {
  | (Ok(a), Ok(b)) => Ok(f(a, b))
  | (Error(a), _) => Error(a)
  | (_, Error(b)) => Error(b)
  }

//let values = t => List.fold_right((c, d) => map2(c, d, (a, b) => list{a, ...b}), t, Ok(list{}))

let values = t =>
  t->TableclothList.foldRight(~initial=Ok(list{}), ~f=(c, d) => map2(d, c, (a, b) => list{a, ...b}))

let combine = (l: list<result<'ok, 'error>>): result<list<'ok>, 'error> =>
  TableclothList.foldRight(
    ~f=(accum: result<list<'ok>, 'error>, value: result<'ok, 'error>): result<list<'ok>, 'error> =>
      map2(value, accum, (head: 'ok, list: list<'ok>) => list{head, ...list}),
    ~initial=Ok(list{}),
    l,
  )

let map = Result.map

let mapError = Result.mapError

let toOption = r =>
  switch r {
  | Ok(v) => Some(v)
  | Error(_) => None
  }

let andThen = flatMap

let attempt = f =>
  switch f() {
  | value => Ok(value)
  | exception error => Error(error)
  }

let tap = (t, f) =>
  switch t {
  | Ok(a) => f(a)
  | _ => ()
  }

//let equal = (a, b, equalOk, equalError) =>
//  switch (a, b) {
//  | (Error(a'), Error(b')) => equalError(a', b')
//  | (Ok(a'), Ok(b')) => equalOk(a', b')
//  | _ => false
//  }

//let compare = (
//  a: t<'ok, 'error>,
//  b: t<'ok, 'error>,
//  ~f as compareOk: ('ok, 'ok) => int,
//  ~g as compareError: ('error, 'error) => int,
//): int =>
//  switch (a, b) {
//  | (Error(a'), Error(b')) => compareError(a', b')
//  | (Ok(a'), Ok(b')) => compareOk(a', b')
//  | (Error(_), Ok(_)) => -1
//  | (Ok(_), Error(_)) => 1
//  }
