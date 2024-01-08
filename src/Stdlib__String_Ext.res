// https://www.youtube.com/watch?v=h_D4P-KRNKs&list=PLguYJK7ydFE4aS8fq4D6DqjF6qsysxTnx&index=1

//
// [dsiu] my own utils
//
let words: string => array<string> = RescriptCore.String.split(_, " ")

let first: string => string = s => s->RescriptCore.String.get(0)->RescriptCore.Option.getUnsafe

let last: string => string = s =>
  s->RescriptCore.String.get(String.length(s) - 1)->RescriptCore.Option.getUnsafe

// [TODO] implement read
// read:: Read a => String -> a
// (read "5") :: Int

// [TODO] implements unlines
// unlines:: [String] -> String
// unlines ["hello", "world"] -> "hello\nworld\n"
