// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Jest from "@glennsl/rescript-jest/src/jest.mjs";
import * as Stdlib__String from "../src/Stdlib__String.mjs";
import * as Stdlib__Tuple4 from "../src/Stdlib__Tuple4.mjs";

Jest.test("make", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.make(3, 4, 5, 6)), [
                    3,
                    4,
                    5,
                    6
                  ]);
      }));

Jest.test("first", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.first([
                            3,
                            4,
                            5,
                            6
                          ])), 3);
      }));

Jest.test("second", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.second([
                            3,
                            4,
                            5,
                            6
                          ])), 4);
      }));

Jest.test("third", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.third([
                            3,
                            4,
                            5,
                            6
                          ])), 5);
      }));

Jest.test("forth", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.forth([
                            3,
                            4,
                            5,
                            6
                          ])), 6);
      }));

Jest.test("initial", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.initial([
                            3,
                            4,
                            5,
                            6
                          ])), [
                    3,
                    4
                  ]);
      }));

Jest.test("tail", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.tail([
                            3,
                            4,
                            5,
                            6
                          ])), [
                    5,
                    6
                  ]);
      }));

Jest.test("mapFirst", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.mapFirst([
                            "stressed",
                            16,
                            false,
                            64
                          ], Stdlib__String.reverse)), [
                    "desserts",
                    16,
                    false,
                    64
                  ]);
      }));

Jest.test("mapSecond", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.mapSecond([
                            "stressed",
                            16,
                            false,
                            64
                          ], (function (prim) {
                              return Math.sqrt(prim);
                            }))), [
                    "stressed",
                    4,
                    false,
                    64
                  ]);
      }));

Jest.test("mapThird", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.mapThird([
                            "stressed",
                            16,
                            false,
                            64
                          ], (function (prim) {
                              return !prim;
                            }))), [
                    "stressed",
                    16,
                    true,
                    64
                  ]);
      }));

Jest.test("mapEach", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.mapEach([
                            "stressed",
                            16,
                            false,
                            64
                          ], Stdlib__String.reverse, (function (prim) {
                              return Math.sqrt(prim);
                            }), (function (prim) {
                              return !prim;
                            }), (function (prim) {
                              return Math.sqrt(prim);
                            }))), [
                    "desserts",
                    4,
                    true,
                    8
                  ]);
      }));

Jest.test("mapAll", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.mapAll([
                            "was",
                            "stressed",
                            "now",
                            "but"
                          ], Stdlib__String.reverse)), [
                    "saw",
                    "desserts",
                    "won",
                    "tub"
                  ]);
      }));

Jest.test("rotateLeft", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.rotateLeft([
                            3,
                            4,
                            5,
                            6
                          ])), [
                    4,
                    5,
                    6,
                    3
                  ]);
      }));

Jest.test("rotateRight", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.rotateRight([
                            3,
                            4,
                            5,
                            6
                          ])), [
                    6,
                    3,
                    4,
                    5
                  ]);
      }));

Jest.test("toArray", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.toArray([
                            3,
                            4,
                            5,
                            6
                          ])), [
                    3,
                    4,
                    5,
                    6
                  ]);
      }));

Jest.test("toList", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Tuple4.toList([
                            3,
                            4,
                            5,
                            6
                          ])), {
                    hd: 3,
                    tl: {
                      hd: 4,
                      tl: {
                        hd: 5,
                        tl: {
                          hd: 6,
                          tl: /* [] */0
                        }
                      }
                    }
                  });
      }));

export {
  
}
/*  Not a pure module */
