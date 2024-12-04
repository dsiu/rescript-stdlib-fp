// open OCamlCompat

type t<'a, 'b, 'c, 'd> = ('a, 'b, 'c, 'd)

let make = (a, b, c, d) => (a, b, c, d)

let fromArray = array => {
  open Array
  switch array {
  | [] | [_] | [_, _] | [_, _, _] => None
  | [a, b, c, d] => Some(a, b, c, d)
  | _ => Some(array->getUnsafe(0), array->getUnsafe(1), array->getUnsafe(2), array->getUnsafe(3))
  }
}

let fromList = list =>
  switch list {
  | list{} | list{_} | list{_, _} | list{_, _, _} => None
  | list{a, b, c, d, ..._rest} => Some(a, b, c, d)
  }

let first = ((a, _, _, _)) => a

let second = ((_, b, _, _)) => b

let third = ((_, _, c, _)) => c

let forth = ((_, _, _, d)) => d

let initial = ((a, b, _, _)) => (a, b)

let tail = ((_, _, c, d)) => (c, d)

let mapFirst = ((a, b, c, d), ~f) => (f(a), b, c, d)

let mapSecond = ((a, b, c, d), ~f) => (a, f(b), c, d)

let mapThird = ((a, b, c, d), ~f) => (a, b, f(c), d)

let mapForth = ((a, b, c, d), ~f) => (a, b, c, f(d))

let mapEach = ((a, b, c, d), ~f, ~g, ~h, ~i) => (f(a), g(b), h(c), i(d))

let mapAll = ((a1, a2, a3, a4), ~f) => (f(a1), f(a2), f(a3), f(a4))

let rotateLeft = ((a, b, c, d)) => (b, c, d, a)

let rotateRight = ((a, b, c, d)) => (d, a, b, c)

let toArray = ((a, b, c, d)) => [a, b, c, d]

let toList = ((a, b, c, d)) => list{a, b, c, d}

let equal = ((a, b, c, d), (a', b', c', d'), equalFirst, equalSecond, equalThird, equalForth) =>
  equalFirst(a, a') && (equalSecond(b, b') && equalThird(c, c') && equalForth(d, d'))

let compare = (
  (a, b, c, d),
  (a', b', c', d'),
  ~f as compareFirst,
  ~g as compareSecond,
  ~h as compareThird,
  ~i as compareForth,
) =>
  switch compareFirst(a, a') {
  | 0 =>
    switch compareSecond(b, b') {
    | 0 =>
      switch compareThird(c, c') {
      | 0 => compareForth(d, d')
      | result => result
      }
    | result => result
    }
  | result => result
  }
