// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Pervasives from "rescript/lib/es6/Pervasives.js";
import * as Primitive_exceptions from "rescript/lib/es6/Primitive_exceptions.js";

function constant(a, param) {
  return a;
}

function sequence(param, b) {
  return b;
}

function flip(f, x, y) {
  return f(y, x);
}

function negate(f, t) {
  return !f(t);
}

function apply(f, a) {
  return f(a);
}

function tap(a, f) {
  f(a);
  return a;
}

function times(_n, f) {
  while (true) {
    let n = _n;
    if (n <= 0) {
      return;
    }
    f();
    _n = n - 1 | 0;
    continue;
  };
}

function forever(f) {
  try {
    while (true) {
      f();
    };
    return Pervasives.failwith("[while true] managed to return, you are in trouble now.");
  } catch (raw_exn) {
    return Primitive_exceptions.internalToException(raw_exn);
  }
}

function curry(f, a, b) {
  return f([
    a,
    b
  ]);
}

function uncurry(f, param) {
  return f(param[0], param[1]);
}

function curry3(f, a, b, c) {
  return f([
    a,
    b,
    c
  ]);
}

function uncurry3(f, param) {
  return f(param[0], param[1], param[2]);
}

export {
  constant,
  sequence,
  flip,
  negate,
  apply,
  tap,
  forever,
  times,
  curry,
  uncurry,
  curry3,
  uncurry3,
}
/* No side effect */
