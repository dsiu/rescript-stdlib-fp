open Zora

open Stdlib.Array
open Stdlib.Function

let testEqual = (t, name, lhs, rhs) =>
  t->test(name, t => {
    t->Zora.equal(lhs, rhs, name)

    done()
  })

zoraBlock("take", t => {
  t->testEqual("1", take([1, 2, 3, 4, 5], -1), [])
  t->testEqual("2", take([1, 2, 3, 4, 5], 2), [1, 2])
  t->testEqual("3", take([1, 2, 3, 4, 5], 7), [1, 2, 3, 4, 5])
})

zoraBlock("drop", t => {
  t->testEqual("1", drop([1, 2, 3, 4, 5], -1), [1, 2, 3, 4, 5])
  t->testEqual("2", drop([1, 2, 3, 4, 5], 2), [3, 4, 5])
  t->testEqual("3", drop([1, 2, 3, 4, 5], 7), [])
})

zoraBlock("takeWhile", t => {
  t->testEqual("1", takeWhile([1, 2, 3, 4, 5], x => x <= 2), [1, 2])
  t->testEqual("2", takeWhile([1, 2, 3, 4, 5], const(false, ...)), [])
})

zoraBlock("dropWhile", t => {
  t->testEqual("1", dropWhile([1, 2, 3, 4, 5], x => x <= 2), [3, 4, 5])
  t->testEqual("2", dropWhile([1, 2, 3, 4, 5], const(true, ...)), [])
})
