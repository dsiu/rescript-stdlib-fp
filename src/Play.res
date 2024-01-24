// open RescriptCore

open Stdlib
let log = Console.log
let log2 = Console.log2

//Int.clamp(~min=1, ~max=10, 5)->Console.log
//Int.clamp(~min=10, ~max=1, 5)->Console.log
//
//let l = "hello"->String.length
Array.unfoldr(10, x => {
  x == 0 ? None : Some(x, x - 1)
})->Console.log

//let xss = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]
//xss->log
//xss->Array.transpose->log2("transposed", _)

//let xss = list{list{1, 2, 3, 4}, list{5, 6, 7, 8}, list{9, 10, 11, 12}}
//xss->List.transpose->List.toArray->log2("transposed", _)
