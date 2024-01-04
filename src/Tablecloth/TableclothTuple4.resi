type t<'a, 'b, 'c, 'd> = ('a, 'b, 'c, 'd)
let make: ('a, 'b, 'c, 'd) => ('a, 'b, 'c, 'd)
let fromArray: array<'a> => option<('a, 'a, 'a, 'a)>
let fromList: list<'a> => option<('a, 'a, 'a, 'a)>
let first: (('a, 'b, 'c, 'd)) => 'a
let second: (('a, 'b, 'c, 'd)) => 'b
let third: (('a, 'b, 'c, 'd)) => 'c
let forth: (('a, 'b, 'c, 'd)) => 'd
let initial: (('a, 'b, 'c, 'd)) => ('a, 'b)
let tail: (('a, 'b, 'c, 'd)) => ('c, 'd)
let mapFirst: (('a, 'b, 'c, 'd), ~f: 'a => 'e) => ('e, 'b, 'c, 'd)
let mapSecond: (('a, 'b, 'c, 'd), ~f: 'b => 'e) => ('a, 'e, 'c, 'd)
let mapThird: (('a, 'b, 'c, 'd), ~f: 'c => 'e) => ('a, 'b, 'e, 'd)
let mapForth: (('a, 'b, 'c, 'd), ~f: 'd => 'e) => ('a, 'b, 'c, 'e)
let mapEach: (('a, 'b, 'c, 'd), ~f: 'a => 'e, ~g: 'b => 'f, ~h: 'c => 'g, ~i: 'd => 'h) => (
  'e,
  'f,
  'g,
  'h,
)
let mapAll: (('a, 'a, 'a, 'a), ~f: 'a => 'b) => ('b, 'b, 'b, 'b)
let rotateLeft: (('a, 'b, 'c, 'd)) => ('b, 'c, 'd, 'a)
let rotateRight: (('a, 'b, 'c, 'd)) => ('d, 'a, 'b, 'c)
let toArray: (('a, 'a, 'a, 'a)) => array<'a>
let toList: (('a, 'a, 'a, 'a)) => list<'a>
let equal: (
  ('a, 'b, 'c, 'd),
  ('e, 'f, 'g, 'h),
  ('a, 'e) => bool,
  ('b, 'f) => bool,
  ('c, 'g) => bool,
  ('d, 'h) => bool,
) => bool
let compare: (
  ('a, 'b, 'c, 'd),
  ('e, 'f, 'g, 'h),
  ~f: ('a, 'e) => int,
  ~g: ('b, 'f) => int,
  ~h: ('c, 'g) => int,
  ~i: ('d, 'h) => int,
) => int
