include RescriptCore.String

// https://www.youtube.com/watch?v=h_D4P-KRNKs&list=PLguYJK7ydFE4aS8fq4D6DqjF6qsysxTnx&index=1
let words: string => array<string> = RescriptCore.String.split(_, " ")

// [TODO] implement read
// read:: Read a => String -> a
// (read "5") :: Int

// [TODO] implements unlines
// unlines:: [String] -> String
// unlines ["hello", "world"] -> "hello\nworld\n"
