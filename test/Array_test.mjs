// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Zora from "@dusty-phillips/rescript-zora/src/Zora.mjs";
import * as Zora$1 from "zora";
import * as Garter_Array from "@greenlabs/garter/src/Garter_Array.mjs";
import * as Stdlib_Array from "../src/Stdlib_Array.mjs";
import * as Stdlib_Function from "../src/Stdlib_Function.mjs";

function testEqual(t, name, lhs, rhs) {
  t.test(name, (function (t) {
          t.equal(lhs, rhs, name);
          return Zora.done();
        }));
}

Zora$1.test("take", (function (t) {
        testEqual(t, "1", Stdlib_Array.take([
                  1,
                  2,
                  3,
                  4,
                  5
                ], -1), []);
        testEqual(t, "2", Stdlib_Array.take([
                  1,
                  2,
                  3,
                  4,
                  5
                ], 2), [
              1,
              2
            ]);
        testEqual(t, "3", Stdlib_Array.take([
                  1,
                  2,
                  3,
                  4,
                  5
                ], 7), [
              1,
              2,
              3,
              4,
              5
            ]);
      }));

Zora$1.test("drop", (function (t) {
        testEqual(t, "1", Stdlib_Array.drop([
                  1,
                  2,
                  3,
                  4,
                  5
                ], -1), [
              1,
              2,
              3,
              4,
              5
            ]);
        testEqual(t, "2", Stdlib_Array.drop([
                  1,
                  2,
                  3,
                  4,
                  5
                ], 2), [
              3,
              4,
              5
            ]);
        testEqual(t, "3", Stdlib_Array.drop([
                  1,
                  2,
                  3,
                  4,
                  5
                ], 7), []);
      }));

Zora$1.test("takeWhile", (function (t) {
        testEqual(t, "1", Stdlib_Array.takeWhile([
                  1,
                  2,
                  3,
                  4,
                  5
                ], (function (x) {
                    return x <= 2;
                  })), [
              1,
              2
            ]);
        testEqual(t, "2", Stdlib_Array.takeWhile([
                  1,
                  2,
                  3,
                  4,
                  5
                ], (function (extra) {
                    return Stdlib_Function.$$const(false, extra);
                  })), []);
      }));

Zora$1.test("dropWhile", (function (t) {
        testEqual(t, "1", Stdlib_Array.dropWhile([
                  1,
                  2,
                  3,
                  4,
                  5
                ], (function (x) {
                    return x <= 2;
                  })), [
              3,
              4,
              5
            ]);
        testEqual(t, "2", Stdlib_Array.dropWhile([
                  1,
                  2,
                  3,
                  4,
                  5
                ], (function (extra) {
                    return Stdlib_Function.$$const(true, extra);
                  })), []);
      }));

Zora$1.test("keepSome", (function (t) {
        testEqual(t, "1", Stdlib_Array.keepSome([
                  1,
                  undefined,
                  3
                ]), [
              1,
              3
            ]);
      }));

Zora$1.test("intersperse", (function (t) {
        testEqual(t, "1", Stdlib_Array.intersperse([], 0), []);
        testEqual(t, "2", Stdlib_Array.intersperse([1], 0), [1]);
        testEqual(t, "3", Stdlib_Array.intersperse([
                  1,
                  2
                ], 0), [
              1,
              0,
              2
            ]);
        testEqual(t, "4", Stdlib_Array.intersperse([
                  1,
                  2,
                  3
                ], 0), [
              1,
              0,
              2,
              0,
              3
            ]);
      }));

Zora$1.test("joinWith", (function (t) {
        testEqual(t, "", Garter_Array.$$String.joinWith([], ","), "");
        testEqual(t, "", Garter_Array.$$String.joinWith(["a"], ","), "a");
        testEqual(t, "", Garter_Array.$$String.joinWith([
                  "a",
                  "b",
                  "c"
                ], ","), "a,b,c");
      }));

var $$String = {};

export {
  testEqual ,
  $$String ,
}
/*  Not a pure module */
