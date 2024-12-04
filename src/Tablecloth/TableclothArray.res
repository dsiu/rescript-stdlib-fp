type t<'a> = array<'a>

let singleton = a => [a]

let clone = t => Array.map(t, TableclothFun.identity)

let isEmpty = a => Array.length(a) == 0

let initialize = (length, f) => Array.fromInitializer(~length, f)

let range = (~from=0, to_) => Array.fromInitializer(~length=to_ - from, i => i + from)

//let fromList = t => List.toArray(t)

//let toList: array<'a> => list<'a> = t => List.fromArray(t)

let toIndexedList = (array: array<'a>): list<(int, 'a)> =>
  snd(
    Array.reduceRight(array, (Array.length(array) - 1, list{}), ((i, acc), x) => (
      i - 1,
      list{(i, x), ...acc},
    )),
  )

// dont't define get here. use Array.get instead for zero cost binding
//let get = (t, k) => Belt.Array.getExn(t, k)

// todo:
// Array.getUnsafe returns undefined instead of throwing
// use Belt.Array.getExn instead until it is fixed
// https://github.com/rescript-association/rescript-core/issues/172
let getUnsafe = Array.getUnsafe

//let getAt = (t, ~index) => Array.get(t, index)
// let get = Array.get
// @get_index external get: (array<'a>, int) => option<'a> = ""

let first = Array.get(_, 0)

// dont't define get here. use Array.get instead for zero cost binding
//let set = (t, index, value) => t[index] = value

// todo:
// Array.setUnsafe returns undefined instead of throwing
// use Belt.Array.setExn instead until it is fixed
// https://github.com/rescript-association/rescript-core/issues/172
let setUnsafe = Array.setUnsafe

//let setAt = (t, ~index, ~value) => t[index] = value
// let set = Array.set
// @set_index external set: (array<'a>, int, 'a) => unit = ""

// let filter = (t, f) => Array.filter(t, a => f(a))

let swap = (t, i, j) => {
  let temp = t[i]->Option.getExn
  t[i] = t[j]->Option.getExn
  t[j] = temp
  ()
}

let fold = (t, ~initial, ~f) => Array.reduce(t, initial, (a, b) => f(a, b))

let foldRight = (t, ~initial, ~f) => Array.reduceRight(t, initial, (a, b) => f(a, b))

let maximum = (t, ~compare) =>
  fold(t, ~initial=None, ~f=(max, element) =>
    switch max {
    | None => Some(element)
    | Some(current) => compare(element, current)->Ordering.isGreater ? Some(element) : max
    }
  )

let minimum = (t, ~compare) =>
  fold(t, ~initial=None, ~f=(min, element) =>
    switch min {
    | None => Some(element)
    | Some(current) => compare(element, current)->Ordering.isLess ? Some(element) : min
    }
  )

let extent = (t, ~compare) =>
  fold(t, ~initial=None, ~f=(range, element) =>
    switch range {
    | None => Some(element, element)
    | Some(min, max) =>
      Some(
        compare(element, min)->Ordering.isLess ? element : min,
        compare(element, max)->Ordering.isGreater ? element : max,
      )
    }
  )

let sum = (type a, t, module(M: TableclothContainer.Sum with type t = a)): a =>
  Array.reduce(t, M.zero, M.add)

//let map = (t, f) => Array.map(t, a => f(a))
//let map = Array.map

//let mapWithIndex = (t, f) => Array.mapWithIndex(t, f)
// let mapWithIndex = Array.mapWithIndex

let map2 = (a, b, f: ('a, 'b) => 'c): array<'c> => Belt.Array.zipBy(a, b, f)

let map3 = (as_, bs, cs: t<'c>, f) => {
  let minLength = Array.reduce([Array.length(bs), Array.length(cs)], Array.length(as_), min)

  Array.fromInitializer(~length=minLength, i =>
    f(as_[i]->Option.getExn, bs[i]->Option.getExn, cs[i]->Option.getExn)
  )
}

let zip = (a, b) => map2(a, b, (a, b) => (a, b))

//let flatMap = (t, f) => Array.flatMap(t, a => f(a))

let sliding = (~step=1, a, ~size) => {
  let n = Array.length(a)
  if size > n {
    []
  } else {
    initialize(1 + (n - size) / step, i => initialize(size, j => a[i * step + j]->Option.getExn))
  }
}

let find = (t, f) => {
  let rec find_loop = (t, ~f, ~length, i) =>
    if i >= length {
      None
    } else if f(t[i]->Option.getExn) {
      Some(t[i]->Option.getExn)
    } else {
      find_loop(t, ~f, ~length, i + 1)
    }

  find_loop(t, ~f, ~length=Array.length(t), 0)
}

let findIndex = (array, f) => {
  let rec loop = index =>
    if index >= Array.length(array) {
      None
    } else if f(index, array[index]->Option.getExn) {
      Some(index, array[index]->Option.getExn)
    } else {
      loop(index + 1)
    }

  loop(0)
}

//let any = (t, f) => Array.some(t, a => f(a))
let any = Array.some

//let all = (t, f) => Array.every(t, a => f(a))
let all = Array.every

//let includes = (t, v, ~equal) => any(t, a => equal(v, a))
let includes = (t, v, equal) => any(t, equal(v, _))

//let append = (a, a') => Array.concat(a, a')
let append = Array.concat

//let flatten = (ars: array<array<'a>>) => Array.flat(ars)
let flatten = Array.flat

let intersperse = (t, ~sep) =>
  Array.fromInitializer(~length=max(0, Array.length(t) * 2 - 1), i =>
    if mod(i, 2) != 0 {
      sep
    } else {
      t[i / 2]->Option.getExn
    }
  )

//let slice = (~to_=?, array, ~from) => {
//  let defaultTo = switch to_ {
//  | None => length(array)
//  | Some(i) => i
//  }
//  let sliceFrom = if from >= 0 {
//    min(length(array), from)
//  } else {
//    max(0, min(length(array), length(array) + from))
//  }
//
//  let sliceTo = if defaultTo >= 0 {
//    min(length(array), defaultTo)
//  } else {
//    max(0, min(length(array), length(array) + defaultTo))
//  }
//
//  if sliceFrom >= sliceTo {
//    []
//  } else {
//    Array.fromInitializer(~length=sliceTo - sliceFrom, i => array[i + sliceFrom])
//  }
//}

let count = (t, f) => fold(t, ~initial=0, ~f=(total, element) => total + (f(element) ? 1 : 0))

let chunksOf = (t, ~size) => sliding(t, ~step=size, ~size)

// let reverse = t => Array.reverse(t)

//let forEach = (t, f): unit => Array.forEach(t, a => f(a))

//let forEachWithIndex = (t, f): unit =>
//  for i in 0 to Array.length(t) - 1 {
//    f(i, t[i])
//  }

let partition = (t, f) => {
  let (left, right) = foldRight(t, ~initial=(list{}, list{}), ~f=((lefts, rights), element) =>
    if f(element) {
      (list{element, ...lefts}, rights)
    } else {
      (lefts, list{element, ...rights})
    }
  )

  (List.toArray(left), List.toArray(right))
}

let splitAt = (t, ~index) => (
  Array.slice(t, ~start=0, ~end=index),
  Array.slice(t, ~start=index, ~end=Array.length(t)),
)

let splitWhen = (t, f) =>
  switch findIndex(t, (_, e) => f(e)) {
  | None => (t, [])
  | Some(index, _) => splitAt(t, ~index)
  }

let unzip = t => (
  Array.fromInitializer(~length=Array.length(t), i => fst(t[i]->Option.getExn)),
  Array.fromInitializer(~length=Array.length(t), i => snd(t[i]->Option.getExn)),
)

let repeat = (element, ~length) => Array.fromInitializer(~length=max(length, 0), _ => element)

let filterMap = Array.filterMap

//let sort = (a, ~compare) => Array.sort((a, b) => compare(a, b), a)
//let sort = (a, ~compare) => Array.sort(a, (a, b) => compare(a, b))

//let values = t => {
//  let result = fold(t, ~initial=list{}, ~f=(results, element) =>
//    switch element {
//    | None => results
//    | Some(value) => list{value, ...results}
//    }
//  )->List.toArray
//
//  Array.reverse(result)
//  result
//}
let values = Array.keepSome

//let join = (t, ~sep) => Js.Array.joinWith(sep, t)

let groupBy = (t, comparator, ~f) =>
  fold(t, ~initial=TableclothMap.empty(comparator), ~f=(map, element) => {
    let key = f(element)
    TableclothMap.update(map, ~key, ~f=x =>
      switch x {
      | None => Some(list{element})
      | Some(elements) => Some(list{element, ...elements})
      }
    )
  })

//let equal = (a, b, equal) =>
//  if Array.length(a) != Array.length(b) {
//    false
//  } else if Array.length(a) == 0 {
//    true
//  } else {
//    let rec loop = index =>
//      if index == Array.length(a) {
//        true
//      } else {
//        equal(a[index], b[index]) && loop(index + 1)
//      }
//
//    loop(0)
//  }

let equal = Array.equal
