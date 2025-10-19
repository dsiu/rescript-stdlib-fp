open Jest
open Expect

module PrimInt = Stdlib__Set_Ext.Value.Int
module PrimString = Stdlib__Set_Ext.Value.String
module PrimFloat = Stdlib__Set_Ext.Value.Float
module PrimBigInt = Stdlib__Set_Ext.Value.BigInt
module PrimSymbol = Stdlib__Set_Ext.Value.Symbol

module ArrayInt = Stdlib__Set_Ext.Value.Array.Int
module ArrayString = Stdlib__Set_Ext.Value.Array.String
module ArrayFloat = Stdlib__Set_Ext.Value.Array.Float

module SetTuple2IntString = Stdlib__Set_Ext.Value.Tuple2.IntString
module SetTuple2FloatFloat = Stdlib__Set_Ext.Value.Tuple2.FloatFloat
module SetTuple3IntIntInt = Stdlib__Set_Ext.Value.Tuple3.IntIntInt

describe("PrimInt", () => {
  let s = PrimInt.make()

  beforeEach(() => {
    s->PrimInt.clear
    s->PrimInt.add(1)
    s->PrimInt.add(2)
    s->PrimInt.add(3)
  })

  test("make creates empty set", () => {
    let newSet = PrimInt.make()
    expect(newSet->PrimInt.size)->toBe(0)
  })

  test("size returns correct count", () => {
    expect(s->PrimInt.size)->toBe(3)
  })

  test("add adds new value", () => {
    s->PrimInt.add(4)
    expect(s->PrimInt.size)->toBe(4)
  })

  test("add doesn't duplicate existing value", () => {
    s->PrimInt.add(1)
    expect(s->PrimInt.size)->toBe(3)
  })

  test("has returns true for existing value", () => {
    expect(s->PrimInt.has(2))->toBe(true)
  })

  test("has returns false for missing value", () => {
    expect(s->PrimInt.has(99))->toBe(false)
  })

  test("delete removes existing value", () => {
    let deleted = s->PrimInt.delete(1)
    expect((deleted, s->PrimInt.has(1)))->toEqual((true, false))
  })

  test("delete returns false for missing value", () => {
    expect(s->PrimInt.delete(99))->toBe(false)
  })

  test("clear removes all values", () => {
    s->PrimInt.clear
    expect(s->PrimInt.size)->toBe(0)
  })

  test("isEmpty returns false for non-empty set", () => {
    expect(s->PrimInt.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty set", () => {
    let emptySet = PrimInt.make()
    expect(emptySet->PrimInt.isEmpty)->toBe(true)
  })

  test("fromArray creates set from array", () => {
    let arr = [5, 6, 7]
    let newSet = PrimInt.fromArray(arr)
    expect(newSet->PrimInt.size)->toBe(3)
  })

  test("fromIterator creates set from iterator", () => {
    let iter = [10, 20, 30]->Stdlib__Array_Ext.valuesIter
    let newSet = PrimInt.fromIterator(iter)
    expect(newSet->PrimInt.size)->toBe(3)
  })

  test("values returns iterator of values", () => {
    let values = s->PrimInt.values->Iterator.toArray
    expect(values->Array.length)->toBe(3)
  })

  test("forEach iterates over values", () => {
    let values = []
    s->PrimInt.forEach(v => values->Array.push(v))
    expect(values->Array.length)->toBe(3)
  })

  test("toArray converts set to array", () => {
    let arr = s->PrimInt.toArray
    expect(arr->Array.length)->toBe(3)
  })

  test("difference", () => {
    let s2 = PrimInt.make()
    s2->PrimInt.add(2)
    let diff = PrimInt.difference(s, s2)
    expect((diff->PrimInt.has(1), diff->PrimInt.has(2), diff->PrimInt.has(3)))->toEqual((
      true,
      false,
      true,
    ))
  })

  test("intersection", () => {
    let s2 = PrimInt.make()
    s2->PrimInt.add(2)
    s2->PrimInt.add(4)
    let inter = PrimInt.intersection(s, s2)
    expect(inter->PrimInt.values->Iterator.toArray)->toEqual([2])
  })

  test("union", () => {
    let s2 = PrimInt.make()
    s2->PrimInt.add(4)
    s2->PrimInt.add(5)
    let union = PrimInt.union(s, s2)
    expect(union->PrimInt.size)->toBe(5)
  })

  test("symmetricDifference", () => {
    let s2 = PrimInt.make()
    s2->PrimInt.add(2)
    s2->PrimInt.add(4)
    let symDiff = PrimInt.symmetricDifference(s, s2)
    expect((
      symDiff->PrimInt.has(1),
      symDiff->PrimInt.has(2),
      symDiff->PrimInt.has(3),
      symDiff->PrimInt.has(4),
    ))->toEqual((true, false, true, true))
  })

  test("isSubsetOf", () => {
    let s2 = PrimInt.make()
    s2->PrimInt.add(1)
    s2->PrimInt.add(2)
    s2->PrimInt.add(3)
    expect(s->PrimInt.isSubsetOf(s2))->toBe(true)
  })

  test("isSupersetOf", () => {
    let s2 = PrimInt.make()
    s2->PrimInt.add(1)
    expect(s->PrimInt.isSupersetOf(s2))->toBe(true)
  })

  test("isDisjointFrom", () => {
    let s2 = PrimInt.make()
    s2->PrimInt.add(10)
    expect(s->PrimInt.isDisjointFrom(s2))->toBe(true)
  })

  test("ignore discards the set", () => {
    expect(s->PrimInt.ignore)->toBe()
  })
})

describe("PrimString", () => {
  let s = PrimString.make()

  beforeEach(() => {
    s->PrimString.clear
    s->PrimString.add("a")
    s->PrimString.add("b")
    s->PrimString.add("c")
  })

  test("make creates empty set", () => {
    let newSet = PrimString.make()
    expect(newSet->PrimString.size)->toBe(0)
  })

  test("size returns correct count", () => {
    expect(s->PrimString.size)->toBe(3)
  })

  test("add adds new value", () => {
    s->PrimString.add("d")
    expect(s->PrimString.size)->toBe(4)
  })

  test("add doesn't duplicate existing value", () => {
    s->PrimString.add("a")
    expect(s->PrimString.size)->toBe(3)
  })

  test("has returns true for existing value", () => {
    expect(s->PrimString.has("b"))->toBe(true)
  })

  test("has returns false for missing value", () => {
    expect(s->PrimString.has("z"))->toBe(false)
  })

  test("delete removes existing value", () => {
    let deleted = s->PrimString.delete("a")
    expect((deleted, s->PrimString.has("a")))->toEqual((true, false))
  })

  test("delete returns false for missing value", () => {
    expect(s->PrimString.delete("z"))->toBe(false)
  })

  test("clear removes all values", () => {
    s->PrimString.clear
    expect(s->PrimString.size)->toBe(0)
  })

  test("isEmpty returns false for non-empty set", () => {
    expect(s->PrimString.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty set", () => {
    let emptySet = PrimString.make()
    expect(emptySet->PrimString.isEmpty)->toBe(true)
  })

  test("fromArray creates set from array", () => {
    let arr = ["x", "y", "z"]
    let newSet = PrimString.fromArray(arr)
    expect(newSet->PrimString.size)->toBe(3)
  })

  test("fromIterator creates set from iterator", () => {
    let iter = ["p", "q", "r"]->Stdlib__Array_Ext.valuesIter
    let newSet = PrimString.fromIterator(iter)
    expect(newSet->PrimString.size)->toBe(3)
  })

  test("values returns iterator of values", () => {
    let values = s->PrimString.values->Iterator.toArray
    expect(values->Array.length)->toBe(3)
  })

  test("forEach iterates over values", () => {
    let values = []
    s->PrimString.forEach(v => values->Array.push(v))
    expect(values->Array.length)->toBe(3)
  })

  test("toArray converts set to array", () => {
    let arr = s->PrimString.toArray
    expect(arr->Array.length)->toBe(3)
  })

  test("difference", () => {
    let s2 = PrimString.make()
    s2->PrimString.add("b")
    let diff = PrimString.difference(s, s2)
    expect((diff->PrimString.has("a"), diff->PrimString.has("b"), diff->PrimString.has("c")))->toEqual((
      true,
      false,
      true,
    ))
  })

  test("intersection", () => {
    let s2 = PrimString.make()
    s2->PrimString.add("b")
    s2->PrimString.add("d")
    let inter = PrimString.intersection(s, s2)
    expect(inter->PrimString.values->Iterator.toArray)->toEqual(["b"])
  })

  test("union", () => {
    let s2 = PrimString.make()
    s2->PrimString.add("d")
    s2->PrimString.add("e")
    let union = PrimString.union(s, s2)
    expect(union->PrimString.size)->toBe(5)
  })

  test("symmetricDifference", () => {
    let s2 = PrimString.make()
    s2->PrimString.add("b")
    s2->PrimString.add("d")
    let symDiff = PrimString.symmetricDifference(s, s2)
    expect((
      symDiff->PrimString.has("a"),
      symDiff->PrimString.has("b"),
      symDiff->PrimString.has("c"),
      symDiff->PrimString.has("d"),
    ))->toEqual((true, false, true, true))
  })

  test("isSubsetOf", () => {
    let s2 = PrimString.make()
    s2->PrimString.add("a")
    s2->PrimString.add("b")
    s2->PrimString.add("c")
    expect(s->PrimString.isSubsetOf(s2))->toBe(true)
  })

  test("isSupersetOf", () => {
    let s2 = PrimString.make()
    s2->PrimString.add("a")
    expect(s->PrimString.isSupersetOf(s2))->toBe(true)
  })

  test("isDisjointFrom", () => {
    let s2 = PrimString.make()
    s2->PrimString.add("z")
    expect(s->PrimString.isDisjointFrom(s2))->toBe(true)
  })

  test("ignore discards the set", () => {
    expect(s->PrimString.ignore)->toBe()
  })
})

describe("PrimFloat", () => {
  let s = PrimFloat.make()

  beforeEach(() => {
    s->PrimFloat.clear
    s->PrimFloat.add(1.1)
    s->PrimFloat.add(2.2)
    s->PrimFloat.add(3.3)
  })

  test("make creates empty set", () => {
    let newSet = PrimFloat.make()
    expect(newSet->PrimFloat.size)->toBe(0)
  })

  test("size returns correct count", () => {
    expect(s->PrimFloat.size)->toBe(3)
  })

  test("add adds new value", () => {
    s->PrimFloat.add(4.4)
    expect(s->PrimFloat.size)->toBe(4)
  })

  test("add doesn't duplicate existing value", () => {
    s->PrimFloat.add(1.1)
    expect(s->PrimFloat.size)->toBe(3)
  })

  test("has returns true for existing value", () => {
    expect(s->PrimFloat.has(2.2))->toBe(true)
  })

  test("has returns false for missing value", () => {
    expect(s->PrimFloat.has(9.9))->toBe(false)
  })

  test("delete removes existing value", () => {
    let deleted = s->PrimFloat.delete(1.1)
    expect((deleted, s->PrimFloat.has(1.1)))->toEqual((true, false))
  })

  test("delete returns false for missing value", () => {
    expect(s->PrimFloat.delete(9.9))->toBe(false)
  })

  test("clear removes all values", () => {
    s->PrimFloat.clear
    expect(s->PrimFloat.size)->toBe(0)
  })

  test("isEmpty returns false for non-empty set", () => {
    expect(s->PrimFloat.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty set", () => {
    let emptySet = PrimFloat.make()
    expect(emptySet->PrimFloat.isEmpty)->toBe(true)
  })

  test("fromArray creates set from array", () => {
    let arr = [5.5, 6.6, 7.7]
    let newSet = PrimFloat.fromArray(arr)
    expect(newSet->PrimFloat.size)->toBe(3)
  })

  test("fromIterator creates set from iterator", () => {
    let iter = [10.1, 20.2, 30.3]->Stdlib__Array_Ext.valuesIter
    let newSet = PrimFloat.fromIterator(iter)
    expect(newSet->PrimFloat.size)->toBe(3)
  })

  test("values returns iterator of values", () => {
    let values = s->PrimFloat.values->Iterator.toArray
    expect(values->Array.length)->toBe(3)
  })

  test("forEach iterates over values", () => {
    let values = []
    s->PrimFloat.forEach(v => values->Array.push(v))
    expect(values->Array.length)->toBe(3)
  })

  test("toArray converts set to array", () => {
    let arr = s->PrimFloat.toArray
    expect(arr->Array.length)->toBe(3)
  })

  test("difference", () => {
    let s2 = PrimFloat.make()
    s2->PrimFloat.add(2.2)
    let diff = PrimFloat.difference(s, s2)
    expect((diff->PrimFloat.has(1.1), diff->PrimFloat.has(2.2), diff->PrimFloat.has(3.3)))->toEqual((
      true,
      false,
      true,
    ))
  })

  test("intersection", () => {
    let s2 = PrimFloat.make()
    s2->PrimFloat.add(2.2)
    s2->PrimFloat.add(4.4)
    let inter = PrimFloat.intersection(s, s2)
    expect(inter->PrimFloat.values->Iterator.toArray)->toEqual([2.2])
  })

  test("union", () => {
    let s2 = PrimFloat.make()
    s2->PrimFloat.add(4.4)
    s2->PrimFloat.add(5.5)
    let union = PrimFloat.union(s, s2)
    expect(union->PrimFloat.size)->toBe(5)
  })

  test("symmetricDifference", () => {
    let s2 = PrimFloat.make()
    s2->PrimFloat.add(2.2)
    s2->PrimFloat.add(4.4)
    let symDiff = PrimFloat.symmetricDifference(s, s2)
    expect((
      symDiff->PrimFloat.has(1.1),
      symDiff->PrimFloat.has(2.2),
      symDiff->PrimFloat.has(3.3),
      symDiff->PrimFloat.has(4.4),
    ))->toEqual((true, false, true, true))
  })

  test("isSubsetOf", () => {
    let s2 = PrimFloat.make()
    s2->PrimFloat.add(1.1)
    s2->PrimFloat.add(2.2)
    s2->PrimFloat.add(3.3)
    expect(s->PrimFloat.isSubsetOf(s2))->toBe(true)
  })

  test("isSupersetOf", () => {
    let s2 = PrimFloat.make()
    s2->PrimFloat.add(1.1)
    expect(s->PrimFloat.isSupersetOf(s2))->toBe(true)
  })

  test("isDisjointFrom", () => {
    let s2 = PrimFloat.make()
    s2->PrimFloat.add(9.9)
    expect(s->PrimFloat.isDisjointFrom(s2))->toBe(true)
  })

  test("ignore discards the set", () => {
    expect(s->PrimFloat.ignore)->toBe()
  })
})

describe("PrimBigInt", () => {
  let s = PrimBigInt.make()

  beforeEach(() => {
    s->PrimBigInt.clear
    s->PrimBigInt.add(1n)
    s->PrimBigInt.add(2n)
    s->PrimBigInt.add(3n)
  })

  test("make creates empty set", () => {
    let newSet = PrimBigInt.make()
    expect(newSet->PrimBigInt.size)->toBe(0)
  })

  test("size returns correct count", () => {
    expect(s->PrimBigInt.size)->toBe(3)
  })

  test("add adds new value", () => {
    s->PrimBigInt.add(4n)
    expect(s->PrimBigInt.size)->toBe(4)
  })

  test("add doesn't duplicate existing value", () => {
    s->PrimBigInt.add(1n)
    expect(s->PrimBigInt.size)->toBe(3)
  })

  test("has returns true for existing value", () => {
    expect(s->PrimBigInt.has(2n))->toBe(true)
  })

  test("has returns false for missing value", () => {
    expect(s->PrimBigInt.has(99n))->toBe(false)
  })

  test("delete removes existing value", () => {
    let deleted = s->PrimBigInt.delete(1n)
    expect((deleted, s->PrimBigInt.has(1n)))->toEqual((true, false))
  })

  test("delete returns false for missing value", () => {
    expect(s->PrimBigInt.delete(99n))->toBe(false)
  })

  test("clear removes all values", () => {
    s->PrimBigInt.clear
    expect(s->PrimBigInt.size)->toBe(0)
  })

  test("isEmpty returns false for non-empty set", () => {
    expect(s->PrimBigInt.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty set", () => {
    let emptySet = PrimBigInt.make()
    expect(emptySet->PrimBigInt.isEmpty)->toBe(true)
  })

  test("fromArray creates set from array", () => {
    let arr = [5n, 6n, 7n]
    let newSet = PrimBigInt.fromArray(arr)
    expect(newSet->PrimBigInt.size)->toBe(3)
  })

  test("fromIterator creates set from iterator", () => {
    let iter = [10n, 20n, 30n]->Stdlib__Array_Ext.valuesIter
    let newSet = PrimBigInt.fromIterator(iter)
    expect(newSet->PrimBigInt.size)->toBe(3)
  })

  test("values returns iterator of values", () => {
    let values = s->PrimBigInt.values->Iterator.toArray
    expect(values->Array.length)->toBe(3)
  })

  test("forEach iterates over values", () => {
    let values = []
    s->PrimBigInt.forEach(v => values->Array.push(v))
    expect(values->Array.length)->toBe(3)
  })

  test("toArray converts set to array", () => {
    let arr = s->PrimBigInt.toArray
    expect(arr->Array.length)->toBe(3)
  })

  test("difference", () => {
    let s2 = PrimBigInt.make()
    s2->PrimBigInt.add(2n)
    let diff = PrimBigInt.difference(s, s2)
    expect((diff->PrimBigInt.has(1n), diff->PrimBigInt.has(2n), diff->PrimBigInt.has(3n)))->toEqual((
      true,
      false,
      true,
    ))
  })

  test("intersection", () => {
    let s2 = PrimBigInt.make()
    s2->PrimBigInt.add(2n)
    s2->PrimBigInt.add(4n)
    let inter = PrimBigInt.intersection(s, s2)
    expect(inter->PrimBigInt.values->Iterator.toArray)->toEqual([2n])
  })

  test("union", () => {
    let s2 = PrimBigInt.make()
    s2->PrimBigInt.add(4n)
    s2->PrimBigInt.add(5n)
    let union = PrimBigInt.union(s, s2)
    expect(union->PrimBigInt.size)->toBe(5)
  })

  test("symmetricDifference", () => {
    let s2 = PrimBigInt.make()
    s2->PrimBigInt.add(2n)
    s2->PrimBigInt.add(4n)
    let symDiff = PrimBigInt.symmetricDifference(s, s2)
    expect((
      symDiff->PrimBigInt.has(1n),
      symDiff->PrimBigInt.has(2n),
      symDiff->PrimBigInt.has(3n),
      symDiff->PrimBigInt.has(4n),
    ))->toEqual((true, false, true, true))
  })

  test("isSubsetOf", () => {
    let s2 = PrimBigInt.make()
    s2->PrimBigInt.add(1n)
    s2->PrimBigInt.add(2n)
    s2->PrimBigInt.add(3n)
    expect(s->PrimBigInt.isSubsetOf(s2))->toBe(true)
  })

  test("isSupersetOf", () => {
    let s2 = PrimBigInt.make()
    s2->PrimBigInt.add(1n)
    expect(s->PrimBigInt.isSupersetOf(s2))->toBe(true)
  })

  test("isDisjointFrom", () => {
    let s2 = PrimBigInt.make()
    s2->PrimBigInt.add(10n)
    expect(s->PrimBigInt.isDisjointFrom(s2))->toBe(true)
  })

  test("ignore discards the set", () => {
    expect(s->PrimBigInt.ignore)->toBe()
  })
})

describe("PrimSymbol", () => {
  let sym1 = Symbol.make("symbol1")
  let sym2 = Symbol.make("symbol2")
  let sym3 = Symbol.make("symbol3")
  let s = PrimSymbol.make()

  beforeEach(() => {
    s->PrimSymbol.clear
    s->PrimSymbol.add(sym1)
    s->PrimSymbol.add(sym2)
    s->PrimSymbol.add(sym3)
  })

  test("make creates empty set", () => {
    let newSet = PrimSymbol.make()
    expect(newSet->PrimSymbol.size)->toBe(0)
  })

  test("size returns correct count", () => {
    expect(s->PrimSymbol.size)->toBe(3)
  })

  test("add adds new value", () => {
    let sym4 = Symbol.make("symbol4")
    s->PrimSymbol.add(sym4)
    expect(s->PrimSymbol.size)->toBe(4)
  })

  test("add doesn't duplicate existing value", () => {
    s->PrimSymbol.add(sym1)
    expect(s->PrimSymbol.size)->toBe(3)
  })

  test("has returns true for existing value", () => {
    expect(s->PrimSymbol.has(sym2))->toBe(true)
  })

  test("has returns false for missing value", () => {
    let otherSym = Symbol.make("other")
    expect(s->PrimSymbol.has(otherSym))->toBe(false)
  })

  test("delete removes existing value", () => {
    let deleted = s->PrimSymbol.delete(sym1)
    expect((deleted, s->PrimSymbol.has(sym1)))->toEqual((true, false))
  })

  test("delete returns false for missing value", () => {
    let otherSym = Symbol.make("other")
    expect(s->PrimSymbol.delete(otherSym))->toBe(false)
  })

  test("clear removes all values", () => {
    s->PrimSymbol.clear
    expect(s->PrimSymbol.size)->toBe(0)
  })

  test("isEmpty returns false for non-empty set", () => {
    expect(s->PrimSymbol.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty set", () => {
    let emptySet = PrimSymbol.make()
    expect(emptySet->PrimSymbol.isEmpty)->toBe(true)
  })

  test("fromArray creates set from array", () => {
    let s1 = Symbol.make("a")
    let s2 = Symbol.make("b")
    let s3 = Symbol.make("c")
    let arr = [s1, s2, s3]
    let newSet = PrimSymbol.fromArray(arr)
    expect(newSet->PrimSymbol.size)->toBe(3)
  })

  test("fromIterator creates set from iterator", () => {
    let s1 = Symbol.make("x")
    let s2 = Symbol.make("y")
    let s3 = Symbol.make("z")
    let iter = [s1, s2, s3]->Stdlib__Array_Ext.valuesIter
    let newSet = PrimSymbol.fromIterator(iter)
    expect(newSet->PrimSymbol.size)->toBe(3)
  })

  test("values returns iterator of values", () => {
    let values = s->PrimSymbol.values->Iterator.toArray
    expect(values->Array.length)->toBe(3)
  })

  test("forEach iterates over values", () => {
    let values = []
    s->PrimSymbol.forEach(v => values->Array.push(v))
    expect(values->Array.length)->toBe(3)
  })

  test("toArray converts set to array", () => {
    let arr = s->PrimSymbol.toArray
    expect(arr->Array.length)->toBe(3)
  })

  test("difference", () => {
    let s2 = PrimSymbol.make()
    s2->PrimSymbol.add(sym2)
    let diff = PrimSymbol.difference(s, s2)
    expect((
      diff->PrimSymbol.has(sym1),
      diff->PrimSymbol.has(sym2),
      diff->PrimSymbol.has(sym3),
    ))->toEqual((true, false, true))
  })

  test("intersection", () => {
    let sym4 = Symbol.make("symbol4")
    let s2 = PrimSymbol.make()
    s2->PrimSymbol.add(sym2)
    s2->PrimSymbol.add(sym4)
    let inter = PrimSymbol.intersection(s, s2)
    expect(inter->PrimSymbol.values->Iterator.toArray)->toEqual([sym2])
  })

  test("union", () => {
    let sym4 = Symbol.make("symbol4")
    let sym5 = Symbol.make("symbol5")
    let s2 = PrimSymbol.make()
    s2->PrimSymbol.add(sym4)
    s2->PrimSymbol.add(sym5)
    let union = PrimSymbol.union(s, s2)
    expect(union->PrimSymbol.size)->toBe(5)
  })

  test("symmetricDifference", () => {
    let sym4 = Symbol.make("symbol4")
    let s2 = PrimSymbol.make()
    s2->PrimSymbol.add(sym2)
    s2->PrimSymbol.add(sym4)
    let symDiff = PrimSymbol.symmetricDifference(s, s2)
    expect((
      symDiff->PrimSymbol.has(sym1),
      symDiff->PrimSymbol.has(sym2),
      symDiff->PrimSymbol.has(sym3),
      symDiff->PrimSymbol.has(sym4),
    ))->toEqual((true, false, true, true))
  })

  test("isSubsetOf", () => {
    let s2 = PrimSymbol.make()
    s2->PrimSymbol.add(sym1)
    s2->PrimSymbol.add(sym2)
    s2->PrimSymbol.add(sym3)
    expect(s->PrimSymbol.isSubsetOf(s2))->toBe(true)
  })

  test("isSupersetOf", () => {
    let s2 = PrimSymbol.make()
    s2->PrimSymbol.add(sym1)
    expect(s->PrimSymbol.isSupersetOf(s2))->toBe(true)
  })

  test("isDisjointFrom", () => {
    let otherSym = Symbol.make("other")
    let s2 = PrimSymbol.make()
    s2->PrimSymbol.add(otherSym)
    expect(s->PrimSymbol.isDisjointFrom(s2))->toBe(true)
  })

  test("ignore discards the set", () => {
    expect(s->PrimSymbol.ignore)->toBe()
  })
})

describe("ArrayInt", () => {
  let si = ArrayInt.make()

  beforeEach(() => {
    si->ArrayInt.clear
    si->ArrayInt.add([1, 2, 3])
    si->ArrayInt.add([4, 5, 6])
    si->ArrayInt.add([7, 8, 9])
  })

  test("clear all values", () => {
    si->ArrayInt.clear
    expect(si->ArrayInt.size)->toBe(0)
  })

  test("forEach", () => {
    let values = []
    si->ArrayInt.forEach(v => values->Array.push(v))
    expect(values)->toEqual([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  })

  test("has value", () => {
    expect(si->ArrayInt.has([1, 2, 3]))->toBe(true)
  })

  test("delete value", () => {
    expect(si->ArrayInt.delete([1, 2, 3]))->toBe(true)
  })

  test("fromArray", () => {
    let arr = [[1, 2, 3], [4, 5, 6]]
    let si = ArrayInt.fromArray(arr)
    expect(si->ArrayInt.size)->toBe(2)
  })

  test("fromIterator", () => {
    let iter = [[1, 2, 3], [4, 5, 6]]->Stdlib__Array_Ext.valuesIter
    let si = ArrayInt.fromIterator(iter)
    expect(si->ArrayInt.size)->toBe(2)
  })

  test("values", () => {
    let values = si->ArrayInt.values->Iterator.toArray
    expect(values)->toEqual([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  })

  test("difference", () => {
    let si2 = ArrayInt.make()
    si2->ArrayInt.add([4, 5, 6])
    let diff = ArrayInt.difference(si, si2)
    expect(diff->ArrayInt.values->Iterator.toArray)->toEqual([[1, 2, 3], [7, 8, 9]])
  })

  test("intersection", () => {
    let si2 = ArrayInt.make()
    si2->ArrayInt.add([4, 5, 6])
    let inter = ArrayInt.intersection(si, si2)
    expect(inter->ArrayInt.values->Iterator.toArray)->toEqual([[4, 5, 6]])
  })

  test("union", () => {
    let si2 = ArrayInt.make()
    si2->ArrayInt.add([10, 11, 12])
    let union = ArrayInt.union(si, si2)
    expect(union->ArrayInt.values->Iterator.toArray)->toEqual([
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [10, 11, 12],
    ])
  })

  test("symmetricDifference", () => {
    let si2 = ArrayInt.make()
    si2->ArrayInt.add([4, 5, 6])
    si2->ArrayInt.add([10, 11, 12])
    let symDiff = ArrayInt.symmetricDifference(si, si2)
    expect(symDiff->ArrayInt.values->Iterator.toArray)->toEqual([
      [1, 2, 3],
      [7, 8, 9],
      [10, 11, 12],
    ])
  })

  test("isSubsetOf", () => {
    let si2 = ArrayInt.make()
    si2->ArrayInt.add([1, 2, 3])
    si2->ArrayInt.add([4, 5, 6])
    si2->ArrayInt.add([7, 8, 9])
    expect(si->ArrayInt.isSubsetOf(si2))->toBe(true)
  })

  test("isSupersetOf", () => {
    let si2 = ArrayInt.make()
    si2->ArrayInt.add([1, 2, 3])
    expect(si->ArrayInt.isSupersetOf(si2))->toBe(true)
  })

  test("isDisjointFrom", () => {
    let si2 = ArrayInt.make()
    si2->ArrayInt.add([10, 11, 12])
    expect(si->ArrayInt.isDisjointFrom(si2))->toBe(true)
  })

  test("isEmpty returns false for non-empty set", () => {
    expect(si->ArrayInt.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty set", () => {
    let si2 = ArrayInt.make()
    expect(si2->ArrayInt.isEmpty)->toBe(true)
  })

  test("toArray converts set to array", () => {
    let arr = si->ArrayInt.toArray
    expect(arr)->toEqual([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  })

  test("ignore discards the set", () => {
    expect(si->ArrayInt.ignore)->toBe()
  })
})

describe("ArrayString", () => {
  let ss = ArrayString.make()

  beforeEach(() => {
    ss->ArrayString.clear
    ss->ArrayString.add(["a", "b", "c"])
    ss->ArrayString.add(["d", "e", "f"])
    ss->ArrayString.add(["g", "h", "i"])
  })

  test("clear all values", () => {
    ss->ArrayString.clear
    expect(ss->ArrayString.size)->toBe(0)
  })

  test("forEach", () => {
    let values = []
    ss->ArrayString.forEach(v => values->Array.push(v))
    expect(values)->toEqual([["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"]])
  })

  test("has value", () => {
    expect(ss->ArrayString.has(["a", "b", "c"]))->toBe(true)
  })

  test("delete value", () => {
    expect(ss->ArrayString.delete(["a", "b", "c"]))->toBe(true)
  })

  test("fromArray", () => {
    let arr = [["a", "b", "c"], ["d", "e", "f"]]
    let ss = ArrayString.fromArray(arr)
    expect(ss->ArrayString.size)->toBe(2)
  })

  test("fromIterator", () => {
    let iter = [["a", "b", "c"], ["d", "e", "f"]]->Stdlib__Array_Ext.valuesIter
    let ss = ArrayString.fromIterator(iter)
    expect(ss->ArrayString.size)->toBe(2)
  })

  test("values", () => {
    let values = ss->ArrayString.values->Iterator.toArray
    expect(values)->toEqual([["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"]])
  })

  test("difference", () => {
    let ss2 = ArrayString.make()
    ss2->ArrayString.add(["d", "e", "f"])
    let diff = ArrayString.difference(ss, ss2)
    expect(diff->ArrayString.values->Iterator.toArray)->toEqual([["a", "b", "c"], ["g", "h", "i"]])
  })

  test("intersection", () => {
    let ss2 = ArrayString.make()
    ss2->ArrayString.add(["d", "e", "f"])
    let inter = ArrayString.intersection(ss, ss2)
    expect(inter->ArrayString.values->Iterator.toArray)->toEqual([["d", "e", "f"]])
  })

  test("union", () => {
    let ss2 = ArrayString.make()
    ss2->ArrayString.add(["j", "k", "l"])
    let union = ArrayString.union(ss, ss2)
    expect(union->ArrayString.values->Iterator.toArray)->toEqual([
      ["a", "b", "c"],
      ["d", "e", "f"],
      ["g", "h", "i"],
      ["j", "k", "l"],
    ])
  })

  test("symmetricDifference", () => {
    let ss2 = ArrayString.make()
    ss2->ArrayString.add(["d", "e", "f"])
    ss2->ArrayString.add(["j", "k", "l"])
    let symDiff = ArrayString.symmetricDifference(ss, ss2)
    expect(symDiff->ArrayString.values->Iterator.toArray)->toEqual([
      ["a", "b", "c"],
      ["g", "h", "i"],
      ["j", "k", "l"],
    ])
  })

  test("isSubsetOf", () => {
    let ss2 = ArrayString.make()
    ss2->ArrayString.add(["a", "b", "c"])
    ss2->ArrayString.add(["d", "e", "f"])
    ss2->ArrayString.add(["g", "h", "i"])
    expect(ss->ArrayString.isSubsetOf(ss2))->toBe(true)
  })

  test("isSupersetOf", () => {
    let ss2 = ArrayString.make()
    ss2->ArrayString.add(["a", "b", "c"])
    expect(ss->ArrayString.isSupersetOf(ss2))->toBe(true)
  })

  test("isDisjointFrom", () => {
    let ss2 = ArrayString.make()
    ss2->ArrayString.add(["j", "k", "l"])
    expect(ss->ArrayString.isDisjointFrom(ss2))->toBe(true)
  })

  test("isEmpty returns false for non-empty set", () => {
    expect(ss->ArrayString.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty set", () => {
    let ss2 = ArrayString.make()
    expect(ss2->ArrayString.isEmpty)->toBe(true)
  })

  test("toArray converts set to array", () => {
    let arr = ss->ArrayString.toArray
    expect(arr)->toEqual([["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"]])
  })

  test("ignore discards the set", () => {
    expect(ss->ArrayString.ignore)->toBe()
  })
})

describe("ArrayFloat", () => {
  let sf = ArrayFloat.make()

  beforeEach(() => {
    sf->ArrayFloat.clear
    sf->ArrayFloat.add([1.1, 2.2, 3.3])
    sf->ArrayFloat.add([4.4, 5.5, 6.6])
    sf->ArrayFloat.add([7.7, 8.8, 9.9])
  })

  test("clear all values", () => {
    sf->ArrayFloat.clear
    expect(sf->ArrayFloat.size)->toBe(0)
  })

  test("forEach", () => {
    let values = []
    sf->ArrayFloat.forEach(v => values->Array.push(v))
    expect(values)->toEqual([[1.1, 2.2, 3.3], [4.4, 5.5, 6.6], [7.7, 8.8, 9.9]])
  })

  test("has value", () => {
    expect(sf->ArrayFloat.has([1.1, 2.2, 3.3]))->toBe(true)
  })

  test("delete value", () => {
    expect(sf->ArrayFloat.delete([1.1, 2.2, 3.3]))->toBe(true)
  })

  test("fromArray", () => {
    let arr = [[1.1, 2.2, 3.3], [4.4, 5.5, 6.6]]
    let sf = ArrayFloat.fromArray(arr)
    expect(sf->ArrayFloat.size)->toBe(2)
  })

  test("fromIterator", () => {
    let iter = [[1.1, 2.2, 3.3], [4.4, 5.5, 6.6]]->Stdlib__Array_Ext.valuesIter
    let sf = ArrayFloat.fromIterator(iter)
    expect(sf->ArrayFloat.size)->toBe(2)
  })

  test("values", () => {
    let values = sf->ArrayFloat.values->Iterator.toArray
    expect(values)->toEqual([[1.1, 2.2, 3.3], [4.4, 5.5, 6.6], [7.7, 8.8, 9.9]])
  })

  test("difference", () => {
    let sf2 = ArrayFloat.make()
    sf2->ArrayFloat.add([4.4, 5.5, 6.6])
    let diff = ArrayFloat.difference(sf, sf2)
    expect(diff->ArrayFloat.values->Iterator.toArray)->toEqual([[1.1, 2.2, 3.3], [7.7, 8.8, 9.9]])
  })

  test("intersection", () => {
    let sf2 = ArrayFloat.make()
    sf2->ArrayFloat.add([4.4, 5.5, 6.6])
    let inter = ArrayFloat.intersection(sf, sf2)
    expect(inter->ArrayFloat.values->Iterator.toArray)->toEqual([[4.4, 5.5, 6.6]])
  })

  test("union", () => {
    let sf2 = ArrayFloat.make()
    sf2->ArrayFloat.add([10.1, 11.2, 12.3])
    let union = ArrayFloat.union(sf, sf2)
    expect(union->ArrayFloat.values->Iterator.toArray)->toEqual([
      [1.1, 2.2, 3.3],
      [4.4, 5.5, 6.6],
      [7.7, 8.8, 9.9],
      [10.1, 11.2, 12.3],
    ])
  })

  test("symmetricDifference", () => {
    let sf2 = ArrayFloat.make()
    sf2->ArrayFloat.add([4.4, 5.5, 6.6])
    sf2->ArrayFloat.add([10.1, 11.2, 12.3])
    let symDiff = ArrayFloat.symmetricDifference(sf, sf2)
    expect(symDiff->ArrayFloat.values->Iterator.toArray)->toEqual([
      [1.1, 2.2, 3.3],
      [7.7, 8.8, 9.9],
      [10.1, 11.2, 12.3],
    ])
  })

  test("isSubsetOf", () => {
    let sf2 = ArrayFloat.make()
    sf2->ArrayFloat.add([1.1, 2.2, 3.3])
    sf2->ArrayFloat.add([4.4, 5.5, 6.6])
    sf2->ArrayFloat.add([7.7, 8.8, 9.9])
    expect(sf->ArrayFloat.isSubsetOf(sf2))->toBe(true)
  })

  test("isSupersetOf", () => {
    let sf2 = ArrayFloat.make()
    sf2->ArrayFloat.add([1.1, 2.2, 3.3])
    expect(sf->ArrayFloat.isSupersetOf(sf2))->toBe(true)
  })

  test("isDisjointFrom", () => {
    let sf2 = ArrayFloat.make()
    sf2->ArrayFloat.add([10.1, 11.2, 12.3])
    expect(sf->ArrayFloat.isDisjointFrom(sf2))->toBe(true)
  })

  test("isEmpty returns false for non-empty set", () => {
    expect(sf->ArrayFloat.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty set", () => {
    let sf2 = ArrayFloat.make()
    expect(sf2->ArrayFloat.isEmpty)->toBe(true)
  })

  test("toArray converts set to array", () => {
    let arr = sf->ArrayFloat.toArray
    expect(arr)->toEqual([[1.1, 2.2, 3.3], [4.4, 5.5, 6.6], [7.7, 8.8, 9.9]])
  })

  test("ignore discards the set", () => {
    expect(sf->ArrayFloat.ignore)->toBe()
  })
})

describe("SetTuple2IntString", () => {
  let stis = SetTuple2IntString.make()

  beforeEach(() => {
    stis->SetTuple2IntString.clear
    stis->SetTuple2IntString.add((1, "one"))
    stis->SetTuple2IntString.add((2, "two"))
  })

  test("clear all values", () => {
    stis->SetTuple2IntString.clear
    expect(stis->SetTuple2IntString.size)->toBe(0)
  })

  test("forEach", () => {
    let values = []
    stis->SetTuple2IntString.forEach(v => values->Array.push(v))
    expect(values)->toEqual([(1, "one"), (2, "two")])
  })

  test("has value", () => {
    expect(stis->SetTuple2IntString.has((1, "one")))->toBe(true)
  })

  test("delete value", () => {
    expect(stis->SetTuple2IntString.delete((1, "one")))->toBe(true)
  })

  test("fromArray", () => {
    let arr = [(1, "one"), (2, "two")]
    let stis = SetTuple2IntString.fromArray(arr)
    expect(stis->SetTuple2IntString.size)->toBe(2)
  })

  test("fromIterator", () => {
    let iter = [(1, "one"), (2, "two")]->Stdlib__Array_Ext.valuesIter
    let stis = SetTuple2IntString.fromIterator(iter)
    expect(stis->SetTuple2IntString.size)->toBe(2)
  })

  test("values", () => {
    let values = stis->SetTuple2IntString.values->Iterator.toArray
    expect(values)->toEqual([(1, "one"), (2, "two")])
  })

  test("difference", () => {
    let stis2 = SetTuple2IntString.make()
    stis2->SetTuple2IntString.add((2, "two"))
    let diff = SetTuple2IntString.difference(stis, stis2)
    expect(diff->SetTuple2IntString.values->Iterator.toArray)->toEqual([(1, "one")])
  })

  test("intersection", () => {
    let stis2 = SetTuple2IntString.make()
    stis2->SetTuple2IntString.add((2, "two"))
    let inter = SetTuple2IntString.intersection(stis, stis2)
    expect(inter->SetTuple2IntString.values->Iterator.toArray)->toEqual([(2, "two")])
  })

  test("union", () => {
    let stis2 = SetTuple2IntString.make()
    stis2->SetTuple2IntString.add((3, "three"))
    let union = SetTuple2IntString.union(stis, stis2)
    expect(union->SetTuple2IntString.values->Iterator.toArray)->toEqual([
      (1, "one"),
      (2, "two"),
      (3, "three"),
    ])
  })

  test("symmetricDifference", () => {
    let stis2 = SetTuple2IntString.make()
    stis2->SetTuple2IntString.add((2, "two"))
    stis2->SetTuple2IntString.add((3, "three"))
    let symDiff = SetTuple2IntString.symmetricDifference(stis, stis2)
    expect(symDiff->SetTuple2IntString.values->Iterator.toArray)->toEqual([
      (1, "one"),
      (3, "three"),
    ])
  })

  test("isSubsetOf", () => {
    let stis2 = SetTuple2IntString.make()
    stis2->SetTuple2IntString.add((1, "one"))
    stis2->SetTuple2IntString.add((2, "two"))
    expect(stis->SetTuple2IntString.isSubsetOf(stis2))->toBe(true)
  })

  test("isSupersetOf", () => {
    let stis2 = SetTuple2IntString.make()
    stis2->SetTuple2IntString.add((1, "one"))
    expect(stis->SetTuple2IntString.isSupersetOf(stis2))->toBe(true)
  })

  test("isDisjointFrom", () => {
    let stis2 = SetTuple2IntString.make()
    stis2->SetTuple2IntString.add((3, "three"))
    expect(stis->SetTuple2IntString.isDisjointFrom(stis2))->toBe(true)
  })

  test("isEmpty returns false for non-empty set", () => {
    expect(stis->SetTuple2IntString.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty set", () => {
    let stis2 = SetTuple2IntString.make()
    expect(stis2->SetTuple2IntString.isEmpty)->toBe(true)
  })

  test("toArray converts set to array", () => {
    let arr = stis->SetTuple2IntString.toArray
    expect(arr)->toEqual([(1, "one"), (2, "two")])
  })

  test("ignore discards the set", () => {
    expect(stis->SetTuple2IntString.ignore)->toBe()
  })
})

describe("SetTuple2FloatFloat", () => {
  let stff = SetTuple2FloatFloat.make()

  beforeEach(() => {
    stff->SetTuple2FloatFloat.clear
    stff->SetTuple2FloatFloat.add((1.1, 2.2))
    stff->SetTuple2FloatFloat.add((3.3, 4.4))
  })

  test("clear all values", () => {
    stff->SetTuple2FloatFloat.clear
    expect(stff->SetTuple2FloatFloat.size)->toBe(0)
  })

  test("forEach", () => {
    let values = []
    stff->SetTuple2FloatFloat.forEach(v => values->Array.push(v))
    expect(values)->toEqual([(1.1, 2.2), (3.3, 4.4)])
  })

  test("has value", () => {
    expect(stff->SetTuple2FloatFloat.has((1.1, 2.2)))->toBe(true)
  })

  test("delete value", () => {
    expect(stff->SetTuple2FloatFloat.delete((1.1, 2.2)))->toBe(true)
  })

  test("fromArray", () => {
    let arr = [(1.1, 2.2), (3.3, 4.4)]
    let stff = SetTuple2FloatFloat.fromArray(arr)
    expect(stff->SetTuple2FloatFloat.size)->toBe(2)
  })

  test("fromIterator", () => {
    let iter = [(1.1, 2.2), (3.3, 4.4)]->Stdlib__Array_Ext.valuesIter
    let stff = SetTuple2FloatFloat.fromIterator(iter)
    expect(stff->SetTuple2FloatFloat.size)->toBe(2)
  })

  test("values", () => {
    let values = stff->SetTuple2FloatFloat.values->Iterator.toArray
    expect(values)->toEqual([(1.1, 2.2), (3.3, 4.4)])
  })

  test("difference", () => {
    let stff2 = SetTuple2FloatFloat.make()
    stff2->SetTuple2FloatFloat.add((3.3, 4.4))
    let diff = SetTuple2FloatFloat.difference(stff, stff2)
    expect(diff->SetTuple2FloatFloat.values->Iterator.toArray)->toEqual([(1.1, 2.2)])
  })

  test("intersection", () => {
    let stff2 = SetTuple2FloatFloat.make()
    stff2->SetTuple2FloatFloat.add((3.3, 4.4))
    let inter = SetTuple2FloatFloat.intersection(stff, stff2)
    expect(inter->SetTuple2FloatFloat.values->Iterator.toArray)->toEqual([(3.3, 4.4)])
  })

  test("union", () => {
    let stff2 = SetTuple2FloatFloat.make()
    stff2->SetTuple2FloatFloat.add((5.5, 6.6))
    let union = SetTuple2FloatFloat.union(stff, stff2)
    expect(union->SetTuple2FloatFloat.values->Iterator.toArray)->toEqual([
      (1.1, 2.2),
      (3.3, 4.4),
      (5.5, 6.6),
    ])
  })

  test("symmetricDifference", () => {
    let stff2 = SetTuple2FloatFloat.make()
    stff2->SetTuple2FloatFloat.add((3.3, 4.4))
    stff2->SetTuple2FloatFloat.add((5.5, 6.6))
    let symDiff = SetTuple2FloatFloat.symmetricDifference(stff, stff2)
    expect(symDiff->SetTuple2FloatFloat.values->Iterator.toArray)->toEqual([(1.1, 2.2), (5.5, 6.6)])
  })

  test("isSubsetOf", () => {
    let stff2 = SetTuple2FloatFloat.make()
    stff2->SetTuple2FloatFloat.add((1.1, 2.2))
    stff2->SetTuple2FloatFloat.add((3.3, 4.4))
    expect(stff->SetTuple2FloatFloat.isSubsetOf(stff2))->toBe(true)
  })

  test("isSupersetOf", () => {
    let stff2 = SetTuple2FloatFloat.make()
    stff2->SetTuple2FloatFloat.add((1.1, 2.2))
    expect(stff->SetTuple2FloatFloat.isSupersetOf(stff2))->toBe(true)
  })

  test("isDisjointFrom", () => {
    let stff2 = SetTuple2FloatFloat.make()
    stff2->SetTuple2FloatFloat.add((5.5, 6.6))
    expect(stff->SetTuple2FloatFloat.isDisjointFrom(stff2))->toBe(true)
  })

  test("isEmpty returns false for non-empty set", () => {
    expect(stff->SetTuple2FloatFloat.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty set", () => {
    let stff2 = SetTuple2FloatFloat.make()
    expect(stff2->SetTuple2FloatFloat.isEmpty)->toBe(true)
  })

  test("toArray converts set to array", () => {
    let arr = stff->SetTuple2FloatFloat.toArray
    expect(arr)->toEqual([(1.1, 2.2), (3.3, 4.4)])
  })

  test("ignore discards the set", () => {
    expect(stff->SetTuple2FloatFloat.ignore)->toBe()
  })
})

describe("SetTuple3IntIntInt", () => {
  let stiii = SetTuple3IntIntInt.make()

  beforeEach(() => {
    stiii->SetTuple3IntIntInt.clear
    stiii->SetTuple3IntIntInt.add((1, 2, 3))
    stiii->SetTuple3IntIntInt.add((4, 5, 6))
  })

  test("clear all values", () => {
    stiii->SetTuple3IntIntInt.clear
    expect(stiii->SetTuple3IntIntInt.size)->toBe(0)
  })

  test("forEach", () => {
    let values = []
    stiii->SetTuple3IntIntInt.forEach(v => values->Array.push(v))
    expect(values)->toEqual([(1, 2, 3), (4, 5, 6)])
  })

  test("has value", () => {
    expect(stiii->SetTuple3IntIntInt.has((1, 2, 3)))->toBe(true)
  })

  test("delete value", () => {
    expect(stiii->SetTuple3IntIntInt.delete((1, 2, 3)))->toBe(true)
  })

  test("fromArray", () => {
    let arr = [(1, 2, 3), (4, 5, 6)]
    let stiii = SetTuple3IntIntInt.fromArray(arr)
    expect(stiii->SetTuple3IntIntInt.size)->toBe(2)
  })

  test("fromIterator", () => {
    let iter = [(1, 2, 3), (4, 5, 6)]->Stdlib__Array_Ext.valuesIter
    let stiii = SetTuple3IntIntInt.fromIterator(iter)
    expect(stiii->SetTuple3IntIntInt.size)->toBe(2)
  })

  test("values", () => {
    let values = stiii->SetTuple3IntIntInt.values->Iterator.toArray
    expect(values)->toEqual([(1, 2, 3), (4, 5, 6)])
  })

  test("difference", () => {
    let stiii2 = SetTuple3IntIntInt.make()
    stiii2->SetTuple3IntIntInt.add((4, 5, 6))
    let diff = SetTuple3IntIntInt.difference(stiii, stiii2)
    expect(diff->SetTuple3IntIntInt.values->Iterator.toArray)->toEqual([(1, 2, 3)])
  })

  test("intersection", () => {
    let stiii2 = SetTuple3IntIntInt.make()
    stiii2->SetTuple3IntIntInt.add((4, 5, 6))
    let inter = SetTuple3IntIntInt.intersection(stiii, stiii2)
    expect(inter->SetTuple3IntIntInt.values->Iterator.toArray)->toEqual([(4, 5, 6)])
  })

  test("union", () => {
    let stiii2 = SetTuple3IntIntInt.make()
    stiii2->SetTuple3IntIntInt.add((7, 8, 9))
    let union = SetTuple3IntIntInt.union(stiii, stiii2)
    expect(union->SetTuple3IntIntInt.values->Iterator.toArray)->toEqual([
      (1, 2, 3),
      (4, 5, 6),
      (7, 8, 9),
    ])
  })

  test("symmetricDifference", () => {
    let stiii2 = SetTuple3IntIntInt.make()
    stiii2->SetTuple3IntIntInt.add((4, 5, 6))
    stiii2->SetTuple3IntIntInt.add((7, 8, 9))
    let symDiff = SetTuple3IntIntInt.symmetricDifference(stiii, stiii2)
    expect(symDiff->SetTuple3IntIntInt.values->Iterator.toArray)->toEqual([(1, 2, 3), (7, 8, 9)])
  })

  test("isSubsetOf", () => {
    let stiii2 = SetTuple3IntIntInt.make()
    stiii2->SetTuple3IntIntInt.add((1, 2, 3))
    stiii2->SetTuple3IntIntInt.add((4, 5, 6))
    expect(stiii->SetTuple3IntIntInt.isSubsetOf(stiii2))->toBe(true)
  })

  test("isSupersetOf", () => {
    let stiii2 = SetTuple3IntIntInt.make()
    stiii2->SetTuple3IntIntInt.add((1, 2, 3))
    expect(stiii->SetTuple3IntIntInt.isSupersetOf(stiii2))->toBe(true)
  })

  test("isDisjointFrom", () => {
    let stiii2 = SetTuple3IntIntInt.make()
    stiii2->SetTuple3IntIntInt.add((7, 8, 9))
    expect(stiii->SetTuple3IntIntInt.isDisjointFrom(stiii2))->toBe(true)
  })

  test("isEmpty returns false for non-empty set", () => {
    expect(stiii->SetTuple3IntIntInt.isEmpty)->toBe(false)
  })

  test("isEmpty returns true for empty set", () => {
    let stiii2 = SetTuple3IntIntInt.make()
    expect(stiii2->SetTuple3IntIntInt.isEmpty)->toBe(true)
  })

  test("toArray converts set to array", () => {
    let arr = stiii->SetTuple3IntIntInt.toArray
    expect(arr)->toEqual([(1, 2, 3), (4, 5, 6)])
  })

  test("ignore discards the set", () => {
    expect(stiii->SetTuple3IntIntInt.ignore)->toBe()
  })
})
