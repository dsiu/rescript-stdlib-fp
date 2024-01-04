// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Caml from "rescript/lib/es6/caml.js";
import * as $$Array from "rescript/lib/es6/array.js";
import * as Curry from "rescript/lib/es6/curry.js";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Caml_array from "rescript/lib/es6/caml_array.js";
import * as Caml_int32 from "rescript/lib/es6/caml_int32.js";
import * as Core__List from "@rescript/core/src/Core__List.mjs";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as Core__Array from "@rescript/core/src/Core__Array.mjs";
import * as TableclothMap from "./TableclothMap.mjs";
import * as Core__Ordering from "@rescript/core/src/Core__Ordering.mjs";

function length(prim) {
  return prim.length;
}

function singleton(a) {
  return [a];
}

function clone(t) {
  return t.map(function (prim) {
              return prim;
            });
}

function isEmpty(a) {
  return a.length === 0;
}

var initialize = Core__Array.fromInitializer;

function range(fromOpt, to_) {
  var from = fromOpt !== undefined ? fromOpt : 0;
  return Core__Array.fromInitializer(to_ - from | 0, (function (i) {
                return i + from | 0;
              }));
}

var fromList = Core__List.toArray;

var toList = Core__List.fromArray;

function toIndexedList(array) {
  return Core__Array.reduceRight(array, [
                array.length - 1 | 0,
                /* [] */0
              ], (function (param, x) {
                  var i = param[0];
                  return [
                          i - 1 | 0,
                          {
                            hd: [
                              i,
                              x
                            ],
                            tl: param[1]
                          }
                        ];
                }))[1];
}

function first(__x) {
  return __x[0];
}

function filter(t, f) {
  return t.filter(Curry.__1(f));
}

function swap(t, i, j) {
  var temp = Caml_array.get(t, i);
  Caml_array.set(t, i, Caml_array.get(t, j));
  Caml_array.set(t, j, temp);
}

function fold(t, initial, f) {
  return Core__Array.reduce(t, initial, Curry.__2(f));
}

function foldRight(t, initial, f) {
  return Core__Array.reduceRight(t, initial, Curry.__2(f));
}

function maximum(t, compare) {
  return fold(t, undefined, (function (max, element) {
                if (max !== undefined && !Core__Ordering.isGreater(Curry._2(compare, element, Caml_option.valFromOption(max)))) {
                  return max;
                } else {
                  return Caml_option.some(element);
                }
              }));
}

function minimum(t, compare) {
  return fold(t, undefined, (function (min, element) {
                if (min !== undefined && !Core__Ordering.isLess(Curry._2(compare, element, Caml_option.valFromOption(min)))) {
                  return min;
                } else {
                  return Caml_option.some(element);
                }
              }));
}

function extent(t, compare) {
  return fold(t, undefined, (function (range, element) {
                if (range === undefined) {
                  return [
                          element,
                          element
                        ];
                }
                var max = range[1];
                var min = range[0];
                return [
                        Core__Ordering.isLess(Curry._2(compare, element, min)) ? element : min,
                        Core__Ordering.isGreater(Curry._2(compare, element, max)) ? element : max
                      ];
              }));
}

function sum(t, M) {
  return $$Array.fold_left(M.add, M.zero, t);
}

function map(t, f) {
  return t.map(Curry.__1(f));
}

function mapWithIndex(t, f) {
  return t.map(f);
}

var map2 = Belt_Array.zipBy;

function map3(as_, bs, cs, f) {
  var minLength = Core__Array.reduce([
        bs.length,
        cs.length
      ], as_.length, (function (prim0, prim1) {
          if (prim0 < prim1) {
            return prim0;
          } else {
            return prim1;
          }
        }));
  return Core__Array.fromInitializer(minLength, (function (i) {
                return Curry._3(f, Caml_array.get(as_, i), Caml_array.get(bs, i), Caml_array.get(cs, i));
              }));
}

function zip(a, b) {
  return Belt_Array.zipBy(a, b, (function (a, b) {
                return [
                        a,
                        b
                      ];
              }));
}

function flatMap(t, f) {
  return t.flatMap(Curry.__1(f));
}

function sliding(stepOpt, a, size) {
  var step = stepOpt !== undefined ? stepOpt : 1;
  var n = a.length;
  if (size > n) {
    return [];
  } else {
    return Core__Array.fromInitializer(1 + Caml_int32.div(n - size | 0, step) | 0, (function (i) {
                  return Core__Array.fromInitializer(size, (function (j) {
                                return Caml_array.get(a, Math.imul(i, step) + j | 0);
                              }));
                }));
  }
}

function find(t, f) {
  var length = t.length;
  var _i = 0;
  while(true) {
    var i = _i;
    if (i >= length) {
      return ;
    }
    if (Curry._1(f, Caml_array.get(t, i))) {
      return Caml_option.some(Caml_array.get(t, i));
    }
    _i = i + 1 | 0;
    continue ;
  };
}

function findIndex(array, f) {
  var _index = 0;
  while(true) {
    var index = _index;
    if (index >= array.length) {
      return ;
    }
    if (Curry._2(f, index, Caml_array.get(array, index))) {
      return [
              index,
              Caml_array.get(array, index)
            ];
    }
    _index = index + 1 | 0;
    continue ;
  };
}

function any(t, f) {
  return t.some(Curry.__1(f));
}

function all(t, f) {
  return t.every(Curry.__1(f));
}

function includes(t, v, equal) {
  return t.some(function (a) {
              return Curry._2(equal, v, a);
            });
}

function append(a, a$p) {
  return a.concat(a$p);
}

function flatten(ars) {
  return ars.flat();
}

function intersperse(t, sep) {
  return Core__Array.fromInitializer(Caml.int_max(0, (t.length << 1) - 1 | 0), (function (i) {
                if (i % 2 !== 0) {
                  return sep;
                } else {
                  return Caml_array.get(t, i / 2 | 0);
                }
              }));
}

function slice(to_, array, from) {
  var defaultTo = to_ !== undefined ? to_ : array.length;
  var sliceFrom = from >= 0 ? (
      array.length < from ? array.length : from
    ) : Caml.int_max(0, Caml.int_min(array.length, array.length + from | 0));
  var sliceTo = defaultTo >= 0 ? (
      array.length < defaultTo ? array.length : defaultTo
    ) : Caml.int_max(0, Caml.int_min(array.length, array.length + defaultTo | 0));
  if (sliceFrom >= sliceTo) {
    return [];
  } else {
    return Core__Array.fromInitializer(sliceTo - sliceFrom | 0, (function (i) {
                  return Caml_array.get(array, i + sliceFrom | 0);
                }));
  }
}

function count(t, f) {
  return fold(t, 0, (function (total, element) {
                return total + (
                        Curry._1(f, element) ? 1 : 0
                      ) | 0;
              }));
}

function chunksOf(t, size) {
  return sliding(size, t, size);
}

function reverse(t) {
  t.reverse();
}

function forEach(t, f) {
  t.forEach(Curry.__1(f));
}

function forEachWithIndex(t, f) {
  for(var i = 0 ,i_finish = t.length; i < i_finish; ++i){
    Curry._2(f, i, Caml_array.get(t, i));
  }
}

function partition(t, f) {
  var match = foldRight(t, [
        /* [] */0,
        /* [] */0
      ], (function (param, element) {
          var rights = param[1];
          var lefts = param[0];
          if (Curry._1(f, element)) {
            return [
                    {
                      hd: element,
                      tl: lefts
                    },
                    rights
                  ];
          } else {
            return [
                    lefts,
                    {
                      hd: element,
                      tl: rights
                    }
                  ];
          }
        }));
  return [
          Core__List.toArray(match[0]),
          Core__List.toArray(match[1])
        ];
}

function splitAt(t, index) {
  return [
          slice(index, t, 0),
          slice(t.length, t, index)
        ];
}

function splitWhen(t, f) {
  var match = findIndex(t, (function (param, e) {
          return Curry._1(f, e);
        }));
  if (match !== undefined) {
    return splitAt(t, match[0]);
  } else {
    return [
            t,
            []
          ];
  }
}

function unzip(t) {
  return [
          Core__Array.fromInitializer(t.length, (function (i) {
                  return Caml_array.get(t, i)[0];
                })),
          Core__Array.fromInitializer(t.length, (function (i) {
                  return Caml_array.get(t, i)[1];
                }))
        ];
}

function repeat(element, length) {
  return Core__Array.fromInitializer(length > 0 ? length : 0, (function (param) {
                return element;
              }));
}

function filterMap(t, f) {
  var result = Core__List.toArray(fold(t, /* [] */0, (function (results, element) {
              var value = Curry._1(f, element);
              if (value !== undefined) {
                return {
                        hd: Caml_option.valFromOption(value),
                        tl: results
                      };
              } else {
                return results;
              }
            })));
  result.reverse();
  return result;
}

function values(t) {
  var result = Core__List.toArray(fold(t, /* [] */0, (function (results, element) {
              if (element !== undefined) {
                return {
                        hd: Caml_option.valFromOption(element),
                        tl: results
                      };
              } else {
                return results;
              }
            })));
  result.reverse();
  return result;
}

function groupBy(t, comparator, f) {
  return fold(t, TableclothMap.empty(comparator), (function (map, element) {
                var key = Curry._1(f, element);
                return TableclothMap.update(map, key, (function (x) {
                              if (x !== undefined) {
                                return {
                                        hd: element,
                                        tl: x
                                      };
                              } else {
                                return {
                                        hd: element,
                                        tl: /* [] */0
                                      };
                              }
                            }));
              }));
}

function equal(a, b, equal$1) {
  if (a.length !== b.length) {
    return false;
  }
  if (a.length === 0) {
    return true;
  }
  var _index = 0;
  while(true) {
    var index = _index;
    if (index === a.length) {
      return true;
    }
    if (!Curry._2(equal$1, Caml_array.get(a, index), Caml_array.get(b, index))) {
      return false;
    }
    _index = index + 1 | 0;
    continue ;
  };
}

var getUnsafe = Belt_Array.getExn;

var setUnsafe = Belt_Array.setExn;

export {
  singleton ,
  repeat ,
  range ,
  initialize ,
  fromList ,
  clone ,
  getUnsafe ,
  setUnsafe ,
  first ,
  slice ,
  swap ,
  reverse ,
  isEmpty ,
  length ,
  any ,
  all ,
  count ,
  find ,
  findIndex ,
  includes ,
  minimum ,
  maximum ,
  extent ,
  sum ,
  map ,
  mapWithIndex ,
  filter ,
  filterMap ,
  flatMap ,
  fold ,
  foldRight ,
  append ,
  flatten ,
  zip ,
  map2 ,
  map3 ,
  partition ,
  splitAt ,
  splitWhen ,
  unzip ,
  forEach ,
  forEachWithIndex ,
  values ,
  intersperse ,
  chunksOf ,
  sliding ,
  groupBy ,
  toList ,
  toIndexedList ,
  equal ,
}
/* TableclothMap Not a pure module */
