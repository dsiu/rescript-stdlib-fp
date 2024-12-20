// Generated by ReScript, PLEASE EDIT WITH CARE

import * as $$Array from "rescript/lib/es6/array.js";
import * as Belt_Set from "rescript/lib/es6/belt_Set.js";
import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Internal from "./Internal.mjs";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";

function empty(comparator) {
  return Belt_Set.make(Internal.toBeltComparator(comparator));
}

function singleton(element, comparator) {
  return Belt_Set.fromArray([element], Internal.toBeltComparator(comparator));
}

function fromArray(elements, comparator) {
  return Belt_Set.fromArray(elements, Internal.toBeltComparator(comparator));
}

function fromList(elements, comparator) {
  return Belt_Set.fromArray($$Array.of_list(elements), Internal.toBeltComparator(comparator));
}

var length = Belt_Set.size;

var isEmpty = Belt_Set.isEmpty;

var includes = Belt_Set.has;

var add = Belt_Set.add;

var remove = Belt_Set.remove;

var difference = Belt_Set.diff;

var intersection = Belt_Set.intersect;

var union = Belt_Set.union;

function filter(s, f) {
  return Belt_Set.keep(s, (function (a) {
                return f(a);
              }));
}

function partition(s, f) {
  return Belt_Set.partition(s, (function (a) {
                return f(a);
              }));
}

function find(s, f) {
  return Belt_Array.getBy(Belt_Set.toArray(s), (function (a) {
                return f(a);
              }));
}

function all(s, f) {
  return Belt_Set.every(s, (function (a) {
                return f(a);
              }));
}

function any(s, f) {
  return Belt_Set.some(s, (function (a) {
                return f(a);
              }));
}

function forEach(s, f) {
  Belt_Set.forEach(s, (function (a) {
          f(a);
        }));
}

function fold(s, initial, f) {
  return Belt_Set.reduce(s, initial, (function (a, b) {
                return f(a, b);
              }));
}

var toArray = Belt_Set.toArray;

var toList = Belt_Set.toList;

function fromArray$1(a) {
  var cmp = Caml_obj.compare;
  return Belt_Set.fromArray(a, {
              cmp: cmp
            });
}

function fromList$1(l) {
  return fromArray$1($$Array.of_list(l));
}

function empty$1() {
  return fromArray$1([]);
}

function singleton$1(a) {
  return fromArray$1([a]);
}

function fromArray$2(a) {
  return fromArray$1(a);
}

var empty$2 = fromArray$1([]);

function singleton$2(a) {
  return fromArray$1([a]);
}

function fromList$2(l) {
  return fromArray$1($$Array.of_list(l));
}

function fromArray$3(a) {
  return fromArray$1(a);
}

var empty$3 = fromArray$1([]);

function singleton$3(a) {
  return fromArray$1([a]);
}

function fromList$3(l) {
  return fromArray$1($$Array.of_list(l));
}

var Poly = {
  empty: empty$1,
  singleton: singleton$1,
  fromArray: fromArray$1,
  fromList: fromList$1
};

var Int = {
  empty: empty$2,
  singleton: singleton$2,
  fromArray: fromArray$2,
  fromList: fromList$2
};

var $$String = {
  empty: empty$3,
  singleton: singleton$3,
  fromArray: fromArray$3,
  fromList: fromList$3
};

export {
  empty ,
  singleton ,
  fromArray ,
  fromList ,
  add ,
  remove ,
  includes ,
  length ,
  find ,
  isEmpty ,
  any ,
  all ,
  difference ,
  intersection ,
  union ,
  filter ,
  partition ,
  fold ,
  forEach ,
  toArray ,
  toList ,
  Poly ,
  Int ,
  $$String ,
}
/* empty Not a pure module */
