// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Exn from "rescript/lib/es6/Exn.js";
import * as Option from "rescript/lib/es6/Option.js";
import * as Stdlib__List from "./Stdlib__List.mjs";
import * as Primitive_option from "rescript/lib/es6/Primitive_option.js";

function getExnWithMessage(option, message) {
  if (option !== undefined) {
    return Primitive_option.valFromOption(option);
  } else {
    return Exn.raiseError(message);
  }
}

function arrayToMayBe(__x) {
  return __x[0];
}

function listToMayBe(__x) {
  return Stdlib__List.get(__x, 0);
}

let fromMaybe = Option.getOr;

let A;

let L;

export {
  getExnWithMessage,
  fromMaybe,
  A,
  arrayToMayBe,
  L,
  listToMayBe,
}
/* Stdlib__List Not a pure module */
