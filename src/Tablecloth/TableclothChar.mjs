// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Char from "rescript/lib/es6/char.js";
import * as $$String from "rescript/lib/es6/string.js";
import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Caml_string from "rescript/lib/es6/caml_string.js";
import * as TableclothComparator from "./TableclothComparator.mjs";

var compare = Caml_obj.compare;

var include = TableclothComparator.Make({
      compare: compare
    });

function toCode(c) {
  return c;
}

function fromCode(i) {
  if (0 <= i && i <= 255) {
    return Char.chr(i);
  }
  
}

function toString(c) {
  return $$String.make(1, c);
}

function fromString(str) {
  var match = str.length;
  if (match !== 1) {
    return ;
  } else {
    return Caml_string.get(str, 0);
  }
}

function toDigit($$char) {
  if ($$char > 57 || $$char < 48) {
    return ;
  } else {
    return $$char - /* '0' */48 | 0;
  }
}

function toLowercase($$char) {
  if ($$char > 90 || $$char < 65) {
    return $$char;
  } else {
    return Char.chr(/* 'a' */97 + ($$char - /* 'A' */65 | 0) | 0);
  }
}

function toUppercase($$char) {
  if ($$char > 122 || $$char < 97) {
    return $$char;
  } else {
    return Char.chr(/* 'A' */65 + ($$char - /* 'a' */97 | 0) | 0);
  }
}

function isLowercase(x) {
  return !(x > 122 || x < 97);
}

function isUppercase(x) {
  return !(x > 90 || x < 65);
}

function isLetter(x) {
  if (x >= 91) {
    return !(x > 122 || x < 97);
  } else {
    return x >= 65;
  }
}

function isDigit(x) {
  return !(x > 57 || x < 48);
}

function isAlphanumeric(x) {
  if (x > 90 || x < 48) {
    return !(x > 122 || x < 97);
  } else {
    return x > 64 || x < 58;
  }
}

function isPrintable(x) {
  return !(x > 126 || x < 32);
}

function isWhitespace(x) {
  if (x >= 14) {
    return x === 32;
  } else {
    return x >= 9;
  }
}

var equal = Caml_obj.equal;

var compare$1 = Caml_obj.compare;

var comparator = include.comparator;

export {
  fromCode ,
  fromString ,
  isLowercase ,
  isUppercase ,
  isLetter ,
  isDigit ,
  isAlphanumeric ,
  isPrintable ,
  isWhitespace ,
  toLowercase ,
  toUppercase ,
  toCode ,
  toString ,
  toDigit ,
  equal ,
  compare$1 as compare,
  comparator ,
}
/* include Not a pure module */