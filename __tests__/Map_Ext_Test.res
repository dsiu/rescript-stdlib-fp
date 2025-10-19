open Jest
open Expect

module PrimInt = Stdlib__Map_Ext.Key.Int
module PrimString = Stdlib__Map_Ext.Key.String
module PrimFloat = Stdlib__Map_Ext.Key.Float
module PrimBigInt = Stdlib__Map_Ext.Key.BigInt
module PrimSymbol = Stdlib__Map_Ext.Key.Symbol

module ArrayInt = Stdlib__Map_Ext.Key.Array.Int
module ArrayString = Stdlib__Map_Ext.Key.Array.String
module ArrayFloat = Stdlib__Map_Ext.Key.Array.Float

module Tuple2 = Stdlib__Map_Ext.Key.Tuple2
module Tuple3 = Stdlib__Map_Ext.Key.Tuple3


describe("PrimInt", () => {
  let m = PrimInt.make()

  beforeEach(() => {
    m->PrimInt.clear
    m->PrimInt.set(1, "one")
    m->PrimInt.set(2, "two")
  })

  test("make creates empty map", () => {
    let newMap = PrimInt.make()
    expect(newMap->PrimInt.size)->toBe(0)
  })

  test("size returns correct count", () => {
    expect(m->PrimInt.size)->toBe(2)
  })

  test("isEmpty returns false for non-empty map", () => {
    expect(m->PrimInt.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty map", () => {
    let emptyMap = PrimInt.make()
    expect(emptyMap->PrimInt.isEmpty)->toBe(true)
  })

  test("get returns Some for existing key", () => {
    expect(m->PrimInt.get(1))->toEqual(Some("one"))
  })

  test("get returns None for missing key", () => {
    expect(m->PrimInt.get(99))->toEqual(None)
  })

  test("has returns true for existing key", () => {
    expect(m->PrimInt.has(2))->toBe(true)
  })

  test("has returns false for missing key", () => {
    expect(m->PrimInt.has(99))->toBe(false)
  })

  test("set adds new entry", () => {
    m->PrimInt.set(3, "three")
    expect(m->PrimInt.get(3))->toEqual(Some("three"))
  })

  test("set overwrites existing entry", () => {
    m->PrimInt.set(1, "ONE")
    expect(m->PrimInt.get(1))->toEqual(Some("ONE"))
  })

  test("delete removes existing key", () => {
    let deleted = m->PrimInt.delete(1)
    expect((deleted, m->PrimInt.has(1)))->toEqual((true, false))
  })

  test("delete returns false for missing key", () => {
    expect(m->PrimInt.delete(99))->toBe(false)
  })

  test("clear removes all entries", () => {
    m->PrimInt.clear
    expect(m->PrimInt.size)->toBe(0)
  })

  test("fromArray creates map from array", () => {
    let arr = [(5, "five"), (6, "six")]
    let newMap = PrimInt.fromArray(arr)
    expect(newMap->PrimInt.size)->toBe(2)
  })

  test("fromIterator creates map from iterator", () => {
    let iter = [(10, "ten"), (20, "twenty")]->Stdlib__Array_Ext.valuesIter
    let newMap = PrimInt.fromIterator(iter)
    expect(newMap->PrimInt.size)->toBe(2)
  })

  test("keys returns iterator of keys", () => {
    let keys = m->PrimInt.keys->Iterator.toArray
    expect(keys->Array.length)->toBe(2)
  })

  test("values returns iterator of values", () => {
    let values = m->PrimInt.values->Iterator.toArray
    expect(values->Array.length)->toBe(2)
  })

  test("entries returns iterator of entries", () => {
    let entries = m->PrimInt.entries->Iterator.toArray
    expect(entries->Array.length)->toBe(2)
  })

  test("forEach iterates over values", () => {
    let values = []
    m->PrimInt.forEach(v => values->Array.push(v))
    expect(values->Array.length)->toBe(2)
  })

  test("forEachWithKey iterates over entries", () => {
    let entries = []
    m->PrimInt.forEachWithKey((v, k) => entries->Array.push((k, v)))
    expect(entries->Array.length)->toBe(2)
  })
})

describe("PrimString", () => {
  let m = PrimString.make()

  beforeEach(() => {
    m->PrimString.clear
    m->PrimString.set("a", 1)
    m->PrimString.set("b", 2)
  })

  test("make creates empty map", () => {
    let newMap = PrimString.make()
    expect(newMap->PrimString.size)->toBe(0)
  })

  test("size returns correct count", () => {
    expect(m->PrimString.size)->toBe(2)
  })

  test("isEmpty returns false for non-empty map", () => {
    expect(m->PrimString.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty map", () => {
    let emptyMap = PrimString.make()
    expect(emptyMap->PrimString.isEmpty)->toBe(true)
  })

  test("get returns Some for existing key", () => {
    expect(m->PrimString.get("a"))->toEqual(Some(1))
  })

  test("get returns None for missing key", () => {
    expect(m->PrimString.get("z"))->toEqual(None)
  })

  test("has returns true for existing key", () => {
    expect(m->PrimString.has("b"))->toBe(true)
  })

  test("has returns false for missing key", () => {
    expect(m->PrimString.has("z"))->toBe(false)
  })

  test("set adds new entry", () => {
    m->PrimString.set("c", 3)
    expect(m->PrimString.get("c"))->toEqual(Some(3))
  })

  test("set overwrites existing entry", () => {
    m->PrimString.set("a", 100)
    expect(m->PrimString.get("a"))->toEqual(Some(100))
  })

  test("delete removes existing key", () => {
    let deleted = m->PrimString.delete("a")
    expect((deleted, m->PrimString.has("a")))->toEqual((true, false))
  })

  test("delete returns false for missing key", () => {
    expect(m->PrimString.delete("z"))->toBe(false)
  })

  test("clear removes all entries", () => {
    m->PrimString.clear
    expect(m->PrimString.size)->toBe(0)
  })

  test("fromArray creates map from array", () => {
    let arr = [("x", 10), ("y", 20)]
    let newMap = PrimString.fromArray(arr)
    expect(newMap->PrimString.size)->toBe(2)
  })

  test("fromIterator creates map from iterator", () => {
    let iter = [("p", 100), ("q", 200)]->Stdlib__Array_Ext.valuesIter
    let newMap = PrimString.fromIterator(iter)
    expect(newMap->PrimString.size)->toBe(2)
  })

  test("keys returns iterator of keys", () => {
    let keys = m->PrimString.keys->Iterator.toArray
    expect(keys->Array.length)->toBe(2)
  })

  test("values returns iterator of values", () => {
    let values = m->PrimString.values->Iterator.toArray
    expect(values->Array.length)->toBe(2)
  })

  test("entries returns iterator of entries", () => {
    let entries = m->PrimString.entries->Iterator.toArray
    expect(entries->Array.length)->toBe(2)
  })

  test("forEach iterates over values", () => {
    let values = []
    m->PrimString.forEach(v => values->Array.push(v))
    expect(values->Array.length)->toBe(2)
  })

  test("forEachWithKey iterates over entries", () => {
    let entries = []
    m->PrimString.forEachWithKey((v, k) => entries->Array.push((k, v)))
    expect(entries->Array.length)->toBe(2)
  })
})

describe("PrimFloat", () => {
  let m = PrimFloat.make()

  beforeEach(() => {
    m->PrimFloat.clear
    m->PrimFloat.set(1.1, "a")
    m->PrimFloat.set(2.2, "b")
  })

  test("make creates empty map", () => {
    let newMap = PrimFloat.make()
    expect(newMap->PrimFloat.size)->toBe(0)
  })

  test("size returns correct count", () => {
    expect(m->PrimFloat.size)->toBe(2)
  })

  test("isEmpty returns false for non-empty map", () => {
    expect(m->PrimFloat.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty map", () => {
    let emptyMap = PrimFloat.make()
    expect(emptyMap->PrimFloat.isEmpty)->toBe(true)
  })

  test("get returns Some for existing key", () => {
    expect(m->PrimFloat.get(1.1))->toEqual(Some("a"))
  })

  test("get returns None for missing key", () => {
    expect(m->PrimFloat.get(9.9))->toEqual(None)
  })

  test("has returns true for existing key", () => {
    expect(m->PrimFloat.has(2.2))->toBe(true)
  })

  test("has returns false for missing key", () => {
    expect(m->PrimFloat.has(9.9))->toBe(false)
  })

  test("set adds new entry", () => {
    m->PrimFloat.set(3.3, "c")
    expect(m->PrimFloat.get(3.3))->toEqual(Some("c"))
  })

  test("set overwrites existing entry", () => {
    m->PrimFloat.set(1.1, "A")
    expect(m->PrimFloat.get(1.1))->toEqual(Some("A"))
  })

  test("delete removes existing key", () => {
    let deleted = m->PrimFloat.delete(1.1)
    expect((deleted, m->PrimFloat.has(1.1)))->toEqual((true, false))
  })

  test("delete returns false for missing key", () => {
    expect(m->PrimFloat.delete(9.9))->toBe(false)
  })

  test("clear removes all entries", () => {
    m->PrimFloat.clear
    expect(m->PrimFloat.size)->toBe(0)
  })

  test("fromArray creates map from array", () => {
    let arr = [(5.5, "x"), (6.6, "y")]
    let newMap = PrimFloat.fromArray(arr)
    expect(newMap->PrimFloat.size)->toBe(2)
  })

  test("fromIterator creates map from iterator", () => {
    let iter = [(10.1, "p"), (20.2, "q")]->Stdlib__Array_Ext.valuesIter
    let newMap = PrimFloat.fromIterator(iter)
    expect(newMap->PrimFloat.size)->toBe(2)
  })

  test("keys returns iterator of keys", () => {
    let keys = m->PrimFloat.keys->Iterator.toArray
    expect(keys->Array.length)->toBe(2)
  })

  test("values returns iterator of values", () => {
    let values = m->PrimFloat.values->Iterator.toArray
    expect(values->Array.length)->toBe(2)
  })

  test("entries returns iterator of entries", () => {
    let entries = m->PrimFloat.entries->Iterator.toArray
    expect(entries->Array.length)->toBe(2)
  })

  test("forEach iterates over values", () => {
    let values = []
    m->PrimFloat.forEach(v => values->Array.push(v))
    expect(values->Array.length)->toBe(2)
  })

  test("forEachWithKey iterates over entries", () => {
    let entries = []
    m->PrimFloat.forEachWithKey((v, k) => entries->Array.push((k, v)))
    expect(entries->Array.length)->toBe(2)
  })
})

describe("PrimBigInt", () => {
  let m = PrimBigInt.make()

  beforeEach(() => {
    m->PrimBigInt.clear
    m->PrimBigInt.set(1n, "one")
    m->PrimBigInt.set(2n, "two")
  })

  test("make creates empty map", () => {
    let newMap = PrimBigInt.make()
    expect(newMap->PrimBigInt.size)->toBe(0)
  })

  test("size returns correct count", () => {
    expect(m->PrimBigInt.size)->toBe(2)
  })

  test("isEmpty returns false for non-empty map", () => {
    expect(m->PrimBigInt.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty map", () => {
    let emptyMap = PrimBigInt.make()
    expect(emptyMap->PrimBigInt.isEmpty)->toBe(true)
  })

  test("get returns Some for existing key", () => {
    expect(m->PrimBigInt.get(1n))->toEqual(Some("one"))
  })

  test("get returns None for missing key", () => {
    expect(m->PrimBigInt.get(99n))->toEqual(None)
  })

  test("has returns true for existing key", () => {
    expect(m->PrimBigInt.has(2n))->toBe(true)
  })

  test("has returns false for missing key", () => {
    expect(m->PrimBigInt.has(99n))->toBe(false)
  })

  test("set adds new entry", () => {
    m->PrimBigInt.set(3n, "three")
    expect(m->PrimBigInt.get(3n))->toEqual(Some("three"))
  })

  test("set overwrites existing entry", () => {
    m->PrimBigInt.set(1n, "ONE")
    expect(m->PrimBigInt.get(1n))->toEqual(Some("ONE"))
  })

  test("delete removes existing key", () => {
    let deleted = m->PrimBigInt.delete(1n)
    expect((deleted, m->PrimBigInt.has(1n)))->toEqual((true, false))
  })

  test("delete returns false for missing key", () => {
    expect(m->PrimBigInt.delete(99n))->toBe(false)
  })

  test("clear removes all entries", () => {
    m->PrimBigInt.clear
    expect(m->PrimBigInt.size)->toBe(0)
  })

  test("fromArray creates map from array", () => {
    let arr = [(5n, "five"), (6n, "six")]
    let newMap = PrimBigInt.fromArray(arr)
    expect(newMap->PrimBigInt.size)->toBe(2)
  })

  test("fromIterator creates map from iterator", () => {
    let iter = [(10n, "ten"), (20n, "twenty")]->Stdlib__Array_Ext.valuesIter
    let newMap = PrimBigInt.fromIterator(iter)
    expect(newMap->PrimBigInt.size)->toBe(2)
  })

  test("keys returns iterator of keys", () => {
    let keys = m->PrimBigInt.keys->Iterator.toArray
    expect(keys->Array.length)->toBe(2)
  })

  test("values returns iterator of values", () => {
    let values = m->PrimBigInt.values->Iterator.toArray
    expect(values->Array.length)->toBe(2)
  })

  test("entries returns iterator of entries", () => {
    let entries = m->PrimBigInt.entries->Iterator.toArray
    expect(entries->Array.length)->toBe(2)
  })

  test("forEach iterates over values", () => {
    let values = []
    m->PrimBigInt.forEach(v => values->Array.push(v))
    expect(values->Array.length)->toBe(2)
  })

  test("forEachWithKey iterates over entries", () => {
    let entries = []
    m->PrimBigInt.forEachWithKey((v, k) => entries->Array.push((k, v)))
    expect(entries->Array.length)->toBe(2)
  })
})

describe("PrimSymbol", () => {
  let sym1 = Symbol.make("symbol1")
  let sym2 = Symbol.make("symbol2")
  let m = PrimSymbol.make()

  beforeEach(() => {
    m->PrimSymbol.clear
    m->PrimSymbol.set(sym1, "first")
    m->PrimSymbol.set(sym2, "second")
  })

  test("make creates empty map", () => {
    let newMap = PrimSymbol.make()
    expect(newMap->PrimSymbol.size)->toBe(0)
  })

  test("size returns correct count", () => {
    expect(m->PrimSymbol.size)->toBe(2)
  })

  test("isEmpty returns false for non-empty map", () => {
    expect(m->PrimSymbol.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty map", () => {
    let emptyMap = PrimSymbol.make()
    expect(emptyMap->PrimSymbol.isEmpty)->toBe(true)
  })

  test("get returns Some for existing key", () => {
    expect(m->PrimSymbol.get(sym1))->toEqual(Some("first"))
  })

  test("get returns None for missing key", () => {
    let otherSym = Symbol.make("other")
    expect(m->PrimSymbol.get(otherSym))->toEqual(None)
  })

  test("has returns true for existing key", () => {
    expect(m->PrimSymbol.has(sym2))->toBe(true)
  })

  test("has returns false for missing key", () => {
    let otherSym = Symbol.make("other")
    expect(m->PrimSymbol.has(otherSym))->toBe(false)
  })

  test("set adds new entry", () => {
    let sym3 = Symbol.make("symbol3")
    m->PrimSymbol.set(sym3, "third")
    expect(m->PrimSymbol.get(sym3))->toEqual(Some("third"))
  })

  test("set overwrites existing entry", () => {
    m->PrimSymbol.set(sym1, "FIRST")
    expect(m->PrimSymbol.get(sym1))->toEqual(Some("FIRST"))
  })

  test("delete removes existing key", () => {
    let deleted = m->PrimSymbol.delete(sym1)
    expect((deleted, m->PrimSymbol.has(sym1)))->toEqual((true, false))
  })

  test("delete returns false for missing key", () => {
    let otherSym = Symbol.make("other")
    expect(m->PrimSymbol.delete(otherSym))->toBe(false)
  })

  test("clear removes all entries", () => {
    m->PrimSymbol.clear
    expect(m->PrimSymbol.size)->toBe(0)
  })

  test("fromArray creates map from array", () => {
    let s1 = Symbol.make("a")
    let s2 = Symbol.make("b")
    let arr = [(s1, "A"), (s2, "B")]
    let newMap = PrimSymbol.fromArray(arr)
    expect(newMap->PrimSymbol.size)->toBe(2)
  })

  test("fromIterator creates map from iterator", () => {
    let s1 = Symbol.make("x")
    let s2 = Symbol.make("y")
    let iter = [(s1, "X"), (s2, "Y")]->Stdlib__Array_Ext.valuesIter
    let newMap = PrimSymbol.fromIterator(iter)
    expect(newMap->PrimSymbol.size)->toBe(2)
  })

  test("keys returns iterator of keys", () => {
    let keys = m->PrimSymbol.keys->Iterator.toArray
    expect(keys->Array.length)->toBe(2)
  })

  test("values returns iterator of values", () => {
    let values = m->PrimSymbol.values->Iterator.toArray
    expect(values->Array.length)->toBe(2)
  })

  test("entries returns iterator of entries", () => {
    let entries = m->PrimSymbol.entries->Iterator.toArray
    expect(entries->Array.length)->toBe(2)
  })

  test("forEach iterates over values", () => {
    let values = []
    m->PrimSymbol.forEach(v => values->Array.push(v))
    expect(values->Array.length)->toBe(2)
  })

  test("forEachWithKey iterates over entries", () => {
    let entries = []
    m->PrimSymbol.forEachWithKey((v, k) => entries->Array.push((k, v)))
    expect(entries->Array.length)->toBe(2)
  })
})

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

describe("Tuple2.IntString", () => {
  let m = Tuple2.IntString.make()

  beforeEach(() => {
    m->Tuple2.IntString.clear
    m->Tuple2.IntString.set((1, "a"), "1a")
    m->Tuple2.IntString.set((2, "b"), "2b")
  })

  test("make creates empty map", () => {
    let newMap = Tuple2.IntString.make()
    expect(newMap->Tuple2.IntString.size)->toBe(0)
  })

  test("size returns correct count", () => {
    expect(m->Tuple2.IntString.size)->toBe(2)
  })

  test("isEmpty returns false for non-empty map", () => {
    expect(m->Tuple2.IntString.isEmpty)->toBe(false)
  })

  test("get returns Some for existing key", () => {
    expect(m->Tuple2.IntString.get((1, "a")))->toEqual(Some("1a"))
  })

  test("get returns None for missing key", () => {
    expect(m->Tuple2.IntString.get((9, "z")))->toEqual(None)
  })

  test("has returns true for existing key", () => {
    expect(m->Tuple2.IntString.has((2, "b")))->toBe(true)
  })

  test("set adds new entry", () => {
    m->Tuple2.IntString.set((3, "c"), "3c")
    expect(m->Tuple2.IntString.get((3, "c")))->toEqual(Some("3c"))
  })

  test("delete removes existing key", () => {
    let deleted = m->Tuple2.IntString.delete((1, "a"))
    expect((deleted, m->Tuple2.IntString.has((1, "a"))))->toEqual((true, false))
  })

  test("fromArray creates map from array", () => {
    let arr = [((5, "e"), "5e"), ((6, "f"), "6f")]
    let newMap = Tuple2.IntString.fromArray(arr)
    expect(newMap->Tuple2.IntString.size)->toBe(2)
  })

  test("keys returns iterator of keys", () => {
    let keys = m->Tuple2.IntString.keys->Iterator.toArray
    expect(keys->Array.length)->toBe(2)
  })

  test("values returns iterator of values", () => {
    let values = m->Tuple2.IntString.values->Iterator.toArray
    expect(values->Array.length)->toBe(2)
  })

  test("entries returns iterator of entries", () => {
    let entries = m->Tuple2.IntString.entries->Iterator.toArray
    expect(entries->Array.length)->toBe(2)
  })
})

describe("Tuple2.StringInt", () => {
  let m = Tuple2.StringInt.make()

  beforeEach(() => {
    m->Tuple2.StringInt.clear
    m->Tuple2.StringInt.set(("a", 1), "a1")
    m->Tuple2.StringInt.set(("b", 2), "b2")
  })

  test("get returns Some for existing key", () => {
    expect(m->Tuple2.StringInt.get(("a", 1)))->toEqual(Some("a1"))
  })

  test("has returns true for existing key", () => {
    expect(m->Tuple2.StringInt.has(("b", 2)))->toBe(true)
  })

  test("set adds new entry", () => {
    m->Tuple2.StringInt.set(("c", 3), "c3")
    expect(m->Tuple2.StringInt.get(("c", 3)))->toEqual(Some("c3"))
  })

  test("fromArray creates map from array", () => {
    let arr = [(("x", 10), "x10"), (("y", 20), "y20")]
    let newMap = Tuple2.StringInt.fromArray(arr)
    expect(newMap->Tuple2.StringInt.size)->toBe(2)
  })
})

describe("Tuple2.IntInt", () => {
  let m = Tuple2.IntInt.make()

  beforeEach(() => {
    m->Tuple2.IntInt.clear
    m->Tuple2.IntInt.set((1, 2), "12")
    m->Tuple2.IntInt.set((3, 4), "34")
  })

  test("get returns Some for existing key", () => {
    expect(m->Tuple2.IntInt.get((1, 2)))->toEqual(Some("12"))
  })

  test("has returns true for existing key", () => {
    expect(m->Tuple2.IntInt.has((3, 4)))->toBe(true)
  })

  test("set adds new entry", () => {
    m->Tuple2.IntInt.set((5, 6), "56")
    expect(m->Tuple2.IntInt.get((5, 6)))->toEqual(Some("56"))
  })

  test("delete removes existing key", () => {
    let deleted = m->Tuple2.IntInt.delete((1, 2))
    expect(deleted)->toBe(true)
  })

  test("fromArray creates map from array", () => {
    let arr = [((7, 8), "78"), ((9, 10), "910")]
    let newMap = Tuple2.IntInt.fromArray(arr)
    expect(newMap->Tuple2.IntInt.size)->toBe(2)
  })
})

describe("Tuple3.IntIntInt", () => {
  let m = Tuple3.IntIntInt.make()

  beforeEach(() => {
    m->Tuple3.IntIntInt.clear
    m->Tuple3.IntIntInt.set((1, 2, 3), "123")
    m->Tuple3.IntIntInt.set((4, 5, 6), "456")
  })

  test("make creates empty map", () => {
    let newMap = Tuple3.IntIntInt.make()
    expect(newMap->Tuple3.IntIntInt.size)->toBe(0)
  })

  test("size returns correct count", () => {
    expect(m->Tuple3.IntIntInt.size)->toBe(2)
  })

  test("isEmpty returns false for non-empty map", () => {
    expect(m->Tuple3.IntIntInt.isEmpty)->toBe(false)
  })

  test("get returns Some for existing key", () => {
    expect(m->Tuple3.IntIntInt.get((1, 2, 3)))->toEqual(Some("123"))
  })

  test("get returns None for missing key", () => {
    expect(m->Tuple3.IntIntInt.get((9, 9, 9)))->toEqual(None)
  })

  test("has returns true for existing key", () => {
    expect(m->Tuple3.IntIntInt.has((4, 5, 6)))->toBe(true)
  })

  test("set adds new entry", () => {
    m->Tuple3.IntIntInt.set((7, 8, 9), "789")
    expect(m->Tuple3.IntIntInt.get((7, 8, 9)))->toEqual(Some("789"))
  })

  test("delete removes existing key", () => {
    let deleted = m->Tuple3.IntIntInt.delete((1, 2, 3))
    expect((deleted, m->Tuple3.IntIntInt.has((1, 2, 3))))->toEqual((true, false))
  })

  test("fromArray creates map from array", () => {
    let arr = [((10, 11, 12), "101112"), ((13, 14, 15), "131415")]
    let newMap = Tuple3.IntIntInt.fromArray(arr)
    expect(newMap->Tuple3.IntIntInt.size)->toBe(2)
  })

  test("fromIterator creates map from iterator", () => {
    let iter = [((10, 11, 12), "abc"), ((13, 14, 15), "def")]->Stdlib__Array_Ext.valuesIter
    let newMap = Tuple3.IntIntInt.fromIterator(iter)
    expect(newMap->Tuple3.IntIntInt.size)->toBe(2)
  })

  test("keys returns iterator of keys", () => {
    let keys = m->Tuple3.IntIntInt.keys->Iterator.toArray
    expect(keys->Array.length)->toBe(2)
  })

  test("values returns iterator of values", () => {
    let values = m->Tuple3.IntIntInt.values->Iterator.toArray
    expect(values->Array.length)->toBe(2)
  })

  test("entries returns iterator of entries", () => {
    let entries = m->Tuple3.IntIntInt.entries->Iterator.toArray
    expect(entries->Array.length)->toBe(2)
  })
})

describe("Tuple3.FloatFloatFloat", () => {
  let m = Tuple3.FloatFloatFloat.make()

  beforeEach(() => {
    m->Tuple3.FloatFloatFloat.clear
    m->Tuple3.FloatFloatFloat.set((1.1, 2.2, 3.3), "a")
    m->Tuple3.FloatFloatFloat.set((4.4, 5.5, 6.6), "b")
  })

  test("make creates empty map", () => {
    let newMap = Tuple3.FloatFloatFloat.make()
    expect(newMap->Tuple3.FloatFloatFloat.size)->toBe(0)
  })

  test("size returns correct count", () => {
    expect(m->Tuple3.FloatFloatFloat.size)->toBe(2)
  })

  test("isEmpty returns false for non-empty map", () => {
    expect(m->Tuple3.FloatFloatFloat.isEmpty)->toBe(false)
  })

  test("get returns Some for existing key", () => {
    expect(m->Tuple3.FloatFloatFloat.get((1.1, 2.2, 3.3)))->toEqual(Some("a"))
  })

  test("get returns None for missing key", () => {
    expect(m->Tuple3.FloatFloatFloat.get((9.9, 9.9, 9.9)))->toEqual(None)
  })

  test("has returns true for existing key", () => {
    expect(m->Tuple3.FloatFloatFloat.has((4.4, 5.5, 6.6)))->toBe(true)
  })

  test("set adds new entry", () => {
    m->Tuple3.FloatFloatFloat.set((7.7, 8.8, 9.9), "c")
    expect(m->Tuple3.FloatFloatFloat.get((7.7, 8.8, 9.9)))->toEqual(Some("c"))
  })

  test("delete removes existing key", () => {
    let deleted = m->Tuple3.FloatFloatFloat.delete((1.1, 2.2, 3.3))
    expect((deleted, m->Tuple3.FloatFloatFloat.has((1.1, 2.2, 3.3))))->toEqual((true, false))
  })

  test("fromArray creates map from array", () => {
    let arr = [((10.1, 11.1, 12.1), "x"), ((13.1, 14.1, 15.1), "y")]
    let newMap = Tuple3.FloatFloatFloat.fromArray(arr)
    expect(newMap->Tuple3.FloatFloatFloat.size)->toBe(2)
  })

  test("fromIterator creates map from iterator", () => {
    let iter = [((1.1, 2.2, 3.3), "p"), ((4.4, 5.5, 6.6), "q")]->Stdlib__Array_Ext.valuesIter
    let newMap = Tuple3.FloatFloatFloat.fromIterator(iter)
    expect(newMap->Tuple3.FloatFloatFloat.size)->toBe(2)
  })

  test("keys returns iterator of keys", () => {
    let keys = m->Tuple3.FloatFloatFloat.keys->Iterator.toArray
    expect(keys->Array.length)->toBe(2)
  })

  test("values returns iterator of values", () => {
    let values = m->Tuple3.FloatFloatFloat.values->Iterator.toArray
    expect(values->Array.length)->toBe(2)
  })

  test("entries returns iterator of entries", () => {
    let entries = m->Tuple3.FloatFloatFloat.entries->Iterator.toArray
    expect(entries->Array.length)->toBe(2)
  })
})
