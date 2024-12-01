// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Core__Option from "@rescript/core/src/Core__Option.mjs";
import * as Primitive_option from "rescript/lib/es6/Primitive_option.js";

function and_(ta, tb) {
  if (Core__Option.isSome(ta)) {
    return tb;
  } else {
    return ta;
  }
}

function flatten(x) {
  if (x !== undefined) {
    return Primitive_option.valFromOption(x);
  }
  
}

function both(a, b) {
  if (a !== undefined && b !== undefined) {
    return [
      Primitive_option.valFromOption(a),
      Primitive_option.valFromOption(b)
    ];
  }
  
}

function map2(a, b, f) {
  if (a !== undefined && b !== undefined) {
    return Primitive_option.some(f(Primitive_option.valFromOption(a), Primitive_option.valFromOption(b)));
  }
  
}

function unwrapUnsafe(t) {
  let exn = {
    RE_EXN_ID: "Invalid_argument",
    _1: "Option.unwrapUnsafe called with None"
  };
  if (t !== undefined) {
    return Primitive_option.valFromOption(t);
  }
  throw exn;
}

function toArray(t) {
  if (t !== undefined) {
    return [Primitive_option.valFromOption(t)];
  } else {
    return [];
  }
}

function toList(t) {
  if (t !== undefined) {
    return {
      hd: Primitive_option.valFromOption(t),
      tl: /* [] */0
    };
  } else {
    return /* [] */0;
  }
}

function tap(t, f) {
  if (t !== undefined) {
    return f(Primitive_option.valFromOption(t));
  }
  
}

let or_ = Core__Option.orElse;

let andThen = Core__Option.flatMap;

let unwrap = Core__Option.getOr;

export {
  and_,
  or_,
  both,
  flatten,
  map2,
  andThen,
  unwrap,
  unwrapUnsafe,
  tap,
  toArray,
  toList,
}
/* No side effect */
