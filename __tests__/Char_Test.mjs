// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Jest from "@glennsl/rescript-jest/src/jest.mjs";
import * as Stdlib__Char from "../src/Stdlib__Char.mjs";
import * as Stdlib__Option from "../src/Stdlib__Option.mjs";

Jest.test("toCode", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.toCode(/* 'a' */97)), 97);
      }));

Jest.describe("fromCode", (function () {
        Jest.test("valid ASCII codes return the corresponding character", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.fromCode(97)), /* 'a' */97);
              }));
        Jest.test("negative integers return None", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.fromCode(-1)), undefined);
              }));
        Jest.test("integers greater than 255 return None", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.fromCode(256)), undefined);
              }));
      }));

Jest.test("toString", (function () {
        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.toString(/* 'a' */97)), "a");
      }));

Jest.describe("fromString", (function () {
        Jest.test("one-length string return Some", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.fromString("a")), /* 'a' */97);
              }));
        Jest.test("multi character strings return None", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.fromString("abc")), undefined);
              }));
        Jest.test("zero length strings return None", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.fromString("")), undefined);
              }));
      }));

Jest.describe("toLowercase", (function () {
        Jest.test("converts uppercase ASCII characters to lowercase", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.toLowercase(/* 'A' */65)), /* 'a' */97);
              }));
        Jest.test("perserves lowercase characters", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.toLowercase(/* 'a' */97)), /* 'a' */97);
              }));
        Jest.test("perserves non-alphabet characters", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.toLowercase(/* '7' */55)), /* '7' */55);
              }));
        Jest.test("perserves non-ASCII characters", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.toLowercase(/* '\233' */233)), /* '\233' */233);
              }));
      }));

Jest.describe("toUppercase", (function () {
        Jest.test("converts lowercase ASCII characters to uppercase", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.toUppercase(/* 'a' */97)), /* 'A' */65);
              }));
        Jest.test("perserves uppercase characters", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.toUppercase(/* 'A' */65)), /* 'A' */65);
              }));
        Jest.test("perserves non-alphabet characters", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.toUppercase(/* '7' */55)), /* '7' */55);
              }));
        Jest.test("perserves non-ASCII characters", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.toUppercase(/* '\233' */233)), /* '\233' */233);
              }));
      }));

Jest.describe("toDigit", (function () {
        Jest.test("toDigit - converts ASCII characters representing digits into integers", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.toDigit(/* '0' */48)), 0);
              }));
        Jest.test("toDigit - converts ASCII characters representing digits into integers", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.toDigit(/* '8' */56)), 8);
              }));
        Jest.test("toDigit - converts ASCII characters representing digits into integers", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.toDigit(/* 'a' */97)), undefined);
              }));
      }));

Jest.describe("isLowercase", (function () {
        Jest.test("returns true for any lowercase character", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.isLowercase(/* 'a' */97)), true);
              }));
        Jest.test("returns false for all other characters", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.isLowercase(/* '7' */55)), false);
              }));
        Jest.test("returns false for non-ASCII characters", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.isLowercase(/* '\236' */236)), false);
              }));
      }));

Jest.describe("isUppercase", (function () {
        Jest.test("returns true for any uppercase character", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.isUppercase(/* 'A' */65)), true);
              }));
        Jest.test("returns false for all other characters", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.isUppercase(/* '7' */55)), false);
              }));
        Jest.test("returns false for non-ASCII characters", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.isLowercase(/* '\237' */237)), false);
              }));
      }));

Jest.describe("isLetter", (function () {
        Jest.test("returns true for any ASCII alphabet character", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.isLetter(/* 'A' */65)), true);
              }));
        Jest.testAll("returns false for all other characters", {
              hd: /* '7' */55,
              tl: {
                hd: /* ' ' */32,
                tl: {
                  hd: /* '\n' */10,
                  tl: {
                    hd: /* '\011' */11,
                    tl: {
                      hd: /* '\236' */236,
                      tl: /* [] */0
                    }
                  }
                }
              }
            }, (function ($$char) {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.isLetter($$char)), false);
              }));
      }));

Jest.describe("isDigit", (function () {
        Jest.testAll("returns true for digits 0-9", {
              hd: /* '0' */48,
              tl: {
                hd: /* '1' */49,
                tl: {
                  hd: /* '2' */50,
                  tl: {
                    hd: /* '3' */51,
                    tl: {
                      hd: /* '4' */52,
                      tl: {
                        hd: /* '5' */53,
                        tl: {
                          hd: /* '6' */54,
                          tl: {
                            hd: /* '7' */55,
                            tl: {
                              hd: /* '8' */56,
                              tl: {
                                hd: /* '9' */57,
                                tl: /* [] */0
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }, (function (digit) {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.isDigit(digit)), true);
              }));
        Jest.test("returns false for all other characters", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.isDigit(/* 'a' */97)), false);
              }));
      }));

Jest.describe("isAlphanumeric", (function () {
        Jest.test("returns true for any alphabet or digit character", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.isAlphanumeric(/* 'A' */65)), true);
              }));
        Jest.test("returns false for all other characters", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.isAlphanumeric(/* '?' */63)), false);
              }));
      }));

Jest.describe("isPrintable", (function () {
        Jest.test("returns true for a printable character", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.isPrintable(/* '~' */126)), true);
              }));
        Jest.test("returns false for non-printable character", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Option.map(Stdlib__Char.fromCode(31), Stdlib__Char.isPrintable)), false);
              }));
      }));

Jest.describe("isWhitespace", (function () {
        Jest.test("returns true for any whitespace character", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.isWhitespace(/* ' ' */32)), true);
              }));
        Jest.test("returns false for a non-whitespace character", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Char.isWhitespace(/* 'a' */97)), false);
              }));
      }));

export {
  
}
/*  Not a pure module */
