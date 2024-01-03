// open RescriptCore

open Stdlib

Int.clamp(~min=1, ~max=10, 5)->Console.log
Int.clamp(~min=10, ~max=1, 5)->Console.log

let l = "hello"->String.length
