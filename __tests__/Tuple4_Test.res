open Stdlib
open Jest
open Expect

open Tuple4
test("make", () => expect(make(3, 4, 5, 6))->toEqual((3, 4, 5, 6)))
test("first", () => expect(first((3, 4, 5, 6)))->toEqual(3))
test("second", () => expect(second((3, 4, 5, 6)))->toEqual(4))
test("third", () => expect(third((3, 4, 5, 6)))->toEqual(5))
test("forth", () => expect(forth((3, 4, 5, 6)))->toEqual(6))
test("initial", () => expect(initial((3, 4, 5, 6)))->toEqual((3, 4)))
test("tail", () => expect(tail((3, 4, 5, 6)))->toEqual((5, 6)))
test("mapFirst", () =>
  expect(mapFirst(~f=String.reverse, ("stressed", 16, false, 64.)))->toEqual((
    "desserts",
    16,
    false,
    64.,
  ))
)
test("mapSecond", () =>
  expect(mapSecond(~f=Float.squareRoot, ("stressed", 16., false, 64.)))->toEqual((
    "stressed",
    4.,
    false,
    64.,
  ))
)
test("mapThird", () =>
  expect(mapThird(~f=not, ("stressed", 16, false, 64.)))->toEqual(("stressed", 16, true, 64.))
)
test("mapEach", () =>
  expect(
    mapEach(
      ~f=String.reverse,
      ~g=Float.squareRoot,
      ~h=not,
      ~i=Float.squareRoot,
      ("stressed", 16., false, 64.),
    ),
  )->toEqual(("desserts", 4., true, 8.))
)
test("mapAll", () =>
  expect(mapAll(~f=String.reverse, ("was", "stressed", "now", "but")))->toEqual((
    "saw",
    "desserts",
    "won",
    "tub",
  ))
)
test("rotateLeft", () => expect(rotateLeft((3, 4, 5, 6)))->toEqual((4, 5, 6, 3)))
test("rotateRight", () => expect(rotateRight((3, 4, 5, 6)))->toEqual((6, 3, 4, 5)))
test("toArray", () => expect(toArray((3, 4, 5, 6)))->toEqual([3, 4, 5, 6]))
test("toList", () => expect(toList((3, 4, 5, 6)))->toEqual(list{3, 4, 5, 6}))
