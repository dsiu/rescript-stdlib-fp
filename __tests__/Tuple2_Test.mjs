// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Jest from "@glennsl/rescript-jest/src/jest.mjs";
import * as Stdlib__String from "../src/Stdlib__String.mjs";
import * as Stdlib__Tuple2 from "../src/Stdlib__Tuple2.mjs";

Jest.test("make", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple2.make(3, 4)), [
                    3,
                    4
                  ]);
      }));

Jest.test("first", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple2.first([
                            3,
                            4
                          ])), 3);
      }));

Jest.test("second", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple2.second([
                            3,
                            4
                          ])), 4);
      }));

Jest.test("mapFirst", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple2.mapFirst([
                            "stressed",
                            16
                          ], Stdlib__String.reverse)), [
                    "desserts",
                    16
                  ]);
      }));

Jest.test("mapSecond", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple2.mapSecond([
                            "stressed",
                            16
                          ], (function (prim) {
                              return Math.sqrt(prim);
                            }))), [
                    "stressed",
                    4
                  ]);
      }));

Jest.test("mapEach", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple2.mapEach([
                            "stressed",
                            16
                          ], Stdlib__String.reverse, (function (prim) {
                              return Math.sqrt(prim);
                            }))), [
                    "desserts",
                    4
                  ]);
      }));

Jest.test("mapAll", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple2.mapAll([
                            "was",
                            "stressed"
                          ], Stdlib__String.reverse)), [
                    "saw",
                    "desserts"
                  ]);
      }));

Jest.test("swap", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple2.swap([
                            3,
                            4
                          ])), [
                    4,
                    3
                  ]);
      }));

Jest.test("toArray", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple2.toArray([
                            3,
                            4
                          ])), [
                    3,
                    4
                  ]);
      }));

Jest.test("toList", (function (param) {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple2.toList([
                            3,
                            4
                          ])), {
                    hd: 3,
                    tl: {
                      hd: 4,
                      tl: /* [] */0
                    }
                  });
      }));

export {
  
}
/*  Not a pure module */