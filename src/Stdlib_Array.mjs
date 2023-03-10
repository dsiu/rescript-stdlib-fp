// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "@rescript/std/lib/es6/curry.js";
import * as Caml_obj from "@rescript/std/lib/es6/caml_obj.js";
import * as Belt_Array from "@rescript/std/lib/es6/belt_Array.js";
import * as Caml_option from "@rescript/std/lib/es6/caml_option.js";
import * as Garter_Array from "@greenlabs/garter/src/Garter_Array.mjs";

function head(__x) {
  return Garter_Array.getExn(__x, 0);
}

function last(xs) {
  return Garter_Array.getExn(xs, xs.length - 1 | 0);
}

function tail(__x) {
  return Garter_Array.sliceToEnd(__x, 1);
}

function init(xs) {
  var l = xs.length;
  if (l === 0) {
    return ;
  } else {
    return Belt_Array.slice(xs, 0, l - 1 | 0);
  }
}

function uncons(xs) {
  if (xs.length !== 0) {
    return [
            Belt_Array.getExn(xs, 0),
            Belt_Array.sliceToEnd(xs, 1)
          ];
  }
  
}

function singleon(__x) {
  return Garter_Array.make(1, __x);
}

function take(xs, n) {
  var l = xs.length;
  var len = n < 0 ? 0 : (
      l < n ? l : n
    );
  return Belt_Array.slice(xs, 0, len);
}

function takeExactly(xs, n) {
  if (n < 0 || n > xs.length) {
    return ;
  } else {
    return Belt_Array.slice(xs, 0, n);
  }
}

function takeWhile(xs, predicateFn) {
  return Belt_Array.reduceU(xs, [], (function (acc, element) {
                if (Curry._1(predicateFn, element)) {
                  acc.push(element);
                }
                return acc;
              }));
}

function drop(xs, n) {
  var l = xs.length;
  var start = n < 0 ? 0 : (
      l < n ? l : n
    );
  return Belt_Array.sliceToEnd(xs, start);
}

function dropExactly(xs, n) {
  if (n < 0 || n > xs.length) {
    return ;
  } else {
    return Belt_Array.sliceToEnd(xs, n);
  }
}

function dropWhile(xs, predicateFn) {
  return Belt_Array.reduceU(xs, [], (function (acc, element) {
                if (!Curry._1(predicateFn, element)) {
                  acc.push(element);
                }
                return acc;
              }));
}

function tails(xs) {
  if (xs.length === 0) {
    return [[]];
  } else {
    return Garter_Array.concat([xs], tails(Garter_Array.sliceToEnd(xs, 1)));
  }
}

var some = Belt_Array.someU;

function keepSome(xs) {
  return Garter_Array.keepMap(xs, (function (x) {
                return x;
              }));
}

function intersperse(xs, delim) {
  var xlen = xs.length;
  if (xlen === 0) {
    return [];
  }
  if (xlen === 1) {
    return xs;
  }
  var ys = Garter_Array.make((xlen << 1) - 1 | 0, delim);
  Garter_Array.forEachWithIndex(xs, (function (i, x) {
          ys[(i << 1)] = x;
        }));
  return ys;
}

function uniqBy(xs, uniqFn) {
  var index = 0;
  var arr = [];
  while(index < xs.length) {
    var value = xs[index];
    var alreadyAdded = Belt_Array.someU(arr, (function(value){
        return function (x) {
          return Caml_obj.equal(Curry._1(uniqFn, x), Curry._1(uniqFn, value));
        }
        }(value)));
    if (!alreadyAdded) {
      arr.push(value);
    }
    index = index + 1 | 0;
  };
  return arr;
}

function uniq(xs) {
  return uniqBy(xs, (function (element) {
                return element;
              }));
}

function splitAt(xs, offset) {
  if (offset < 0 || offset > xs.length) {
    return ;
  } else {
    return [
            Belt_Array.slice(xs, 0, offset),
            Belt_Array.sliceToEnd(xs, offset)
          ];
  }
}

function scanl(xs, initial, fn) {
  var tmp;
  if (xs.length === 0) {
    tmp = [];
  } else {
    var h = Garter_Array.getExn(xs, 0);
    var tails = Garter_Array.sliceToEnd(xs, 1);
    tmp = scanl(tails, Curry._2(fn, initial, h), fn);
  }
  return Garter_Array.concat([initial], tmp);
}

function flatMap(xs, f) {
  return Garter_Array.reduce(Garter_Array.map(xs, f), [], Garter_Array.concat);
}

function arrayToOption(__x) {
  return Garter_Array.get(__x, 0);
}

function foldLeft(xs, f) {
  var init = Garter_Array.getExn(xs, 0);
  var rest = Garter_Array.sliceToEnd(xs, 1);
  return Garter_Array.reduce(rest, init, f);
}

function foldRight(xs, f) {
  var end = xs.length - 1 | 0;
  var init = Garter_Array.getExn(xs, end);
  var rest = Garter_Array.slice(xs, 0, end);
  return Garter_Array.reduceReverse(rest, init, f);
}

function $$return(x) {
  return [x];
}

function liftM2(f, m1, m2) {
  return flatMap(m1, (function (x1) {
                return flatMap(m2, (function (x2) {
                              return [Curry._2(f, x1, x2)];
                            }));
              }));
}

function combinationIf2(a, b, f) {
  var ret = {
    contents: []
  };
  Garter_Array.forEach(a, (function (x) {
          Garter_Array.forEach(b, (function (y) {
                  var r = f(x, y);
                  if (r !== undefined) {
                    ret.contents = Garter_Array.concat(ret.contents, [Caml_option.valFromOption(r)]);
                    return ;
                  }
                  
                }));
        }));
  return ret.contents;
}

function combination2(a, b, f) {
  return combinationIf2(a, b, (function (x, y) {
                return Caml_option.some(f(x, y));
              }));
}

function combinationIf3(a, b, c, f) {
  var ret = {
    contents: []
  };
  Garter_Array.forEach(a, (function (x) {
          Garter_Array.forEach(b, (function (y) {
                  Garter_Array.forEach(c, (function (z) {
                          var r = f(x, y, z);
                          if (r !== undefined) {
                            ret.contents = Garter_Array.concat(ret.contents, [Caml_option.valFromOption(r)]);
                            return ;
                          }
                          
                        }));
                }));
        }));
  return ret.contents;
}

function combinationArray3(a, b, c, f) {
  return combinationIf3(a, b, c, (function (x, y, z) {
                return Caml_option.some(f(x, y, z));
              }));
}

function combinationIf4(a, b, c, d, f) {
  var ret = {
    contents: []
  };
  Garter_Array.forEach(a, (function (x) {
          Garter_Array.forEach(b, (function (y) {
                  Garter_Array.forEach(c, (function (z) {
                          Garter_Array.forEach(d, (function (w) {
                                  var r = f(x, y, z, w);
                                  if (r !== undefined) {
                                    ret.contents = Garter_Array.concat(ret.contents, [Caml_option.valFromOption(r)]);
                                    return ;
                                  }
                                  
                                }));
                        }));
                }));
        }));
  return ret.contents;
}

function combination4(a, b, c, d, f) {
  return combinationIf4(a, b, c, d, (function (x, y, z, w) {
                return Caml_option.some(f(x, y, z, w));
              }));
}

var get = Garter_Array.get;

var getExn = Garter_Array.getExn;

var set = Garter_Array.set;

var setExn = Garter_Array.setExn;

var shuffleInPlace = Garter_Array.shuffleInPlace;

var shuffle = Garter_Array.shuffle;

var reverseInPlace = Garter_Array.reverseInPlace;

var reverse = Garter_Array.reverse;

var make = Garter_Array.make;

var range = Garter_Array.range;

var rangeBy = Garter_Array.rangeBy;

var makeByU = Garter_Array.makeByU;

var makeBy = Garter_Array.makeBy;

var makeByAndShuffleU = Garter_Array.makeByAndShuffleU;

var makeByAndShuffle = Garter_Array.makeByAndShuffle;

var zip = Garter_Array.zip;

var zipByU = Garter_Array.zipByU;

var zipBy = Garter_Array.zipBy;

var unzip = Garter_Array.unzip;

var concat = Garter_Array.concat;

var concatMany = Garter_Array.concatMany;

var slice = Garter_Array.slice;

var sliceToEnd = Garter_Array.sliceToEnd;

var fill = Garter_Array.fill;

var blit = Garter_Array.blit;

var blitUnsafe = Garter_Array.blitUnsafe;

var forEachU = Garter_Array.forEachU;

var forEach = Garter_Array.forEach;

var mapU = Garter_Array.mapU;

var map = Garter_Array.map;

var flatMapU = Garter_Array.flatMapU;

var getByU = Garter_Array.getByU;

var getBy = Garter_Array.getBy;

var getIndexByU = Garter_Array.getIndexByU;

var getIndexBy = Garter_Array.getIndexBy;

var keepU = Garter_Array.keepU;

var keep = Garter_Array.keep;

var keepWithIndexU = Garter_Array.keepWithIndexU;

var keepWithIndex = Garter_Array.keepWithIndex;

var keepMapU = Garter_Array.keepMapU;

var keepMap = Garter_Array.keepMap;

var forEachWithIndexU = Garter_Array.forEachWithIndexU;

var forEachWithIndex = Garter_Array.forEachWithIndex;

var mapWithIndexU = Garter_Array.mapWithIndexU;

var mapWithIndex = Garter_Array.mapWithIndex;

var partitionU = Garter_Array.partitionU;

var partition = Garter_Array.partition;

var reduceU = Garter_Array.reduceU;

var reduce = Garter_Array.reduce;

var reduceReverseU = Garter_Array.reduceReverseU;

var reduceReverse = Garter_Array.reduceReverse;

var reduceReverse2U = Garter_Array.reduceReverse2U;

var reduceReverse2 = Garter_Array.reduceReverse2;

var reduceWithIndexU = Garter_Array.reduceWithIndexU;

var reduceWithIndex = Garter_Array.reduceWithIndex;

var joinWithU = Garter_Array.joinWithU;

var joinWith = Garter_Array.joinWith;

var someU = Garter_Array.someU;

var everyU = Garter_Array.everyU;

var every = Garter_Array.every;

var every2U = Garter_Array.every2U;

var every2 = Garter_Array.every2;

var some2U = Garter_Array.some2U;

var some2 = Garter_Array.some2;

var cmpU = Garter_Array.cmpU;

var cmp = Garter_Array.cmp;

var eqU = Garter_Array.eqU;

var eq = Garter_Array.eq;

var initU = Garter_Array.initU;

var isEmpty = Garter_Array.isEmpty;

var firstUnsafe = Garter_Array.firstUnsafe;

var firstExn = Garter_Array.firstExn;

var first = Garter_Array.first;

var lastUnsafe = Garter_Array.lastUnsafe;

var lastExn = Garter_Array.lastExn;

var takeWhileU = Garter_Array.takeWhileU;

var dropWhileU = Garter_Array.dropWhileU;

var updateUnsafeU = Garter_Array.updateUnsafeU;

var updateUnsafe = Garter_Array.updateUnsafe;

var updateExnU = Garter_Array.updateExnU;

var updateExn = Garter_Array.updateExn;

var groupBy = Garter_Array.groupBy;

var indexBy = Garter_Array.indexBy;

var frequencies = Garter_Array.frequencies;

var distinct = Garter_Array.distinct;

var scan = Garter_Array.scan;

var chunk = Garter_Array.chunk;

var randomOne = Garter_Array.randomOne;

var randomSample = Garter_Array.randomSample;

var Int = Garter_Array.Int;

var $$String = Garter_Array.$$String;

var NonEmpty = Garter_Array.NonEmpty;

var append = Garter_Array.concat;

export {
  get ,
  getExn ,
  set ,
  setExn ,
  shuffleInPlace ,
  shuffle ,
  reverseInPlace ,
  reverse ,
  make ,
  range ,
  rangeBy ,
  makeByU ,
  makeBy ,
  makeByAndShuffleU ,
  makeByAndShuffle ,
  zip ,
  zipByU ,
  zipBy ,
  unzip ,
  concat ,
  concatMany ,
  slice ,
  sliceToEnd ,
  fill ,
  blit ,
  blitUnsafe ,
  forEachU ,
  forEach ,
  mapU ,
  map ,
  flatMapU ,
  getByU ,
  getBy ,
  getIndexByU ,
  getIndexBy ,
  keepU ,
  keep ,
  keepWithIndexU ,
  keepWithIndex ,
  keepMapU ,
  keepMap ,
  forEachWithIndexU ,
  forEachWithIndex ,
  mapWithIndexU ,
  mapWithIndex ,
  partitionU ,
  partition ,
  reduceU ,
  reduce ,
  reduceReverseU ,
  reduceReverse ,
  reduceReverse2U ,
  reduceReverse2 ,
  reduceWithIndexU ,
  reduceWithIndex ,
  joinWithU ,
  joinWith ,
  someU ,
  everyU ,
  every ,
  every2U ,
  every2 ,
  some2U ,
  some2 ,
  cmpU ,
  cmp ,
  eqU ,
  eq ,
  initU ,
  isEmpty ,
  firstUnsafe ,
  firstExn ,
  first ,
  lastUnsafe ,
  lastExn ,
  takeWhileU ,
  dropWhileU ,
  updateUnsafeU ,
  updateUnsafe ,
  updateExnU ,
  updateExn ,
  groupBy ,
  indexBy ,
  frequencies ,
  distinct ,
  scan ,
  chunk ,
  randomOne ,
  randomSample ,
  Int ,
  $$String ,
  NonEmpty ,
  append ,
  head ,
  last ,
  tail ,
  init ,
  uncons ,
  singleon ,
  take ,
  takeExactly ,
  takeWhile ,
  drop ,
  dropExactly ,
  dropWhile ,
  tails ,
  some ,
  keepSome ,
  intersperse ,
  uniqBy ,
  uniq ,
  splitAt ,
  scanl ,
  flatMap ,
  arrayToOption ,
  foldLeft ,
  foldRight ,
  $$return ,
  liftM2 ,
  combinationIf2 ,
  combination2 ,
  combinationIf3 ,
  combinationArray3 ,
  combinationIf4 ,
  combination4 ,
}
/* No side effect */
