// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Stdlib__Array from "./Stdlib__Array.mjs";

function log(prim) {
  console.log(prim);
}

function log2(prim0, prim1) {
  console.log(prim0, prim1);
}

console.log(Stdlib__Array.unfoldr(10, (function (x) {
            if (x === 0) {
              return ;
            } else {
              return [
                      x,
                      x - 1 | 0
                    ];
            }
          })));

export {
  log ,
  log2 ,
}
/*  Not a pure module */
