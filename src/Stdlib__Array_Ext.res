let append = Array.concat

let headUnsafe = xs => xs->Array.getUnsafe(0)

let lastUnsafe = xs => xs->Array.getUnsafe(xs->Array.length - 1)

let tail = Array.sliceToEnd(_, ~start=1)

let init = xs => {
  let l = Array.length(xs)
  l == 0 ? None : Some(Array.slice(xs, ~start=0, ~end=l - 1))
}

let uncons = xs => {
  open Array
  switch xs {
  | [] => None
  | _ => Some((getUnsafe(xs, 0), sliceToEnd(xs, ~start=1)))
  }
}

let singleton = Array.make(_, ~length=1)

let makeBy = Belt.Array.makeBy

let take = (xs, n) => {
  open Array
  let l = length(xs)
  let len = n < 0 ? 0 : l < n ? l : n
  slice(xs, ~start=0, ~end=len)
}

let takeExactly = (xs, n) => {
  open Array
  n < 0 || n > length(xs) ? None : Some(slice(xs, ~start=0, ~end=n))
}

let takeWhile = (xs, predicateFn) => {
  open Array
  reduce(xs, [], (acc, element) => {
    if predicateFn(element) {
      push(acc, element)->ignore
    }
    acc
  })
}

let drop = (xs, n) => {
  open Array

  let l = length(xs)
  let start = n < 0 ? 0 : l < n ? l : n
  sliceToEnd(xs, ~start)
}

let dropExactly = (xs, n) => {
  open Array
  n < 0 || n > length(xs) ? None : Some(sliceToEnd(xs, ~start=n))
}
let dropWhile = (xs, predicateFn) => {
  open Array
  reduce(xs, [], (acc, element) => {
    if !predicateFn(element) {
      push(acc, element)->ignore
    }
    acc
  })
}

let rec tails = xs => {
  open Array
  xs->length == 0 ? [[]] : concat([xs], tails(tail(xs)))
}

// let some = (xs, fn) => Belt.Array.someU(xs, fn)

// let keepSome = xs => keepMap(xs, x => x)
//module String = {
//  let joinWith = Garter.Array.String.joinWith
//}

//let intersperse = Garter.Array.intersperse

let uniqBy = (xs, uniqFn) => {
  open Array
  let index = ref(0)
  let arr = []

  while index.contents < length(xs) {
    let value = getUnsafe(xs, index.contents)
    let alreadyAdded = some(arr, x => uniqFn(TableclothFun.identity(x)) == uniqFn(value))

    if !alreadyAdded {
      push(arr, value)->ignore
    }

    index := succ(index.contents)
  }

  arr
}

let uniq = xs => uniqBy(xs, TableclothFun.identity)

// use Tablecloth.Array.splitAt
//let splitAt = (xs, offset) =>
//  offset < 0 || offset > length(xs)
//    ? None
//    : Some((slice(xs, ~start=0, ~end=offset), sliceToEnd(xs, ~start=offset)))

//
// scanl [dsiu]
//
// https://kapeli.com/dash_share?docset_file=Haskell&docset_name=Haskell&path=libraries/base-4.17.0.0/Data-List.html%23v:scanl&platform=haskell&repo=Main&version=9.4.3
//
// [1, 2, 3, 4]->Array.scanl(0, \"+") -> [ 0, 1, 3, 6, 10 ]
//
//  []->Array.scanl(42, \"+") -> [ 42 ]/
//
//  [1, 2, 3, 4]->Array.scanl(100, \"-") -> [ 100, 99, 97, 94, 90 ]
//
//  ["a", "b", "c", "d"]->Array.scanl("foo", (rString, nextChar) => nextChar ++ rString)
//  -> [ 'foo', 'afoo', 'bafoo', 'cbafoo', 'dcbafoo' ]
//
let rec scanl: (array<'b>, 'a, ('a, 'b) => 'a) => array<'a> = (xs, initial, fn) => {
  open Array
  concat(
    [initial],
    {
      xs->length == 0
        ? []
        : {
            let h = xs->headUnsafe
            let tails = xs->tail
            tails->scanl(fn(initial, h), fn)
          }
    },
  )
}

// Array transformations

/* use Array.flatMap instead
let flatMap: (array<'a>, 'a => array<'b>) => array<'b> = (xs, f) => {
  reduce(map(xs, f), [], concat)
}
*/

/**
  flatMap (ie: bind) on Array
 */
let arrayToOption = Array.get(_, 0)

/**
  http://zvon.org/other/haskell/Outputprelude/foldl1_f.html
  todo: needs tests
*/
let foldl1: (array<'a>, ('a, 'a) => 'a) => 'a = (xs, f) => {
  open Array
  let init = xs->getUnsafe(0)
  let rest = xs->tail
  rest->reduce(init, f)
}
/**
  http://zvon.org/other/haskell/Outputprelude/foldr1_f.html
  todo: needs tests
*/
let foldr1: (array<'a>, ('a, 'a) => 'a) => 'a = (xs, f) => {
  open Array
  let end = xs->length - 1
  let init = xs->getUnsafe(end)
  let rest = xs->slice(~start=0, ~end)
  rest->reduceRight(init, f)
}

/**
  https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-List.html#v:unfoldr
  todo: needs tests
 */
let unfoldr: ('b, 'b => option<('a, 'b)>) => array<'a> = (initial, f) => {
  let rec loop = (acc, seed) => {
    switch f(seed) {
    | None => acc
    | Some((x, y)) => loop([...acc, x], y)
    }
  }

  loop([], initial)
}

let return = x => [x]

//
// ref: https://hackage.haskell.org/package/base-4.19.0.0/docs/src/Data.OldList.html#local-6989586621679700075
// todo: needs tests
//
let rec transpose = a => {
  switch a {
  | [] => []
  | _ => {
      module A = Array
      module TA = TableclothArray
      let h = headUnsafe(a)
      let xss = tail(a)
      TA.isEmpty(h)
        ? transpose(xss)
        : {
            let x = headUnsafe(h)
            let xs = tail(h)

            let (hds, tls) = TA.unzip(
              A.map(xss, y => {
                (headUnsafe(y), tail(y))
              }),
            )
            [[x, ...hds], ...transpose([xs, ...tls])]
          }
    }
  }
}

let zipWith = TableclothArray.map2

//
// https://gist.github.com/NicolasT/3789670
//
// Operator lifting
// Not adding type info here since these should be generic
//liftM2 :: (a -> b -> c) -> m a -> m b -> m c
let liftM2 = (f, m1, m2) => {
  open Array
  m1->flatMap(x1 => m2->flatMap(x2 => return(f(x1, x2))))
}

//  These become :: (int, int) cont -> (int, int) cont -> (int, int) cont
//let (-!) = liftM2 (-)
//let (+!) = liftM2 (+)
//let ( *! ) = liftM2 ( * )

// TODO: the following combinationIfs can be expressed in LiftM2

/**
  apply f(x,y) for each x in a and each y in b ONLY if f(x,y) returns Some()
  returns result in array
*/
let combinationIf2: (array<'a>, array<'b>, ('a, 'b) => option<'r>) => array<'r> = (a, b, f) => {
  open Array
  let ret = ref([])
  a->forEach(x => {
    b->forEach(y => {
      switch f(x, y) {
      | Some(r) => ret := ret.contents->concat([r])
      | None => ()
      }
    })
  })

  ret.contents
}

/**
  apply f(x,y) for each x in a and and each y in b
  returns result in array
*/
let combination2: (array<'a>, array<'b>, ('a, 'b) => 'r) => array<'r> = (a, b, f) => {
  combinationIf2(a, b, (x, y) => Some(f(x, y)))
}

/**
  apply f(x,y,z) for each x in a, each y in b, and each z in c ONLY if f(x,y,z) returns Some()
  returns result in array
*/
let combinationIf3: (array<'a>, array<'b>, array<'c>, ('a, 'b, 'c) => option<'r>) => array<'r> = (
  a,
  b,
  c,
  f,
) => {
  open Array
  let ret = ref([])
  a->forEach(x => {
    b->forEach(y => {
      c->forEach(
        z => {
          switch f(x, y, z) {
          | Some(r) => ret := ret.contents->concat([r])
          | None => ()
          }
        },
      )
    })
  })

  ret.contents
}

/**
  apply f(x,y,z) for each x in a, y in b, z in c
  returns result in array
*/
let combinationArray3: (array<'a>, array<'b>, array<'c>, ('a, 'b, 'c) => 'r) => array<'r> = (
  a,
  b,
  c,
  f,
) => {
  combinationIf3(a, b, c, (x, y, z) => Some(f(x, y, z)))
}

/**
  apply f(x,y,z,w) for each x in a, each y in b, each z in c, and each w in d, ONLY if f(x,y,z,w) returns Some()
  returns result in array
*/
let combinationIf4: (
  array<'a>,
  array<'b>,
  array<'c>,
  array<'d>,
  ('a, 'b, 'c, 'd) => option<'e>,
) => array<'e> = (a, b, c, d, f) => {
  open Array
  let ret = ref([])
  a->forEach(x => {
    b->forEach(y => {
      c->forEach(
        z => {
          d->forEach(
            w => {
              switch f(x, y, z, w) {
              | Some(r) => ret := ret.contents->concat([r])
              | None => ()
              }
            },
          )
        },
      )
    })
  })

  ret.contents
}

/**
  apply f(x,y,z) for each x in a, y in b, z in c, w in d
  returns result in array
*/
let combination4: (
  array<'a>,
  array<'b>,
  array<'c>,
  array<'d>,
  ('a, 'b, 'c, 'd) => 'r,
) => array<'r> = (a, b, c, d, f) => {
  combinationIf4(a, b, c, d, (x, y, z, w) => Some(f(x, y, z, w)))
}
