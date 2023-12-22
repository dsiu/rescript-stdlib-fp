// Common FP utils
//
// https://kapeli.com/dash_share?docset_file=Haskell&docset_name=Haskell&path=libraries/base-4.17.0.0/Data-Function.html%23v:const&platform=haskell&repo=Main&version=9.4.3

let identity: 'a => 'a = (a: 'a) => a
let eq: ('a, 'a) => bool = (x, y) => x === y
let const: ('a, 'b) => 'a = (a, _) => a
let flip = (f, left, right) => f(right, left)

let constantly = Garter.Fn.constantly
let complement = Garter.Fn.complement

/**
  composeU(f, g, x) = g(f(x))
 */
let composeU: ('a => 'b, 'b => 'c, 'a) => 'c = (f, g, x) => g(f(x))

/**
  compose(f,g,x) = g(f(x))
 */
let compose: ('a => 'b, 'b => 'c) => 'a => 'c = (f, g) => x => g(f(x))

let compose3 = (f, g, h, x) => h(g(f(x)))
let compose4 = (f, g, h, i, x) => i(h(g(f(x))))

let composeN = fs => {
  //  fs->Array.sliceToEnd(1)->Array.reduce(fs->Array.getExn(0), (a, f) => compose(a, f))
  open Stdlib_Array
  fs->foldLeft(compose)
}
