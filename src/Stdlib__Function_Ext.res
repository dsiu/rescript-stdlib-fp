// Common FP utils
//
// https://kapeli.com/dash_share?docset_file=Haskell&docset_name=Haskell&path=libraries/base-4.17.0.0/Data-Function.html%23v:const&platform=haskell&repo=Main&version=9.4.3

let id: 'a => 'a = (a: 'a) => a

let eq: ('a, 'a) => bool = (x, y) => x === y
let const: ('a, 'b) => 'a = (a, _) => a
let complement = TableclothFun.negate

/** on b u x y runs the binary function b on the results of applying unary function u to two
  arguments x and y. From the opposite perspective, it transforms two inputs and combines the
  outputs.

  ((+) `on` f) x y = f x + f y

  Typical usage: sortBy (compare `on` fst).

 see: https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Function.html#v:on
*/
let on = (b, u, x, y) => b(u(x), u(y))

//let constantly = Garter.Fn.constantly
//let complement = Garter.Fn.complement

/**
 applyWhen applies a function to a value if a condition is true, otherwise, it returns the value unchanged.

 It is equivalent to flip (bool id).
*/
let applyWhen = (condition, f, x) => condition ? f(x) : x

/**
  composeU(f, g, x) = g(f(x))
 */
let composeU: ('a => 'b, 'b => 'c, 'a) => 'c = (f, g, x) => g(f(x))

/**
  compose(f,g,x) = g(f(x))
 */
let compose: ('a => 'b, 'b => 'c, 'a) => 'c = (f, g, x) => g(f(x))
/**
  composeRight(f,g,x) = f(g(x))
  */
let composeRight: ('a => 'b, 'b => 'c, 'a) => 'c = (f, g, x) => compose(g, f, x)

let compose3 = (f, g, h, x) => h(g(f(x)))
let compose4 = (f, g, h, i, x) => i(h(g(f(x))))

//let composeN = fs => {
//  fs->Array.sliceToEnd(1)->Array.reduce(fs->Array.getExn(0), (a, f) => compose(a, f))
//  open Stdlib_Array
//  fs->foldLeft(compose)
//}
