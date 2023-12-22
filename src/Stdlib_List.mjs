// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as Core__List from "@rescript/core/src/Core__List.mjs";
import * as Caml_option from "rescript/lib/es6/caml_option.js";

function last(a) {
  return Core__List.getExn(a, Core__List.length(a) - 1 | 0);
}

function singleton(__x) {
  return Core__List.make(1, __x);
}

function flatMap(xs, f) {
  return Core__List.reduce(Core__List.map(xs, f), /* [] */0, Core__List.concat);
}

function listToOption(l) {
  if (l) {
    return Caml_option.some(l.hd);
  }
  
}

function foldLeft(xs, f) {
  var init = Core__List.getExn(xs, 0);
  var rest = Core__List.tailExn(xs);
  return Core__List.reduce(rest, init, f);
}

function combinationIf2(a, b, f) {
  return Core__List.reduce(a, /* [] */0, (function (acc, x) {
                return Core__List.concat(acc, Core__List.reduce(b, /* [] */0, (function (acc, y) {
                                  var r = Curry._2(f, x, y);
                                  if (r !== undefined) {
                                    return Core__List.concat(acc, {
                                                hd: Caml_option.valFromOption(r),
                                                tl: /* [] */0
                                              });
                                  } else {
                                    return acc;
                                  }
                                })));
              }));
}

function combination2(a, b, f) {
  return combinationIf2(a, b, (function (x, y) {
                return Caml_option.some(Curry._2(f, x, y));
              }));
}

function unfold(p, g, b) {
  if (Curry._1(p, b)) {
    return /* [] */0;
  }
  var match = Curry._1(g, b);
  return {
          hd: match[0],
          tl: unfold(p, g, match[1])
        };
}

var length = Core__List.length;

var size = Core__List.size;

var head = Core__List.head;

var headExn = Core__List.headExn;

var tail = Core__List.tail;

var tailExn = Core__List.tailExn;

var add = Core__List.add;

var get = Core__List.get;

var getExn = Core__List.getExn;

var make = Core__List.make;

var makeBy = Core__List.makeBy;

var toShuffled = Core__List.toShuffled;

var drop = Core__List.drop;

var take = Core__List.take;

var splitAt = Core__List.splitAt;

var concat = Core__List.concat;

var concatMany = Core__List.concatMany;

var reverseConcat = Core__List.reverseConcat;

var flatten = Core__List.flatten;

var map = Core__List.map;

var zip = Core__List.zip;

var zipBy = Core__List.zipBy;

var mapWithIndex = Core__List.mapWithIndex;

var fromArray = Core__List.fromArray;

var toArray = Core__List.toArray;

var reverse = Core__List.reverse;

var mapReverse = Core__List.mapReverse;

var forEach = Core__List.forEach;

var forEachWithIndex = Core__List.forEachWithIndex;

var reduce = Core__List.reduce;

var reduceWithIndex = Core__List.reduceWithIndex;

var reduceReverse = Core__List.reduceReverse;

var mapReverse2 = Core__List.mapReverse2;

var forEach2 = Core__List.forEach2;

var reduce2 = Core__List.reduce2;

var reduceReverse2 = Core__List.reduceReverse2;

var every = Core__List.every;

var some = Core__List.some;

var every2 = Core__List.every2;

var some2 = Core__List.some2;

var compareLength = Core__List.compareLength;

var compare = Core__List.compare;

var equal = Core__List.equal;

var has = Core__List.has;

var getBy = Core__List.getBy;

var filter = Core__List.filter;

var filterWithIndex = Core__List.filterWithIndex;

var filterMap = Core__List.filterMap;

var partition = Core__List.partition;

var unzip = Core__List.unzip;

var getAssoc = Core__List.getAssoc;

var hasAssoc = Core__List.hasAssoc;

var removeAssoc = Core__List.removeAssoc;

var setAssoc = Core__List.setAssoc;

var sort = Core__List.sort;

var append = Core__List.concat;

export {
  length ,
  size ,
  head ,
  headExn ,
  tail ,
  tailExn ,
  add ,
  get ,
  getExn ,
  make ,
  makeBy ,
  toShuffled ,
  drop ,
  take ,
  splitAt ,
  concat ,
  concatMany ,
  reverseConcat ,
  flatten ,
  map ,
  zip ,
  zipBy ,
  mapWithIndex ,
  fromArray ,
  toArray ,
  reverse ,
  mapReverse ,
  forEach ,
  forEachWithIndex ,
  reduce ,
  reduceWithIndex ,
  reduceReverse ,
  mapReverse2 ,
  forEach2 ,
  reduce2 ,
  reduceReverse2 ,
  every ,
  some ,
  every2 ,
  some2 ,
  compareLength ,
  compare ,
  equal ,
  has ,
  getBy ,
  filter ,
  filterWithIndex ,
  filterMap ,
  partition ,
  unzip ,
  getAssoc ,
  hasAssoc ,
  removeAssoc ,
  setAssoc ,
  sort ,
  append ,
  last ,
  singleton ,
  flatMap ,
  listToOption ,
  foldLeft ,
  combinationIf2 ,
  combination2 ,
  unfold ,
}
/* No side effect */
