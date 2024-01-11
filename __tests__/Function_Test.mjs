// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Jest from "@glennsl/rescript-jest/src/jest.mjs";
import * as Caml_int32 from "rescript/lib/es6/caml_int32.js";
import * as Stdlib__Int from "../src/Stdlib__Int.mjs";
import * as Stdlib__Array from "../src/Stdlib__Array.mjs";
import * as Stdlib__Function from "../src/Stdlib__Function.mjs";

Jest.test("identity", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(1), 1);
      }));

Jest.test("ignore", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(), undefined);
      }));

Jest.test("constant", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Function.constant(1, 2)), 1);
      }));

Jest.test("sequence", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Function.sequence(1, 2)), 2);
      }));

Jest.test("flip", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Function.flip(Stdlib__Int.subtract, 2, 4)), 2);
      }));

Jest.test("negate", (function (param) {
        var greaterThanFour = function (n) {
          return n > 4;
        };
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Function.negate(greaterThanFour, 5)), false);
      }));

Jest.test("apply", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Function.apply((function (a) {
                              return a + 1 | 0;
                            }), 1)), 2);
      }));

function increment(x) {
  return x + 1 | 0;
}

function $$double(x) {
  return (x << 1);
}

Jest.test("compose", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Function.compose(increment, $$double, 1)), 4);
      }));

Jest.test("composeRight", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Function.composeRight(increment, $$double, 1)), 3);
      }));

Jest.test("tap", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Function.tap(Stdlib__Function.tap(Stdlib__Array.filter([
                                    1,
                                    3,
                                    2,
                                    5,
                                    4
                                  ], Stdlib__Int.isEven), (function (numbers) {
                                  numbers[1] = 0;
                                })), Stdlib__Array.reverse)), [
                    0,
                    2
                  ]);
      }));

Jest.test("curry", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Function.curry((function (param) {
                              return Caml_int32.div(param[0], param[1]);
                            }), 8, 4)), 2);
      }));

Jest.test("uncurry", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Function.uncurry(Caml_int32.div, [
                            8,
                            4
                          ])), 2);
      }));

Jest.test("curry3", (function (param) {
        var tupleAdder = function (param) {
          return (param[0] + param[1] | 0) + param[2] | 0;
        };
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Function.curry3(tupleAdder, 3, 4, 5)), 12);
      }));

Jest.test("uncurry3", (function (param) {
        var curriedAdder = function (a, b, c) {
          return (a + b | 0) + c | 0;
        };
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Function.uncurry3(curriedAdder, [
                            3,
                            4,
                            5
                          ])), 12);
      }));

export {
  increment ,
  $$double ,
}
/*  Not a pure module */