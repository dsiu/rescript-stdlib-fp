open Jest
open Expect

module ArrayInt = Stdlib__Set_Ext.Key.Array.Int
module ArrayString = Stdlib__Set_Ext.Key.Array.String
module ArrayFloat = Stdlib__Set_Ext.Key.Array.Float
module SetTuple2IntString = Stdlib__Set_Ext.Key.Tuple2.IntString
module SetTuple2FloatFloat = Stdlib__Set_Ext.Key.Tuple2.FloatFloat
module SetTuple3IntIntInt = Stdlib__Set_Ext.Key.Tuple3.IntIntInt

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
})
