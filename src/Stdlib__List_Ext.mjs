// Generated by ReScript, PLEASE EDIT WITH CARE

import * as List from "rescript/lib/es6/List.js";
import * as TableclothList from "./Tablecloth/TableclothList.mjs";
import * as Primitive_option from "rescript/lib/es6/Primitive_option.js";

function listToOption(l) {
  if (l) {
    return Primitive_option.some(l.hd);
  }
  
}

function foldLeft(xs, f) {
  let init = List.getExn(xs, 0);
  let rest = List.tailExn(xs);
  return List.reduce(rest, init, f);
}

function transpose(_a) {
  while (true) {
    let a = _a;
    if (!a) {
      return /* [] */0;
    }
    let match = a.hd;
    if (match) {
      let match$1 = List.unzip(List.map(a.tl, y => [
        List.headExn(y),
        List.tailExn(y)
      ]));
      return {
        hd: {
          hd: match.hd,
          tl: match$1[0]
        },
        tl: transpose({
          hd: match.tl,
          tl: match$1[1]
        })
      };
    }
    _a = a.tl;
    continue;
  };
}

function combinationIf2(a, b, f) {
  return List.reduce(a, /* [] */0, (acc, x) => List.concat(acc, List.reduce(b, /* [] */0, (acc, y) => {
    let r = f(x, y);
    if (r !== undefined) {
      return List.concat(acc, {
        hd: Primitive_option.valFromOption(r),
        tl: /* [] */0
      });
    } else {
      return acc;
    }
  })));
}

function combination2(a, b, f) {
  return combinationIf2(a, b, (x, y) => Primitive_option.some(f(x, y)));
}

function unfold(p, g, b) {
  if (p(b)) {
    return /* [] */0;
  }
  let match = g(b);
  return {
    hd: match[0],
    tl: unfold(p, g, match[1])
  };
}

let L;

let zipWith = TableclothList.map2;

export {
  L,
  listToOption,
  foldLeft,
  transpose,
  zipWith,
  combinationIf2,
  combination2,
  unfold,
}
/* TableclothList Not a pure module */
