// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as Pervasives from "rescript/lib/es6/pervasives.js";
import * as Caml_js_exceptions from "rescript/lib/es6/caml_js_exceptions.js";

function constant(a, param) {
  return a;
}

function sequence(param, b) {
  return b;
}

function flip(f, x, y) {
  return Curry._2(f, y, x);
}

function negate(f, t) {
  return !Curry._1(f, t);
}

function apply(f, a) {
  return Curry._1(f, a);
}

function compose(a, g, f) {
  return Curry._1(f, Curry._1(g, a));
}

function composeRight(a, g, f) {
  return Curry._1(g, Curry._1(f, a));
}

function tap(a, f) {
  Curry._1(f, a);
  return a;
}

function times(_n, f) {
  while(true) {
    var n = _n;
    if (n <= 0) {
      return ;
    }
    Curry._1(f, undefined);
    _n = n - 1 | 0;
    continue ;
  };
}

function forever(f) {
  try {
    while(true) {
      Curry._1(f, undefined);
    };
    return Pervasives.failwith("[while true] managed to return, you are in trouble now.");
  }
  catch (raw_exn){
    return Caml_js_exceptions.internalToOCamlException(raw_exn);
  }
}

function curry(f, a, b) {
  return Curry._1(f, [
              a,
              b
            ]);
}

function uncurry(f, param) {
  return Curry._2(f, param[0], param[1]);
}

function curry3(f, a, b, c) {
  return Curry._1(f, [
              a,
              b,
              c
            ]);
}

function uncurry3(f, param) {
  return Curry._3(f, param[0], param[1], param[2]);
}

export {
  constant ,
  sequence ,
  flip ,
  negate ,
  apply ,
  compose ,
  composeRight ,
  tap ,
  forever ,
  times ,
  curry ,
  uncurry ,
  curry3 ,
  uncurry3 ,
}
/* No side effect */