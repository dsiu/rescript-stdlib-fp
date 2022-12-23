open Zora

open Stdlib.Array

let testEqual = (t, name, lhs, rhs) =>
  t->test(name, t => {
    t->equal(lhs, rhs, name)

    done()
  })

zoraBlock("take", t => {
  t->testEqual("1", take([1, 2, 3, 4, 5], -1), [])
  t->testEqual("2", take([1, 2, 3, 4, 5], 2), [1, 2])
  t->testEqual("3", take([1, 2, 3, 4, 5], 7), [1, 2, 3, 4, 5])
})
