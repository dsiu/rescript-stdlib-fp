// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as Core__Array from "@rescript/core/src/Core__Array.mjs";

function append(prim0, prim1) {
  return prim0.concat(prim1);
}

function headUnsafe(xs) {
  return xs[0];
}

function lastUnsafe(xs) {
  return xs[xs.length - 1 | 0];
}

function tail(__x) {
  return __x.slice(1);
}

function init(xs) {
  var l = xs.length;
  if (l === 0) {
    return ;
  } else {
    return xs.slice(0, l - 1 | 0);
  }
}

function uncons(xs) {
  if (xs.length !== 0) {
    return [
            xs[0],
            xs.slice(1)
          ];
  }
  
}

function singleton(__x) {
  return Core__Array.make(1, __x);
}

function take(xs, n) {
  var l = xs.length;
  var len = n < 0 ? 0 : (
      l < n ? l : n
    );
  return xs.slice(0, len);
}

function takeExactly(xs, n) {
  if (n < 0 || n > xs.length) {
    return ;
  } else {
    return xs.slice(0, n);
  }
}

function takeWhile(xs, predicateFn) {
  return Core__Array.reduce(xs, [], (function (acc, element) {
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
  return xs.slice(start);
}

function dropExactly(xs, n) {
  if (n < 0 || n > xs.length) {
    return ;
  } else {
    return xs.slice(n);
  }
}

function dropWhile(xs, predicateFn) {
  return Core__Array.reduce(xs, [], (function (acc, element) {
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
    return [xs].concat(tails(xs.slice(1)));
  }
}

function uniqBy(xs, uniqFn) {
  var index = 0;
  var arr = [];
  while(index < xs.length) {
    var value = xs[index];
    var alreadyAdded = arr.some((function(value){
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

function scanl(xs, initial, fn) {
  var tmp;
  if (xs.length === 0) {
    tmp = [];
  } else {
    var h = xs[0];
    var tails = xs.slice(1);
    tmp = scanl(tails, Curry._2(fn, initial, h), fn);
  }
  return [initial].concat(tmp);
}

function arrayToOption(__x) {
  return __x[0];
}

function foldl1(xs, f) {
  var init = xs[0];
  var rest = xs.slice(1);
  return Core__Array.reduce(rest, init, f);
}

function foldr1(xs, f) {
  var end = xs.length - 1 | 0;
  var init = xs[end];
  var rest = xs.slice(0, end);
  return Core__Array.reduceRight(rest, init, f);
}

function unfoldr(initial, f) {
  var _acc = [];
  var _seed = initial;
  while(true) {
    var seed = _seed;
    var acc = _acc;
    var match = Curry._1(f, seed);
    if (match === undefined) {
      return acc;
    }
    _seed = match[1];
    _acc = acc.concat([match[0]]);
    continue ;
  };
}

function $$return(x) {
  return [x];
}

function liftM2(f, m1, m2) {
  return m1.flatMap(function (x1) {
              return m2.flatMap(function (x2) {
                          return [Curry._2(f, x1, x2)];
                        });
            });
}

function combinationIf2(a, b, f) {
  var ret = {
    contents: []
  };
  a.forEach(function (x) {
        b.forEach(function (y) {
              var r = Curry._2(f, x, y);
              if (r !== undefined) {
                ret.contents = ret.contents.concat([Caml_option.valFromOption(r)]);
                return ;
              }
              
            });
      });
  return ret.contents;
}

function combination2(a, b, f) {
  return combinationIf2(a, b, (function (x, y) {
                return Caml_option.some(Curry._2(f, x, y));
              }));
}

function combinationIf3(a, b, c, f) {
  var ret = {
    contents: []
  };
  a.forEach(function (x) {
        b.forEach(function (y) {
              c.forEach(function (z) {
                    var r = Curry._3(f, x, y, z);
                    if (r !== undefined) {
                      ret.contents = ret.contents.concat([Caml_option.valFromOption(r)]);
                      return ;
                    }
                    
                  });
            });
      });
  return ret.contents;
}

function combinationArray3(a, b, c, f) {
  return combinationIf3(a, b, c, (function (x, y, z) {
                return Caml_option.some(Curry._3(f, x, y, z));
              }));
}

function combinationIf4(a, b, c, d, f) {
  var ret = {
    contents: []
  };
  a.forEach(function (x) {
        b.forEach(function (y) {
              c.forEach(function (z) {
                    d.forEach(function (w) {
                          var r = Curry._4(f, x, y, z, w);
                          if (r !== undefined) {
                            ret.contents = ret.contents.concat([Caml_option.valFromOption(r)]);
                            return ;
                          }
                          
                        });
                  });
            });
      });
  return ret.contents;
}

function combination4(a, b, c, d, f) {
  return combinationIf4(a, b, c, d, (function (x, y, z, w) {
                return Caml_option.some(Curry._4(f, x, y, z, w));
              }));
}

var makeBy = Belt_Array.makeBy;

export {
  append ,
  headUnsafe ,
  lastUnsafe ,
  tail ,
  init ,
  uncons ,
  singleton ,
  makeBy ,
  take ,
  takeExactly ,
  takeWhile ,
  drop ,
  dropExactly ,
  dropWhile ,
  tails ,
  uniqBy ,
  uniq ,
  scanl ,
  arrayToOption ,
  foldl1 ,
  foldr1 ,
  unfoldr ,
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
