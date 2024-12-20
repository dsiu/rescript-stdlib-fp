// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Jest from "@glennsl/rescript-jest/src/jest.mjs";
import * as Stdlib__Int from "../src/Stdlib__Int.mjs";
import * as Stdlib__List from "../src/Stdlib__List.mjs";
import * as Stdlib__Result from "../src/Stdlib__Result.mjs";
import * as Stdlib__String from "../src/Stdlib__String.mjs";

Jest.describe("ok", (function () {
        Jest.test("returns ok type", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.ok(Stdlib__String.reverse("desserts"))), {
                            TAG: "Ok",
                            _0: "stressed"
                          });
              }));
        Jest.test("returns ok type", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__List.map({
                                    hd: 1,
                                    tl: {
                                      hd: 2,
                                      tl: {
                                        hd: 3,
                                        tl: /* [] */0
                                      }
                                    }
                                  }, Stdlib__Result.ok)), {
                            hd: {
                              TAG: "Ok",
                              _0: 1
                            },
                            tl: {
                              hd: {
                                TAG: "Ok",
                                _0: 2
                              },
                              tl: {
                                hd: {
                                  TAG: "Ok",
                                  _0: 3
                                },
                                tl: /* [] */0
                              }
                            }
                          });
              }));
      }));

Jest.describe("error", (function () {
        Jest.test("returns error type", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.error(Stdlib__Int.negate(3))), {
                            TAG: "Error",
                            _0: -3
                          });
              }));
        Jest.test("returns error type", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__List.map({
                                    hd: 1,
                                    tl: {
                                      hd: 2,
                                      tl: {
                                        hd: 3,
                                        tl: /* [] */0
                                      }
                                    }
                                  }, Stdlib__Result.error)), {
                            hd: {
                              TAG: "Error",
                              _0: 1
                            },
                            tl: {
                              hd: {
                                TAG: "Error",
                                _0: 2
                              },
                              tl: {
                                hd: {
                                  TAG: "Error",
                                  _0: 3
                                },
                                tl: /* [] */0
                              }
                            }
                          });
              }));
      }));

Jest.describe("fromOption", (function () {
        Jest.test("maps None into Error", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.fromOption(undefined, "error message")), {
                            TAG: "Error",
                            _0: "error message"
                          });
              }));
        Jest.test("maps Some into Ok", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.fromOption(10, "error message")), {
                            TAG: "Ok",
                            _0: 10
                          });
              }));
      }));

Jest.describe("isOk", (function () {
        Jest.test("returns true if result is Ok", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.isOk({
                                    TAG: "Ok",
                                    _0: 3
                                  })), true);
              }));
        Jest.test("returns false if result is Error", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.isOk({
                                    TAG: "Error",
                                    _0: 3
                                  })), false);
              }));
      }));

Jest.describe("isError", (function () {
        Jest.test("returns false if result is Ok", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.isError({
                                    TAG: "Ok",
                                    _0: 3
                                  })), false);
              }));
        Jest.test("returns true if result is Error", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.isError({
                                    TAG: "Error",
                                    _0: 3
                                  })), true);
              }));
      }));

Jest.describe("and_", (function () {
        Jest.test("returns second arg if both are Ok", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.and_({
                                    TAG: "Ok",
                                    _0: "Antelope"
                                  }, {
                                    TAG: "Ok",
                                    _0: "Salmon"
                                  })), {
                            TAG: "Ok",
                            _0: "Salmon"
                          });
              }));
        Jest.test("returns first error arg", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.and_({
                                    TAG: "Error",
                                    _0: "Finch"
                                  }, {
                                    TAG: "Ok",
                                    _0: "Salmon"
                                  })), {
                            TAG: "Error",
                            _0: "Finch"
                          });
              }));
        Jest.test("returns first error arg", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.and_({
                                    TAG: "Ok",
                                    _0: "Antelope"
                                  }, {
                                    TAG: "Error",
                                    _0: "Finch"
                                  })), {
                            TAG: "Error",
                            _0: "Finch"
                          });
              }));
        Jest.test("returns first error arg", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.and_({
                                    TAG: "Error",
                                    _0: "Honey bee"
                                  }, {
                                    TAG: "Error",
                                    _0: "Finch"
                                  })), {
                            TAG: "Error",
                            _0: "Honey bee"
                          });
              }));
      }));

Jest.describe("or_", (function () {
        Jest.test("returns first arg if both are Ok", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.or_({
                                    TAG: "Ok",
                                    _0: "Boar"
                                  }, {
                                    TAG: "Ok",
                                    _0: "Gecko"
                                  })), {
                            TAG: "Ok",
                            _0: "Boar"
                          });
              }));
        Jest.test("returns ok arg", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.or_({
                                    TAG: "Error",
                                    _0: "Periwinkle"
                                  }, {
                                    TAG: "Ok",
                                    _0: "Gecko"
                                  })), {
                            TAG: "Ok",
                            _0: "Gecko"
                          });
              }));
        Jest.test("returns ok arg", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.or_({
                                    TAG: "Ok",
                                    _0: "Boar"
                                  }, {
                                    TAG: "Error",
                                    _0: "Periwinkle"
                                  })), {
                            TAG: "Ok",
                            _0: "Boar"
                          });
              }));
        Jest.test("returns second arg", (function () {
                return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.or_({
                                    TAG: "Error",
                                    _0: "Periwinkle"
                                  }, {
                                    TAG: "Error",
                                    _0: "Robin"
                                  })), {
                            TAG: "Error",
                            _0: "Robin"
                          });
              }));
        Jest.describe("unwrapLazy", (function () {
                Jest.test("returns forced default arg if error", (function () {
                        return Jest.Expect.toEqual(Jest.Expect.expect(Stdlib__Result.unwrapLazy({
                                            TAG: "Error",
                                            _0: "Periwinkle"
                                          }, {
                                            LAZY_DONE: true,
                                            VAL: "Gecko"
                                          })), "Gecko");
                      }));
              }));
      }));

export {
  
}
/*  Not a pure module */
