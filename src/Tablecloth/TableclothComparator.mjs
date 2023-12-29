// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as Belt_Id from "rescript/lib/es6/belt_Id.js";

function Make(M) {
  var cmp = function (a, b) {
    return Curry._2(M.compare, a, b);
  };
  var BeltComparator = Belt_Id.MakeComparableU({
        cmp: cmp
      });
  return {
          comparator: BeltComparator.cmp
        };
}

export {
  Make ,
}
/* No side effect */
