// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Caml from "rescript/lib/es6/caml.js";
import * as $$String from "rescript/lib/es6/string.js";
import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Pervasives from "rescript/lib/es6/pervasives.js";

function fromInt(t) {
  return t;
}

function fromString(string) {
  var match = $$String.lowercase_ascii(string);
  if (match === "nan") {
    return NaN;
  }
  var result = Number(string);
  if (Number.isNaN(result)) {
    return ;
  } else {
    return result;
  }
}

function add(prim0, prim1) {
  return prim0 + prim1;
}

function subtract(prim0, prim1) {
  return prim0 - prim1;
}

function multiply(prim0, prim1) {
  return prim0 * prim1;
}

function divide(n, by) {
  return n / by;
}

function power(base, exponent) {
  return Math.pow(base, exponent);
}

function negate(prim) {
  return - prim;
}

function absolute(t) {
  return Math.abs(t);
}

function clamp(n, lower, upper) {
  if (upper < lower) {
    throw {
          RE_EXN_ID: "Invalid_argument",
          _1: "~lower:" + (lower.toString() + (" must be less than or equal to ~upper:" + upper.toString())),
          Error: new Error()
        };
  }
  if (Number.isNaN(lower) || Number.isNaN(upper) || Number.isNaN(n)) {
    return Number.NaN;
  } else {
    return Caml.float_max(lower, upper < n ? upper : n);
  }
}

function inRange(n, lower, upper) {
  if (upper < lower) {
    throw {
          RE_EXN_ID: "Invalid_argument",
          _1: "~lower:" + (lower.toString() + (" must be less than or equal to ~upper:" + upper.toString())),
          Error: new Error()
        };
  }
  if (n >= lower) {
    return n < upper;
  } else {
    return false;
  }
}

function squareRoot(prim) {
  return Math.sqrt(prim);
}

function log(n, base) {
  return Math.log(n) / Math.log(base);
}

var nan = NaN;

var e = Math.E;

var pi = Math.PI;

function $$isNaN(t) {
  return Number.isNaN(t);
}

function $$isFinite(t) {
  return Number.isFinite(t);
}

function isInfinite(n) {
  if (Number.isFinite(n)) {
    return false;
  } else {
    return !Number.isNaN(n);
  }
}

function maximum(x, y) {
  if (Number.isNaN(x) || Number.isNaN(y)) {
    return nan;
  } else if (y > x) {
    return y;
  } else {
    return x;
  }
}

function minimum(x, y) {
  if (Number.isNaN(x) || Number.isNaN(y)) {
    return nan;
  } else if (y < x) {
    return y;
  } else {
    return x;
  }
}

function hypotenuse(a, b) {
  return Math.hypot(a, b);
}

function degrees(n) {
  return n * (pi / 180.0);
}

function turns(n) {
  return n * 2 * pi;
}

function cos(t) {
  return Math.cos(t);
}

function acos(t) {
  return Math.acos(t);
}

function sin(t) {
  return Math.sin(t);
}

function asin(t) {
  return Math.asin(t);
}

function tan(t) {
  return Math.tan(t);
}

function atan(t) {
  return Math.atan(t);
}

function atan2(y, x) {
  return Math.atan2(y, x);
}

function round(directionOpt, n) {
  var direction = directionOpt !== undefined ? directionOpt : ({
        NAME: "Closest",
        VAL: "Up"
      });
  if (typeof direction !== "object") {
    if (direction === "Down") {
      return Math.floor(n);
    } else if (direction === "AwayFromZero") {
      if (n > 0) {
        return Math.ceil(n);
      } else {
        return Math.floor(n);
      }
    } else if (direction === "Zero") {
      return Math.trunc(n);
    } else {
      return Math.ceil(n);
    }
  }
  var match = direction.VAL;
  if (match === "Down") {
    return Math.ceil(n - 0.5);
  }
  if (match !== "ToEven") {
    if (match === "AwayFromZero") {
      if (n > 0) {
        return Math.floor(n + 0.5);
      } else {
        return Math.ceil(n - 0.5);
      }
    } else if (match === "Zero") {
      if (n > 0) {
        return Math.ceil(n - 0.5);
      } else {
        return Math.floor(n + 0.5);
      }
    } else {
      return Math.round(n);
    }
  }
  var roundNearestLowerBound = - Math.pow(2, 52);
  var roundNearestUpperBound = Math.pow(2, 52);
  if (n <= roundNearestLowerBound || n >= roundNearestUpperBound) {
    return n + 0;
  }
  var floor = Math.floor(n);
  var ceil_or_succ = floor + 1;
  var diff_floor = n - floor;
  var diff_ceil = ceil_or_succ - n;
  if (diff_floor < diff_ceil || !(diff_floor > diff_ceil || floor % 2 !== 0)) {
    return floor;
  } else {
    return ceil_or_succ;
  }
}

function floor(t) {
  return Math.floor(t);
}

function ceiling(t) {
  return Math.ceil(t);
}

function truncate(t) {
  return Math.trunc(t);
}

function fromPolar(param) {
  var theta = param[1];
  var r = param[0];
  return [
          r * Math.cos(theta),
          r * Math.sin(theta)
        ];
}

function toPolar(param) {
  var y = param[1];
  var x = param[0];
  return [
          Math.hypot(x, y),
          Math.atan2(y, x)
        ];
}

function toInt(f) {
  if (Number.isFinite(f)) {
    return Math.trunc(f);
  }
  
}

function toString(t) {
  return t.toString();
}

var equal = Caml_obj.equal;

var compare = Caml_obj.compare;

var zero = 0.0;

var one = 1.0;

var infinity = Pervasives.infinity;

var negativeInfinity = Pervasives.neg_infinity;

var epsilon = Pervasives.epsilon_float;

var largestValue = Number.MAX_VALUE;

var smallestValue = Number.MIN_VALUE;

var maximumSafeInteger = Number.MAX_SAFE_INTEGER;

var minimumSafeInteger = Number.MIN_SAFE_INTEGER;

function isInteger(prim) {
  return Number.isInteger(prim);
}

function isSafeInteger(prim) {
  return Number.isSafeInteger(prim);
}

function radians(prim) {
  return prim;
}

export {
  zero ,
  one ,
  nan ,
  infinity ,
  negativeInfinity ,
  e ,
  pi ,
  epsilon ,
  largestValue ,
  smallestValue ,
  maximumSafeInteger ,
  minimumSafeInteger ,
  fromInt ,
  fromString ,
  add ,
  subtract ,
  multiply ,
  divide ,
  power ,
  negate ,
  absolute ,
  maximum ,
  minimum ,
  clamp ,
  squareRoot ,
  log ,
  $$isNaN ,
  $$isFinite ,
  isInfinite ,
  isInteger ,
  isSafeInteger ,
  inRange ,
  hypotenuse ,
  degrees ,
  radians ,
  turns ,
  fromPolar ,
  toPolar ,
  cos ,
  acos ,
  sin ,
  asin ,
  tan ,
  atan ,
  atan2 ,
  round ,
  floor ,
  ceiling ,
  truncate ,
  toInt ,
  toString ,
  equal ,
  compare ,
}
/* nan Not a pure module */
