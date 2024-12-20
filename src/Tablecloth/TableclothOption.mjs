// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as Core__Option from "@rescript/core/src/Core__Option.mjs";

function and_(ta, tb) {
  if (Core__Option.isSome(ta)) {
    return tb;
  } else {
    return ta;
  }
}

function flatten(x) {
  if (x !== undefined) {
    return Caml_option.valFromOption(x);
  }
  
}

function both(a, b) {
  if (a !== undefined && b !== undefined) {
    return [
            Caml_option.valFromOption(a),
            Caml_option.valFromOption(b)
          ];
  }
  
}

function map2(a, b, f) {
  if (a !== undefined && b !== undefined) {
    return Caml_option.some(f(Caml_option.valFromOption(a), Caml_option.valFromOption(b)));
  }
  
}

function unwrapUnsafe(t) {
  var exn = {
    RE_EXN_ID: "Invalid_argument",
    _1: "Option.unwrapUnsafe called with None"
  };
  if (t !== undefined) {
    return Caml_option.valFromOption(t);
  }
  throw exn;
}

function toArray(t) {
  if (t !== undefined) {
    return [Caml_option.valFromOption(t)];
  } else {
    return [];
  }
}

function toList(t) {
  if (t !== undefined) {
    return {
            hd: Caml_option.valFromOption(t),
            tl: /* [] */0
          };
  } else {
    return /* [] */0;
  }
}

function tap(t, f) {
  if (t !== undefined) {
    return f(Caml_option.valFromOption(t));
  }
  
}

var or_ = Core__Option.orElse;

var andThen = Core__Option.flatMap;

var unwrap = Core__Option.getOr;

export {
  and_ ,
  or_ ,
  both ,
  flatten ,
  map2 ,
  andThen ,
  unwrap ,
  unwrapUnsafe ,
  tap ,
  toArray ,
  toList ,
}
/* No side effect */
