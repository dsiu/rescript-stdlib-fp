// open RescriptCore

open Stdlib
let log = Console.log

//Int.clamp(~min=1, ~max=10, 5)->Console.log
//Int.clamp(~min=10, ~max=1, 5)->Console.log
//
//let l = "hello"->String.length
Array.unfoldr(10, x => {
  x == 0 ? None : Some(x, x - 1)
})->Console.log
