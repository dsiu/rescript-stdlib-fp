// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Jest from "@glennsl/rescript-jest/src/jest.mjs";
import * as Pervasives from "rescript/lib/es6/Pervasives.js";
import * as Stdlib__Float from "../src/Stdlib__Float.mjs";

Jest.test("zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.zero), 0));

Jest.test("one", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.one), 1));

Jest.test("nan", () => Jest.Expect.toEqual(Jest.Expect.expect(Number.NaN === Number.NaN), false));

Jest.test("infinity", () => Jest.Expect.toEqual(Jest.Expect.expect(Pervasives.infinity * 2 === Pervasives.infinity), true));

Jest.test("negativeInfinity", () => Jest.Expect.toEqual(Jest.Expect.expect(Number.NEGATIVE_INFINITY * 2 === Number.NEGATIVE_INFINITY), true));

Jest.describe("equals", () => Jest.test("zero", () => Jest.Expect.toEqual(Jest.Expect.expect(true), true)));

Jest.describe("fromString", () => {
  Jest.test("NaN", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.fromString("NaN")), undefined));
  Jest.test("nan", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.fromString("nan")), undefined));
  Jest.test("Infinity", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.fromString("Infinity")), Pervasives.infinity));
  Jest.test("infinity", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.fromString("infinity")), undefined));
  Jest.test("infinity", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.fromString("infinity")), undefined));
  Jest.test("55", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.fromString("55")), 55));
  Jest.test("-100", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.fromString("-100")), -100));
  Jest.test("not number", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.fromString("not number")), undefined));
});

Jest.describe("add", () => Jest.test("add", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.add(3.14, 3.14)), 6.28)));

Jest.describe("subtract", () => Jest.test("subtract", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.subtract(4, 3)), 1)));

Jest.describe("multiply", () => Jest.test("multiply", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.multiply(2, 7)), 14)));

Jest.describe("divide", () => {
  Jest.test("divide", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.divide(3.14, 2)), 1.57));
  Jest.test("divide by zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.divide(3.14, 0) === Pervasives.infinity), true));
  Jest.test("divide by negative zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.divide(3.14, -0) === Number.NEGATIVE_INFINITY), true));
});

Jest.describe("power", () => {
  Jest.test("power", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.pow(7, 3)), 343));
  Jest.test("0 base", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.pow(0, 3)), 0));
  Jest.test("0 exponent", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.pow(7, 0)), 1));
});

Jest.describe("negate", () => {
  Jest.test("positive number", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.negate(8)), -8));
  Jest.test("negative number", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.negate(-7)), 7));
  Jest.test("zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.negate(0)), -0));
});

Jest.describe("absolute", () => {
  Jest.test("positive number", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.abs(8)), 8));
  Jest.test("negative number", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.abs(-7)), 7));
  Jest.test("zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.abs(0)), 0));
});

Jest.describe("maximum", () => {
  Jest.test("positive numbers", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.max(7, 9)), 9));
  Jest.test("negative numbers", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.max(-4, -1)), -1));
  Jest.test("nan", () => Jest.Expect.toEqual(Jest.Expect.expect(isNaN(Math.max(7, Number.NaN))), true));
  Jest.test("infinity", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.max(7, Pervasives.infinity) === Pervasives.infinity), true));
  Jest.test("negativeInfinity", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.max(7, Number.NEGATIVE_INFINITY)), 7));
});

Jest.describe("minimum", () => {
  Jest.test("positive numbers", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.min(7, 9)), 7));
  Jest.test("negative numbers", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.min(-4, -1)), -4));
  Jest.test("nan", () => Jest.Expect.toEqual(Jest.Expect.expect(isNaN(Math.min(7, Number.NaN))), true));
  Jest.test("infinity", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.min(7, Pervasives.infinity)), 7));
  Jest.test("negativeInfinity", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.min(7, Number.NEGATIVE_INFINITY) === Number.NEGATIVE_INFINITY), true));
});

Jest.describe("clamp", () => {
  Jest.test("in range", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.clamp(0, 8, 5)), 5));
  Jest.test("above range", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.clamp(0, 8, 9)), 8));
  Jest.test("below range", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.clamp(2, 8, 1)), 2));
  Jest.test("above negative range", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.clamp(-10, -5, 5)), -5));
  Jest.test("below negative range", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.clamp(-10, -5, -15)), -10));
  Jest.test("nan value", () => Jest.Expect.toEqual(Jest.Expect.expect(isNaN(Stdlib__Float.clamp(2, 8, Number.NaN))), true));
});

Jest.describe("squareRoot", () => {
  Jest.test("whole numbers", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.sqrt(4)), 2));
  Jest.test("decimal numbers", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.sqrt(20.25)), 4.5));
  Jest.test("negative number", () => Jest.Expect.toEqual(Jest.Expect.expect(isNaN(Math.sqrt(-1))), true));
});

Jest.describe("log", () => {
  Jest.test("base 10", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.log(100, 10)), 2));
  Jest.test("base 2", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.log(256, 2)), 8));
  Jest.test("of zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.log(0, 10) === Number.NEGATIVE_INFINITY), true));
});

Jest.describe("isNaN", () => {
  Jest.test("nan", () => Jest.Expect.toEqual(Jest.Expect.expect(isNaN(Number.NaN)), true));
  Jest.test("non-nan", () => Jest.Expect.toEqual(Jest.Expect.expect(isNaN(91.4)), false));
});

Jest.describe("isFinite", () => {
  Jest.test("infinity", () => Jest.Expect.toEqual(Jest.Expect.expect(isFinite(Pervasives.infinity)), false));
  Jest.test("negative infinity", () => Jest.Expect.toEqual(Jest.Expect.expect(isFinite(Number.NEGATIVE_INFINITY)), false));
  Jest.test("NaN", () => Jest.Expect.toEqual(Jest.Expect.expect(isFinite(Number.NaN)), false));
  Jest.testAll("regular numbers", {
    hd: -5,
    tl: {
      hd: -0.314,
      tl: {
        hd: 0,
        tl: {
          hd: 3.14,
          tl: /* [] */0
        }
      }
    }
  }, n => Jest.Expect.toEqual(Jest.Expect.expect(isFinite(n)), true));
});

Jest.describe("isInfinite", () => {
  Jest.test("infinity", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.isInfinite(Pervasives.infinity)), true));
  Jest.test("negative infinity", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.isInfinite(Number.NEGATIVE_INFINITY)), true));
  Jest.test("NaN", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.isInfinite(Number.NaN)), false));
  Jest.testAll("regular numbers", {
    hd: -5,
    tl: {
      hd: -0.314,
      tl: {
        hd: 0,
        tl: {
          hd: 3.14,
          tl: /* [] */0
        }
      }
    }
  }, n => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.isInfinite(n)), false));
});

Jest.describe("inRange", () => {
  Jest.test("in range", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.inRange(3, 2, 4)), true));
  Jest.test("above range", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.inRange(8, 2, 4)), false));
  Jest.test("below range", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.inRange(1, 2, 4)), false));
  Jest.test("equal to ~upper", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.inRange(2, 1, 2)), false));
  Jest.test("negative range", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.inRange(-6.6, -7.9, -5.2)), true));
  Jest.test("nan upper bound", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.inRange(-6.6, -7.9, Number.NaN)), false));
  Jest.test("nan lower bound", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.inRange(-6.6, Number.NaN, 0)), false));
  Jest.test("nan value", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.inRange(Number.NaN, 2, 8)), false));
  Jest.test("invalid arguments", () => Jest.Expect.toThrow(Jest.Expect.expect(() => Stdlib__Float.inRange(3, 7, 1))));
});

Jest.test("hypotenuse", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.hypot(3, 4)), 5));

Jest.test("degrees", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.degrees(180)), Math.PI));

Jest.test("radians", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.radians(Math.PI)), Math.PI));

Jest.test("turns", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.turns(1)), 2 * Math.PI));

Jest.describe("ofPolar", () => {
  let match = Stdlib__Float.fromPolar([
    Math.sqrt(2),
    Stdlib__Float.degrees(45)
  ]);
  let y = match[1];
  let x = match[0];
  Jest.test("x", () => Jest.Expect.toBeCloseTo(Jest.Expect.expect(x), 1));
  Jest.test("y", () => Jest.Expect.toEqual(Jest.Expect.expect(y), 1));
});

Jest.describe("toPolar", () => {
  Jest.test("toPolar", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.toPolar([
    3.0,
    4.0
  ])), [
    5.0,
    0.9272952180016122
  ]));
  let match = Stdlib__Float.toPolar([
    5.0,
    12.0
  ]);
  Jest.testAll("toPolar", {
    hd: [
      match[0],
      13.0
    ],
    tl: {
      hd: [
        match[1],
        1.17601
      ],
      tl: /* [] */0
    }
  }, param => Jest.Expect.toBeCloseTo(Jest.Expect.expect(param[0]), param[1]));
});

Jest.describe("cos", () => {
  Jest.test("cos", () => Jest.Expect.toBeCloseTo(Jest.Expect.expect(Math.cos(Stdlib__Float.degrees(60))), 0.5));
  Jest.test("cos", () => Jest.Expect.toBeCloseTo(Jest.Expect.expect(Math.cos(Stdlib__Float.radians(Math.PI / 3))), 0.5));
});

Jest.describe("acos", () => Jest.test("1 / 2", () => Jest.Expect.toBeCloseTo(Jest.Expect.expect(Math.acos(1 / 2)), 1.0472)));

Jest.describe("sin", () => {
  Jest.test("30 degrees", () => Jest.Expect.toBeCloseTo(Jest.Expect.expect(Math.sin(Stdlib__Float.degrees(30))), 0.5));
  Jest.test("pi / 6", () => Jest.Expect.toBeCloseTo(Jest.Expect.expect(Math.sin(Stdlib__Float.radians(Math.PI / 6))), 0.5));
});

Jest.describe("asin", () => Jest.test("asin", () => Jest.Expect.toBeCloseTo(Jest.Expect.expect(Math.asin(1 / 2)), 0.523599)));

Jest.describe("tan", () => {
  Jest.test("45 degrees", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.tan(Stdlib__Float.degrees(45))), 0.9999999999999999));
  Jest.test("pi / 4", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.tan(Stdlib__Float.radians(Math.PI / 4))), 0.9999999999999999));
  Jest.test("0", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.tan(0)), 0));
});

Jest.describe("atan", () => {
  Jest.test("0", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.atan(0)), 0));
  Jest.test("1 / 1", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.atan(1 / 1)), 0.7853981633974483));
  Jest.test("1 / -1", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.atan(1 / -1)), -0.7853981633974483));
  Jest.test("-1 / -1", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.atan(-1 / -1)), 0.7853981633974483));
  Jest.test("-1 / -1", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.atan(-1 / 1)), -0.7853981633974483));
});

Jest.describe("atan2", () => {
  Jest.test("0", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.atan2(0, 0)), 0));
  Jest.test("(1, 1)", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.atan2(1, 1)), 0.7853981633974483));
  Jest.test("(-1, 1)", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.atan2(1, -1)), 2.3561944901923449));
  Jest.test("(-1 -1)", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.atan2(-1, -1)), -2.3561944901923449));
  Jest.test("(1, -1)", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.atan2(-1, 1)), -0.7853981633974483));
});

Jest.describe("round", () => {
  Jest.test("`Zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Zero", 1.2)), 1));
  Jest.test("`Zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Zero", 1.5)), 1));
  Jest.test("`Zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Zero", 1.8)), 1));
  Jest.test("`Zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Zero", -1.2)), -1));
  Jest.test("`Zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Zero", -1.5)), -1));
  Jest.test("`Zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Zero", -1.8)), -1));
  Jest.test("`AwayFromZero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("AwayFromZero", 1.2)), 2));
  Jest.test("`AwayFromZero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("AwayFromZero", 1.5)), 2));
  Jest.test("`AwayFromZero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("AwayFromZero", 1.8)), 2));
  Jest.test("`AwayFromZero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("AwayFromZero", -1.2)), -2));
  Jest.test("`AwayFromZero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("AwayFromZero", -1.5)), -2));
  Jest.test("`AwayFromZero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("AwayFromZero", -1.8)), -2));
  Jest.test("`Up", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Up", 1.2)), 2));
  Jest.test("`Up", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Up", 1.5)), 2));
  Jest.test("`Up", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Up", 1.8)), 2));
  Jest.test("`Up", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Up", -1.2)), -1));
  Jest.test("`Up", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Up", -1.5)), -1));
  Jest.test("`Up", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Up", -1.8)), -1));
  Jest.test("`Down", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Down", 1.2)), 1));
  Jest.test("`Down", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Down", 1.5)), 1));
  Jest.test("`Down", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Down", 1.8)), 1));
  Jest.test("`Down", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Down", -1.2)), -2));
  Jest.test("`Down", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Down", -1.5)), -2));
  Jest.test("`Down", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round("Down", -1.8)), -2));
  Jest.test("`Closest `Zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Zero"
  }, 1.2)), 1));
  Jest.test("`Closest `Zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Zero"
  }, 1.5)), 1));
  Jest.test("`Closest `Zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Zero"
  }, 1.8)), 2));
  Jest.test("`Closest `Zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Zero"
  }, -1.2)), -1));
  Jest.test("`Closest `Zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Zero"
  }, -1.5)), -1));
  Jest.test("`Closest `Zero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Zero"
  }, -1.8)), -2));
  Jest.test("`Closest `AwayFromZero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "AwayFromZero"
  }, 1.2)), 1));
  Jest.test("`Closest `AwayFromZero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "AwayFromZero"
  }, 1.5)), 2));
  Jest.test("`Closest `AwayFromZero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "AwayFromZero"
  }, 1.8)), 2));
  Jest.test("`Closest `AwayFromZero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "AwayFromZero"
  }, -1.2)), -1));
  Jest.test("`Closest `AwayFromZero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "AwayFromZero"
  }, -1.5)), -2));
  Jest.test("`Closest `AwayFromZero", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "AwayFromZero"
  }, -1.8)), -2));
  Jest.test("`Closest `Up", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Up"
  }, 1.2)), 1));
  Jest.test("`Closest `Up", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Up"
  }, 1.5)), 2));
  Jest.test("`Closest `Up", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Up"
  }, 1.8)), 2));
  Jest.test("`Closest `Up", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Up"
  }, -1.2)), -1));
  Jest.test("`Closest `Up", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Up"
  }, -1.5)), -1));
  Jest.test("`Closest `Up", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Up"
  }, -1.8)), -2));
  Jest.test("`Closest `Down", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Down"
  }, 1.2)), 1));
  Jest.test("`Closest `Down", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Down"
  }, 1.5)), 1));
  Jest.test("`Closest `Down", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Down"
  }, 1.8)), 2));
  Jest.test("`Closest `Down", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Down"
  }, -1.2)), -1));
  Jest.test("`Closest `Down", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Down"
  }, -1.5)), -2));
  Jest.test("`Closest `Down", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "Down"
  }, -1.8)), -2));
  Jest.test("`Closest `ToEven", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "ToEven"
  }, 1.2)), 1));
  Jest.test("`Closest `ToEven", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "ToEven"
  }, 1.5)), 2));
  Jest.test("`Closest `ToEven", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "ToEven"
  }, 1.8)), 2));
  Jest.test("`Closest `ToEven", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "ToEven"
  }, 2.2)), 2));
  Jest.test("`Closest `ToEven", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "ToEven"
  }, 2.5)), 2));
  Jest.test("`Closest `ToEven", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "ToEven"
  }, 2.8)), 3));
  Jest.test("`Closest `ToEven", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "ToEven"
  }, -1.2)), -1));
  Jest.test("`Closest `ToEven", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "ToEven"
  }, -1.5)), -2));
  Jest.test("`Closest `ToEven", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "ToEven"
  }, -1.8)), -2));
  Jest.test("`Closest `ToEven", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "ToEven"
  }, -2.2)), -2));
  Jest.test("`Closest `ToEven", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "ToEven"
  }, -2.5)), -2));
  Jest.test("`Closest `ToEven", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.round({
    NAME: "Closest",
    VAL: "ToEven"
  }, -2.8)), -3));
});

Jest.describe("floor", () => {
  Jest.test("floor", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.floor(1.2)), 1));
  Jest.test("floor", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.floor(1.5)), 1));
  Jest.test("floor", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.floor(1.8)), 1));
  Jest.test("floor", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.floor(-1.2)), -2));
  Jest.test("floor", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.floor(-1.5)), -2));
  Jest.test("floor", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.floor(-1.8)), -2));
});

Jest.describe("ceil", () => {
  Jest.test("ceil", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.ceil(1.2)), 2));
  Jest.test("ceil", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.ceil(1.5)), 2));
  Jest.test("ceil", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.ceil(1.8)), 2));
  Jest.test("ceil", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.ceil(-1.2)), -1));
  Jest.test("ceil", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.ceil(-1.5)), -1));
  Jest.test("ceil", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.ceil(-1.8)), -1));
});

Jest.describe("trunc", () => {
  Jest.test("trunc", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.trunc(1.2)), 1));
  Jest.test("trunc", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.trunc(1.5)), 1));
  Jest.test("trunc", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.trunc(1.8)), 1));
  Jest.test("trunc", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.trunc(-1.2)), -1));
  Jest.test("trunc", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.trunc(-1.5)), -1));
  Jest.test("trunc", () => Jest.Expect.toEqual(Jest.Expect.expect(Math.trunc(-1.8)), -1));
});

Jest.describe("fromInt", () => {
  Jest.test("5", () => Jest.Expect.toEqual(Jest.Expect.expect(5), 5.0));
  Jest.test("0", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.zero), 0.0));
  Jest.test("-7", () => Jest.Expect.toEqual(Jest.Expect.expect(-7), -7.0));
});

Jest.describe("toInt", () => {
  Jest.test("5.", () => Jest.Expect.toEqual(Jest.Expect.expect(5), 5));
  Jest.test("5.3", () => Jest.Expect.toEqual(Jest.Expect.expect(5), 5));
  Jest.test("0.", () => Jest.Expect.toEqual(Jest.Expect.expect(0), 0));
  Jest.test("-7.", () => Jest.Expect.toEqual(Jest.Expect.expect(-7), -7));
  Jest.test("nan", () => Jest.Expect.toEqual(Jest.Expect.expect(Number.NaN | 0), 0));
  Jest.test("infinity", () => Jest.Expect.toEqual(Jest.Expect.expect(Pervasives.infinity | 0), 0));
  Jest.test("negativeInfinity", () => Jest.Expect.toEqual(Jest.Expect.expect(Number.NEGATIVE_INFINITY | 0), 0));
});

Jest.describe("isInteger", () => {
  Jest.test("true", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.isInteger(5.0)), true));
  Jest.test("false", () => Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Float.isInteger(Math.PI)), false));
});

/*  Not a pure module */
