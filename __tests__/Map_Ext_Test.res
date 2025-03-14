open Jest
open Expect

module Tuple2 = Stdlib__Map_Ext.Key.Tuple2
module Tuple3 = Stdlib__Map_Ext.Key.Tuple3
module ArrayInt = Stdlib__Map_Ext.Key.Array.Int
module ArrayString = Stdlib__Map_Ext.Key.Array.String
module ArrayFloat = Stdlib__Map_Ext.Key.Array.Float

describe("ArrayInt", () => {
  let ai = ArrayInt.make()

  beforeEach(() => {
    ai->ArrayInt.clear
    ai->ArrayInt.set([1, 2, 3], "123")
    ai->ArrayInt.set([4, 5, 6], "456")
  })

  test("clear all values", () => {
    ai->ArrayInt.clear
    expect(ai->ArrayInt.size)->toBe(0)
  })

  test("forEach", () => {
    let values = []
    ai->ArrayInt.forEach(v => values->Array.push(v))
    expect(values)->toEqual(["123", "456"])
  })

  test("forEachWithKey", () => {
    let entries = []
    ai->ArrayInt.forEachWithKey((v, k) => entries->Array.push((k, v)))
    expect(entries)->toEqual([([1, 2, 3], "123"), ([4, 5, 6], "456")])
  })

  test("has key", () => {
    expect(ai->ArrayInt.has([1, 2, 3]))->toBe(true)
  })

  test("delete key", () => {
    expect(ai->ArrayInt.delete([1, 2, 3]))->toBe(true)
  })

  test("fromArray", () => {
    let arr = [([1, 2, 3], "123"), ([4, 5, 6], "456")]
    let ai = ArrayInt.fromArray(arr)
    expect(ai->ArrayInt.size)->toBe(2)
  })

  test("fromIterator", () => {
    let iter = [([1, 2, 3], "123"), ([4, 5, 6], "456")]->Stdlib__Array_Ext.valuesIter
    let ai = ArrayInt.fromIterator(iter)
    expect(ai->ArrayInt.size)->toBe(2)
  })

  test("keys", () => {
    let keys = ai->ArrayInt.keys->Iterator.toArray
    expect(keys)->toEqual([[1, 2, 3], [4, 5, 6]])
  })

  test("values", () => {
    let values = ai->ArrayInt.values->Iterator.toArray
    expect(values)->toEqual(["123", "456"])
  })

  test("entries", () => {
    let entries = ai->ArrayInt.entries->Iterator.toArray
    expect(entries)->toEqual([([1, 2, 3], "123"), ([4, 5, 6], "456")])
  })
})

describe("ArrayString", () => {
  let arr = ArrayString.make()

  beforeEach(() => {
    arr->ArrayString.clear
    arr->ArrayString.set(["a", "b", "c"], "abc")
    arr->ArrayString.set(["d", "e", "f"], "def")
  })

  test("clear all values", () => {
    arr->ArrayString.clear
    expect(arr->ArrayString.size)->toBe(0)
  })

  test("forEach", () => {
    let values = []
    arr->ArrayString.forEach(v => values->Array.push(v))
    expect(values)->toEqual(["abc", "def"])
  })

  test("forEachWithKey", () => {
    let entries = []
    arr->ArrayString.forEachWithKey((v, k) => entries->Array.push((k, v)))
    expect(entries)->toEqual([(["a", "b", "c"], "abc"), (["d", "e", "f"], "def")])
  })

  test("has key", () => {
    expect(arr->ArrayString.has(["a", "b", "c"]))->toBe(true)
  })

  test("delete key", () => {
    expect(arr->ArrayString.delete(["a", "b", "c"]))->toBe(true)
  })

  test("fromArray", () => {
    let a = [(["a", "b", "c"], "abc"), (["d", "e", "f"], "def")]
    let arr = ArrayString.fromArray(a)
    expect(arr->ArrayString.size)->toBe(2)
  })

  test("fromIterator", () => {
    let iter = [(["a", "b", "c"], "abc"), (["d", "e", "f"], "def")]->Stdlib__Array_Ext.valuesIter
    let arr = ArrayString.fromIterator(iter)
    expect(arr->ArrayString.size)->toBe(2)
  })

  test("keys", () => {
    let keys = arr->ArrayString.keys->Iterator.toArray
    expect(keys)->toEqual([["a", "b", "c"], ["d", "e", "f"]])
  })

  test("values", () => {
    let values = arr->ArrayString.values->Iterator.toArray
    expect(values)->toEqual(["abc", "def"])
  })

  test("entries", () => {
    let entries = arr->ArrayString.entries->Iterator.toArray
    expect(entries)->toEqual([(["a", "b", "c"], "abc"), (["d", "e", "f"], "def")])
  })
})

describe("ArrayFloat", () => {
  let af = ArrayFloat.make()

  beforeEach(() => {
    af->ArrayFloat.clear
    af->ArrayFloat.set([1.1, 2.2, 3.3], "123")
    af->ArrayFloat.set([4.4, 5.5, 6.6], "456")
  })

  test("clear all values", () => {
    af->ArrayFloat.clear
    expect(af->ArrayFloat.size)->toBe(0)
  })

  test("forEach", () => {
    let values = []
    af->ArrayFloat.forEach(v => values->Array.push(v))
    expect(values)->toEqual(["123", "456"])
  })

  test("forEachWithKey", () => {
    let entries = []
    af->ArrayFloat.forEachWithKey((v, k) => entries->Array.push((k, v)))
    expect(entries)->toEqual([([1.1, 2.2, 3.3], "123"), ([4.4, 5.5, 6.6], "456")])
  })

  test("has key", () => {
    expect(af->ArrayFloat.has([1.1, 2.2, 3.3]))->toBe(true)
  })

  test("delete key", () => {
    expect(af->ArrayFloat.delete([1.1, 2.2, 3.3]))->toBe(true)
  })

  test("fromArray", () => {
    let arr = [([1.1, 2.2, 3.3], "123"), ([4.4, 5.5, 6.6], "456")]
    let af = ArrayFloat.fromArray(arr)
    expect(af->ArrayFloat.size)->toBe(2)
  })

  test("fromIterator", () => {
    let iter = [([1.1, 2.2, 3.3], "123"), ([4.4, 5.5, 6.6], "456")]->Stdlib__Array_Ext.valuesIter
    let af = ArrayFloat.fromIterator(iter)
    expect(af->ArrayFloat.size)->toBe(2)
  })

  test("keys", () => {
    let keys = af->ArrayFloat.keys->Iterator.toArray
    expect(keys)->toEqual([[1.1, 2.2, 3.3], [4.4, 5.5, 6.6]])
  })

  test("values", () => {
    let values = af->ArrayFloat.values->Iterator.toArray
    expect(values)->toEqual(["123", "456"])
  })

  test("entries", () => {
    let entries = af->ArrayFloat.entries->Iterator.toArray
    expect(entries)->toEqual([([1.1, 2.2, 3.3], "123"), ([4.4, 5.5, 6.6], "456")])
  })
})

describe("Tuple2.FloatFloat", () => {
  let tff = Tuple2.FloatFloat.make()

  beforeEach(() => {
    tff->Tuple2.FloatFloat.clear
    tff->Tuple2.FloatFloat.set((1.1, 2.2), 12)
    tff->Tuple2.FloatFloat.set((3.3, 4.4), 34)
  })

  test("clear all values", () => {
    tff->Tuple2.FloatFloat.clear
    expect(tff->Tuple2.FloatFloat.size)->toBe(0)
  })

  test("forEach", () => {
    let values = []
    tff->Tuple2.FloatFloat.forEach(v => values->Array.push(v))
    expect(values)->toEqual([12, 34])
  })

  test("forEachWithKey", () => {
    let entries = []
    tff->Tuple2.FloatFloat.forEachWithKey((v, k) => entries->Array.push((k, v)))
    expect(entries)->toEqual([((1.1, 2.2), 12), ((3.3, 4.4), 34)])
  })

  test("has key", () => {
    expect(tff->Tuple2.FloatFloat.has((1.1, 2.2)))->toBe(true)
  })

  test("delete key", () => {
    expect(tff->Tuple2.FloatFloat.delete((1.1, 2.2)))->toBe(true)
  })

  test("fromArray", () => {
    let arr = [((1.1, 2.2), 12), ((3.3, 4.4), 34)]
    let tff = Tuple2.FloatFloat.fromArray(arr)
    expect(tff->Tuple2.FloatFloat.size)->toBe(2)
  })

  test("fromIterator", () => {
    let iter = [((1.1, 2.2), 12), ((3.3, 4.4), 34)]->Stdlib__Array_Ext.valuesIter
    let tff = Tuple2.FloatFloat.fromIterator(iter)
    expect(tff->Tuple2.FloatFloat.size)->toBe(2)
  })

  test("keys", () => {
    let keys = tff->Tuple2.FloatFloat.keys->Iterator.toArray
    expect(keys)->toEqual([(1.1, 2.2), (3.3, 4.4)])
  })

  test("values", () => {
    let values = tff->Tuple2.FloatFloat.values->Iterator.toArray
    expect(values)->toEqual([12, 34])
  })

  test("entries", () => {
    let entries = tff->Tuple2.FloatFloat.entries->Iterator.toArray
    expect(entries)->toEqual([((1.1, 2.2), 12), ((3.3, 4.4), 34)])
  })
})
