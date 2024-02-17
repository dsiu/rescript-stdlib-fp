type t<'a> = array<'a>

let singleton = a => [a]

let clone = t => RescriptCore.Array.map(t, TableclothFun.identity)

let isEmpty = a => RescriptCore.Array.length(a) == 0

let initialize = (length, f) => RescriptCore.Array.fromInitializer(~length, f)

let range = (~from=0, to_) => RescriptCore.Array.fromInitializer(~length=to_ - from, i => i + from)

//let fromList = t => RescriptCore.List.toArray(t)

//let toList: array<'a> => list<'a> = t => RescriptCore.List.fromArray(t)

let toIndexedList = (array: array<'a>): list<(int, 'a)> =>
  snd(
    RescriptCore.Array.reduceRight(array, (RescriptCore.Array.length(array) - 1, list{}), (
      (i, acc),
      x,
    ) => (i - 1, list{(i, x), ...acc})),
  )

// dont't define get here. use RescriptCore.Array.get instead for zero cost binding
//let get = (t, k) => Belt.Array.getExn(t, k)

// todo:
// RescriptCore.Array.getUnsafe returns undefined instead of throwing
// use Belt.Array.getExn instead until it is fixed
// https://github.com/rescript-association/rescript-core/issues/172
let getUnsafe = RescriptCore.Array.getUnsafe

//let getAt = (t, ~index) => RescriptCore.Array.get(t, index)
// let get = RescriptCore.Array.get
// @get_index external get: (array<'a>, int) => option<'a> = ""

let first = RescriptCore.Array.get(_, 0)

// dont't define get here. use RescriptCore.Array.get instead for zero cost binding
//let set = (t, index, value) => t[index] = value

// todo:
// RescriptCore.Array.setUnsafe returns undefined instead of throwing
// use Belt.Array.setExn instead until it is fixed
// https://github.com/rescript-association/rescript-core/issues/172
let setUnsafe = RescriptCore.Array.setUnsafe

//let setAt = (t, ~index, ~value) => t[index] = value
// let set = RescriptCore.Array.set
// @set_index external set: (array<'a>, int, 'a) => unit = ""

// let filter = (t, f) => RescriptCore.Array.filter(t, a => f(a))

let swap = (t, i, j) => {
  let temp = t[i]
  t[i] = t[j]
  t[j] = temp
  ()
}

let fold = (t, ~initial, ~f) => RescriptCore.Array.reduce(t, initial, (a, b) => f(a, b))

let foldRight = (t, ~initial, ~f) => RescriptCore.Array.reduceRight(t, initial, (a, b) => f(a, b))

let maximum = (t, ~compare) =>
  fold(t, ~initial=None, ~f=(max, element) =>
    switch max {
    | None => Some(element)
    | Some(current) =>
      compare(element, current)->RescriptCore.Ordering.isGreater ? Some(element) : max
    }
  )

let minimum = (t, ~compare) =>
  fold(t, ~initial=None, ~f=(min, element) =>
    switch min {
    | None => Some(element)
    | Some(current) => compare(element, current)->RescriptCore.Ordering.isLess ? Some(element) : min
    }
  )

let extent = (t, ~compare) =>
  fold(t, ~initial=None, ~f=(range, element) =>
    switch range {
    | None => Some(element, element)
    | Some(min, max) =>
      Some(
        compare(element, min)->RescriptCore.Ordering.isLess ? element : min,
        compare(element, max)->RescriptCore.Ordering.isGreater ? element : max,
      )
    }
  )

let sum = (type a, t, module(M: TableclothContainer.Sum with type t = a)): a =>
  Array.fold_left(M.add, M.zero, t)

//let map = (t, f) => RescriptCore.Array.map(t, a => f(a))
//let map = RescriptCore.Array.map

//let mapWithIndex = (t, f) => RescriptCore.Array.mapWithIndex(t, f)
// let mapWithIndex = RescriptCore.Array.mapWithIndex

let map2 = (a, b, f: ('a, 'b) => 'c): array<'c> => Belt.Array.zipBy(a, b, f)

let map3 = (as_, bs, cs: t<'c>, f) => {
  let minLength = RescriptCore.Array.reduce(
    [RescriptCore.Array.length(bs), RescriptCore.Array.length(cs)],
    RescriptCore.Array.length(as_),
    min,
  )

  RescriptCore.Array.fromInitializer(~length=minLength, i => f(as_[i], bs[i], cs[i]))
}

let zip = (a, b) => map2(a, b, (a, b) => (a, b))

//let flatMap = (t, f) => RescriptCore.Array.flatMap(t, a => f(a))

let sliding = (~step=1, a, ~size) => {
  let n = RescriptCore.Array.length(a)
  if size > n {
    []
  } else {
    initialize(1 + (n - size) / step, i => initialize(size, j => a[i * step + j]))
  }
}

let find = (t, f) => {
  let rec find_loop = (t, ~f, ~length, i) =>
    if i >= length {
      None
    } else if f(t[i]) {
      Some(t[i])
    } else {
      find_loop(t, ~f, ~length, i + 1)
    }

  find_loop(t, ~f, ~length=RescriptCore.Array.length(t), 0)
}

let findIndex = (array, f) => {
  let rec loop = index =>
    if index >= RescriptCore.Array.length(array) {
      None
    } else if f(index, array[index]) {
      Some(index, array[index])
    } else {
      loop(index + 1)
    }

  loop(0)
}

//let any = (t, f) => RescriptCore.Array.some(t, a => f(a))
let any = RescriptCore.Array.some

//let all = (t, f) => RescriptCore.Array.every(t, a => f(a))
let all = RescriptCore.Array.every

//let includes = (t, v, ~equal) => any(t, a => equal(v, a))
let includes = (t, v, equal) => any(t, equal(v, _))

//let append = (a, a') => RescriptCore.Array.concat(a, a')
let append = RescriptCore.Array.concat

//let flatten = (ars: array<array<'a>>) => RescriptCore.Array.flat(ars)
let flatten = RescriptCore.Array.flat

let intersperse = (t, ~sep) =>
  RescriptCore.Array.fromInitializer(~length=max(0, RescriptCore.Array.length(t) * 2 - 1), i =>
    if mod(i, 2) != 0 {
      sep
    } else {
      t[i / 2]
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
//    RescriptCore.Array.fromInitializer(~length=sliceTo - sliceFrom, i => array[i + sliceFrom])
//  }
//}

let count = (t, f) => fold(t, ~initial=0, ~f=(total, element) => total + (f(element) ? 1 : 0))

let chunksOf = (t, ~size) => sliding(t, ~step=size, ~size)

// let reverse = t => RescriptCore.Array.reverse(t)

//let forEach = (t, f): unit => RescriptCore.Array.forEach(t, a => f(a))

//let forEachWithIndex = (t, f): unit =>
//  for i in 0 to RescriptCore.Array.length(t) - 1 {
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

  (RescriptCore.List.toArray(left), RescriptCore.List.toArray(right))
}

let splitAt = (t, ~index) => (
  RescriptCore.Array.slice(t, ~start=0, ~end=index),
  RescriptCore.Array.slice(t, ~start=index, ~end=RescriptCore.Array.length(t)),
)

let splitWhen = (t, f) =>
  switch findIndex(t, (_, e) => f(e)) {
  | None => (t, [])
  | Some(index, _) => splitAt(t, ~index)
  }

let unzip = t => (
  RescriptCore.Array.fromInitializer(~length=RescriptCore.Array.length(t), i => fst(t[i])),
  RescriptCore.Array.fromInitializer(~length=RescriptCore.Array.length(t), i => snd(t[i])),
)

let repeat = (element, ~length) =>
  RescriptCore.Array.fromInitializer(~length=max(length, 0), _ => element)

let filterMap = (t, f) => {
  let result = fold(t, ~initial=list{}, ~f=(results, element) =>
    switch f(element) {
    | None => results
    | Some(value) => list{value, ...results}
    }
  )->RescriptCore.List.toArray

  RescriptCore.Array.reverse(result)
  result
}

//let sort = (a, ~compare) => Array.sort((a, b) => compare(a, b), a)
//let sort = (a, ~compare) => RescriptCore.Array.sort(a, (a, b) => compare(a, b))

let values = t => {
  let result = fold(t, ~initial=list{}, ~f=(results, element) =>
    switch element {
    | None => results
    | Some(value) => list{value, ...results}
    }
  )->RescriptCore.List.toArray

  RescriptCore.Array.reverse(result)
  result
}

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

let equal = (a, b, equal) =>
  if RescriptCore.Array.length(a) != RescriptCore.Array.length(b) {
    false
  } else if RescriptCore.Array.length(a) == 0 {
    true
  } else {
    let rec loop = index =>
      if index == RescriptCore.Array.length(a) {
        true
      } else {
        equal(a[index], b[index]) && loop(index + 1)
      }

    loop(0)
  }
