// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Jest from "@glennsl/rescript-jest/src/jest.mjs";
import * as Stdlib__Int from "../src/Stdlib__Int.mjs";
import * as Stdlib__List from "../src/Stdlib__List.mjs";
import * as Primitive_int from "rescript/lib/es6/Primitive_int.js";
import * as Stdlib__Option from "../src/Stdlib__Option.mjs";
import * as Primitive_option from "rescript/lib/es6/Primitive_option.js";

Jest.describe("unwrapUnsafe", () => {
  Jest.test("returns the wrapped value for a Some", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.unwrapUnsafe(1)), 1));
  Jest.test("raises for a None", () => Jest.Expect.toThrow(Jest.Expect.expect(() => {
    Stdlib__Option.unwrapUnsafe(undefined);
  })));
});

Jest.describe("and_", () => {
  Jest.test("returns second argument", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.and_(1, 15)), 15));
  Jest.test("returns none", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.and_(undefined, 15)), undefined));
  Jest.test("returns none", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.and_(1, undefined)), undefined));
  Jest.test("returns none", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.and_(undefined, undefined)), undefined));
});

Jest.describe("or_", () => {
  Jest.test("returns first argument", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.or_(1, 15)), 1));
  Jest.test("returns second argument some", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.or_(undefined, 15)), 15));
  Jest.test("returns first argument some", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.or_(1, undefined)), 1));
  Jest.test("returns none", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.or_(undefined, undefined)), undefined));
});

Jest.describe("both", () => {
  Jest.test("returns both as pair", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.both(3004, "Ant")), [
    3004,
    "Ant"
  ]));
  Jest.test("returns none", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.both(undefined, "Ant")), undefined));
  Jest.test("returns none", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.both(3004, undefined)), undefined));
  Jest.test("returns none", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.both(undefined, undefined)), undefined));
});

Jest.describe("flatten", () => {
  Jest.test("returns option layers as single option layer", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.flatten(4)), 4));
  Jest.test("returns none", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.flatten(Primitive_option.some(undefined))), undefined));
  Jest.test("returns none", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.flatten(undefined)), undefined));
});

Jest.describe("map", () => {
  Jest.test("returns transformed value from inside option arg", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.map(9, x => Math.imul(x, x))), 81));
  Jest.test("returns transformed value from inside option arg", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.map(9, __x => __x.toString())), "9"));
  Jest.test("returns none", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.map(undefined, x => Math.imul(x, x))), undefined));
});

Jest.describe("map2", () => {
  Jest.test("returns transformed value from two option arg", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.map2(3, 4, Stdlib__Int.add)), 7));
  Jest.test("returns none", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.map2(3, undefined, Stdlib__Int.add)), undefined));
  Jest.test("returns none", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.map2(undefined, 4, Stdlib__Int.add)), undefined));
});

Jest.describe("andThen", () => {
  Jest.test("returns result of callback", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.andThen({
    hd: 1,
    tl: {
      hd: 2,
      tl: {
        hd: 3,
        tl: /* [] */0
      }
    }
  }, Stdlib__List.head)), 1));
  Jest.test("returns none", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.andThen(/* [] */0, Stdlib__List.head)), undefined));
});

Jest.describe("unwrap", () => {
  Jest.test("returns unwrapped [option('a)]", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.unwrap(42, 99)), 42));
  Jest.test("returns default", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.unwrap(undefined, 99)), 99));
});

Jest.describe("isSome", () => {
  Jest.test("returns true if is a Some", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.isSome(3004)), true));
  Jest.test("returns false if is a None", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.isSome(undefined)), false));
});

Jest.describe("isNone", () => {
  Jest.test("returns false if is a Some", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.isNone(3004)), false));
  Jest.test("returns true if is a None", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.isNone(undefined)), true));
});

Jest.describe("toArray", () => {
  Jest.test("returns option as array", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.toArray(3004)), [3004]));
  Jest.test("returns empty array if None", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.toArray(undefined)), []));
});

Jest.describe("toList", () => {
  Jest.test("returns option as list", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.toList(3004)), {
    hd: 3004,
    tl: /* [] */0
  }));
  Jest.test("returns empty list if None", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.toList(undefined)), /* [] */0));
});

Jest.describe("equal", () => {
  Jest.test("returns bool true if options are equal", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.equal(1, 1, (prim0, prim1) => prim0 === prim1)), true));
  Jest.test("returns bool true if options are equal", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.equal(1, 3, (prim0, prim1) => prim0 === prim1)), false));
  Jest.test("returns bool true if options are equal", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.equal(1, undefined, (prim0, prim1) => prim0 === prim1)), false));
  Jest.test("returns bool true if options are equal", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.equal(undefined, undefined, (prim0, prim1) => prim0 === prim1)), true));
});

Jest.describe("compare", () => {
  Jest.test("returns comparative value -1, 0, or 1", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.compare(1, 3, Primitive_int.compare)), -1));
  Jest.test("returns comparative value -1, 0, or 1", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.compare(1, undefined, Primitive_int.compare)), 1));
  Jest.test("returns comparative value -1, 0, or 1", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.compare(undefined, undefined, Primitive_int.compare)), 0));
});

/*  Not a pure module */
