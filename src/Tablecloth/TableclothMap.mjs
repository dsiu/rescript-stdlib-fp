// Generated by ReScript, PLEASE EDIT WITH CARE

import * as $$Array from "rescript/lib/es6/array.js";
import * as Belt_Map from "rescript/lib/es6/belt_Map.js";
import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Internal from "./Internal.mjs";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as TableclothOption from "./TableclothOption.mjs";

function fromArray(comparator, values) {
  return Belt_Map.fromArray(values, Internal.toBeltComparator(comparator));
}

function empty(comparator) {
  return fromArray(comparator, []);
}

function fromList(comparator, l) {
  return fromArray(comparator, $$Array.of_list(l));
}

function singleton(comparator, key, value) {
  return fromArray(comparator, [[
                key,
                value
              ]]);
}

var isEmpty = Belt_Map.isEmpty;

var includes = Belt_Map.has;

var length = Belt_Map.size;

var add = Belt_Map.set;

var remove = Belt_Map.remove;

var get = Belt_Map.get;

function update(m, key, f) {
  return Belt_Map.update(m, key, (function (a) {
                return f(a);
              }));
}

function merge(m1, m2, f) {
  return Belt_Map.merge(m1, m2, (function (m, a, b) {
                return f(m, a, b);
              }));
}

function map(m, f) {
  return Belt_Map.map(m, (function (value) {
                return f(value);
              }));
}

function mapWithIndex(t, f) {
  return Belt_Map.mapWithKey(t, (function (a, b) {
                return f(a, b);
              }));
}

function filter(m, f) {
  return Belt_Map.keep(m, (function (param, value) {
                return f(value);
              }));
}

function filterMap(m, f) {
  var f$p = function (param) {
    var key = param[0];
    return Belt_Option.map(f(key, param[1]), (function (value$p) {
                  return [
                          key,
                          value$p
                        ];
                }));
  };
  return Belt_Map.fromArray(Belt_Array.keepMap(Belt_Map.toArray(m), f$p), Belt_Map.getId(m));
}

function partition(m, f) {
  return Belt_Map.partition(m, (function (key, value) {
                return f(key, value);
              }));
}

function find(m, f) {
  return Belt_Map.findFirstBy(m, (function (key, value) {
                return f(key, value);
              }));
}

function any(m, f) {
  return Belt_Map.some(m, (function (param, value) {
                return f(value);
              }));
}

function all(m, f) {
  return Belt_Map.every(m, (function (param, value) {
                return f(value);
              }));
}

function forEach(m, f) {
  Belt_Map.forEach(m, (function (param, value) {
          f(value);
        }));
}

function forEachWithIndex(m, f) {
  Belt_Map.forEach(m, (function (key, value) {
          f(key, value);
        }));
}

function fold(m, initial, f) {
  return Belt_Map.reduce(m, initial, (function (acc, key, data) {
                return f(acc, key, data);
              }));
}

function keys(m) {
  return $$Array.to_list(Belt_Map.keysToArray(m));
}

function values(m) {
  return $$Array.to_list(Belt_Map.valuesToArray(m));
}

var maximum = Belt_Map.maxKey;

var minimum = Belt_Map.minKey;

function extent(t) {
  return TableclothOption.both(Belt_Map.minKey(t), Belt_Map.maxKey(t));
}

var toArray = Belt_Map.toArray;

var toList = Belt_Map.toList;

function fromArray$1(a) {
  var cmp = Caml_obj.compare;
  return Belt_Map.fromArray(a, {
              cmp: cmp
            });
}

function empty$1() {
  return fromArray$1([]);
}

function fromList$1(l) {
  return fromArray$1($$Array.of_list(l));
}

function singleton$1(key, value) {
  return fromArray$1([[
                key,
                value
              ]]);
}

function fromArray$2(a) {
  return fromArray$1(a);
}

var empty$2 = fromArray$1([]);

function singleton$2(key, value) {
  return fromArray$1([[
                key,
                value
              ]]);
}

function fromList$2(l) {
  return fromArray$1($$Array.of_list(l));
}

function fromArray$3(a) {
  return fromArray$1(a);
}

var empty$3 = fromArray$1([]);

function singleton$3(key, value) {
  return fromArray$1([[
                key,
                value
              ]]);
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
  get ,
  update ,
  isEmpty ,
  length ,
  any ,
  all ,
  find ,
  includes ,
  minimum ,
  maximum ,
  extent ,
  merge ,
  map ,
  mapWithIndex ,
  filter ,
  filterMap ,
  partition ,
  fold ,
  forEach ,
  forEachWithIndex ,
  keys ,
  values ,
  toArray ,
  toList ,
  Poly ,
  Int ,
  $$String ,
}
/* empty Not a pure module */
