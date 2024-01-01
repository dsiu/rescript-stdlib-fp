open Stdlib

open Jest
open Expect

open String
testAll("fromChar", list{('a', "a"), ('z', "z"), (' ', " "), ('\n', "\n")}, ((char, string)) =>
  expect(fromChar(char))->toEqual(string)
)
describe("fromArray", () => {
  test("creates an empty string from an empty array", () => expect(fromArray([]))->toEqual(""))
  test("creates a string of characters", () =>
    expect(fromArray(['K', 'u', 'b', 'o']))->toEqual("Kubo")
  )
  test("creates a string of characters", () =>
    expect(fromArray([' ', '\n', '\t']))->toEqual(" \n\t")
  )
})
describe("indexOfOpt", () => {
  test("returns some index of the first matching substring", () =>
    expect(indexOfOpt("hello", "h"))->toEqual(Some(0))
  )
  test("returns the first index even though multiple present", () =>
    expect(indexOfOpt("hellh", "h"))->toEqual(Some(0))
  )
  test("returns first substring that matches with multiple characters", () =>
    expect(indexOfOpt("hellh", "ell"))->toEqual(Some(1))
  )
  test("returns None when no substring matches", () =>
    expect(indexOfOpt("hello", "xy"))->toEqual(None)
  )
})
describe("lastIndexOfOpt", () => {
  test("returns some index of the last matching string", () =>
    expect(lastIndexOfOpt("helloh", "oh"))->toEqual(Some(4))
  )
  test("returns the last index even though multiple present", () =>
    expect(lastIndexOfOpt("ohelloh", "oh"))->toEqual(Some(5))
  )
  test("returns None when no character matches", () =>
    expect(lastIndexOfOpt("hello", "x"))->toEqual(None)
  )
})
describe("fromList", () => {
  test("creates an empty string from an empty array", () => expect(fromList(list{}))->toEqual(""))
  test("creates a string of characters", () =>
    expect(fromList(list{'K', 'u', 'b', 'o'}))->toEqual("Kubo")
  )
  test("creates a string of characters", () =>
    expect(fromList(list{' ', '\n', '\t'}))->toEqual(" \n\t")
  )
})
describe("repeat", () => {
  test("returns an empty string for count zero", () => expect(repeat("bun", 0))->toEqual(""))
  test("raises for negative count", () => toThrow(expect(() => repeat("bun", -1))))
  test("returns the input string repeated count times", () =>
    expect(repeat("bun", 3))->toEqual("bunbunbun")
  )
})
describe("initialize", () => {
  test("returns an empty string for count zero", () =>
    expect(initialize(0, ~f=i => Fun.constant('A', i)))->toEqual("")
  )
  test("raises for negative count", () =>
    toThrow(expect(() => initialize(-1, ~f=i => Fun.constant('A', i))))
  )
  test("returns the input string repeated count times", () =>
    expect(initialize(3, ~f=i => Fun.constant('A', i)))->toEqual("AAA")
  )
})
describe("isEmpty", () => {
  test("true for zero length string", () => expect(isEmpty(""))->toEqual(true))
  testAll("false for length > 0 strings", list{"abc", " ", "\n"}, string =>
    expect(isEmpty(string))->toEqual(false)
  )
})
test("length empty string", () => expect(String.length(""))->toEqual(0))
test("length", () => expect(String.length("123"))->toEqual(3))
test("reverse empty string", () => expect(String.reverse(""))->toEqual(""))
test("reverse", () => expect(String.reverse("stressed"))->toEqual("desserts"))
describe("split", () => {
  test("middle", () => expect(String.split("abc", "b"))->toEqual(["a", "c"]))
  test("start", () => expect(String.split("ab", "a"))->toEqual(["", "b"]))
  test("end", () => expect(String.split("ab", "b"))->toEqual(["a", ""]))
})
describe("insertAt", () => {
  test("middle", () => expect(String.insertAt("abcde", ~value="**", ~index=2))->toEqual("ab**cde"))
  test("start", () => expect(String.insertAt("abcde", ~value="**", ~index=0))->toEqual("**abcde"))
  test("end", () => expect(String.insertAt("abcde", ~value="**", ~index=5))->toEqual("abcde**"))
  test("negative", () =>
    expect(String.insertAt("abcde", ~value="**", ~index=-2))->toEqual("abc**de")
  )
  test("negative overflow", () =>
    expect(String.insertAt("abcde", ~value="**", ~index=-9))->toEqual("**abcde")
  )
  test("overflow", () =>
    expect(String.insertAt("abcde", ~value="**", ~index=9))->toEqual("abcde**")
  )
})
test("toArray", () =>
  expect(String.toArray("Standard"))->toEqual(['S', 't', 'a', 'n', 'd', 'a', 'r', 'd'])
)
test("toList", () =>
  expect(String.toList("Standard"))->toEqual(list{'S', 't', 'a', 'n', 'd', 'a', 'r', 'd'})
)

describe("capitalize", () => {
  test("should convert the first character to uppercase", () => {
    let result = capitalize("hello")
    expect(result)->toEqual("Hello")
  })

  test("should leave the rest of the string unchanged", () => {
    let result = capitalize("hello WORLD")
    expect(result)->toEqual("Hello WORLD")
  })

  test("should handle empty strings", () => {
    let result = capitalize("")
    expect(result)->toEqual("")
  })

  test("should handle strings with one character", () => {
    let result = capitalize("h")
    expect(result)->toEqual("H")
  })

  test("should handle strings with only uppercase characters", () => {
    let result = capitalize("HELLO")
    expect(result)->toEqual("HELLO")
  })
})

describe("uncapitalize", () => {
  test("should convert the first character to lowercase", () => {
    let result = uncapitalize("Hello")
    expect(result)->toEqual("hello")
  })

  test("should leave the rest of the string unchanged", () => {
    let result = uncapitalize("HELLO")
    expect(result)->toEqual("hELLO")
  })

  test("should handle empty strings", () => {
    let result = uncapitalize("")
    expect(result)->toEqual("")
  })

  test("should handle strings with one character", () => {
    let result = uncapitalize("H")
    expect(result)->toEqual("h")
  })

  test("should handle strings with only lowercase characters", () => {
    let result = uncapitalize("hello")
    expect(result)->toEqual("hello")
  })
})

describe("dropLeft", () => {
  test("should drop the specified number of characters from the left", () => {
    let result = dropLeft("Hello, world!", ~count=7)
    expect(result)->toEqual("world!")
  })

  test("should return an empty string when count is equal to string length", () => {
    let result = dropLeft("Hello, world!", ~count=13)
    expect(result)->toEqual("")
  })

  test("should return the original string when count is zero", () => {
    let result = dropLeft("Hello, world!", ~count=0)
    expect(result)->toEqual("Hello, world!")
  })

  test("should handle empty strings", () => {
    let result = dropLeft("", ~count=5)
    expect(result)->toEqual("")
  })

  test("should return an empty string when count is greater than string length", () => {
    let result = dropLeft("Hello, world!", ~count=20)
    expect(result)->toEqual("")
  })
})

describe("dropRight", () => {
  test("should drop the specified number of characters from the right", () => {
    let result = dropRight("Hello, world!", ~count=7)
    expect(result)->toEqual("Hello,")
  })

  test("should return the original string when count is less than 1", () => {
    let result = dropRight("Hello, world!", ~count=0)
    expect(result)->toEqual("Hello, world!")
  })

  test("should handle empty strings", () => {
    let result = dropRight("", ~count=5)
    expect(result)->toEqual("")
  })

  test("should return an empty string when count is equal to string length", () => {
    let result = dropRight("Hello, world!", ~count=13)
    expect(result)->toEqual("")
  })

  test("should return an empty string when count is greater than string length", () => {
    let result = dropRight("Hello, world!", ~count=20)
    expect(result)->toEqual("")
  })
})

describe("forEach", () => {
  test("should call the provided function for each character in the string", () => {
    let count = ref(0)
    let f = _ => count := count.contents + 1
    forEach("Hello", ~f)
    expect(count.contents)->toEqual(5)
  })

  test("should not call the function for an empty string", () => {
    let count = ref(0)
    let f = _ => count := count.contents + 1
    forEach("", ~f)
    expect(count.contents)->toEqual(0)
  })

  test("should call the function with the correct arguments", () => {
    let result = ref([])
    let f = ch => result := Array.concat([ch], result.contents)
    forEach("Hello", ~f)
    expect(result.contents)->toEqual(['o', 'l', 'l', 'e', 'H'])
  })
})

describe("fold", () => {
  test("should reduce string to a single value", () => {
    let result = "abc"->fold(~initial=0, ~f=(acc, ch) => acc + Char.toCode(ch))
    expect(result)->toEqual(294) // 97 (a) + 98 (b) + 99 (c) = 294
  })

  test("should handle empty string", () => {
    let result = ""->fold(~initial=0, ~f=(acc, ch) => acc + Char.toCode(ch))
    expect(result)->toEqual(0)
  })

  test("should handle large strings", () => {
    let largeString = initialize(10000, ~f=Fn.constant('a'))
    let result = largeString->fold(~initial=0, ~f=(acc, ch) => acc + Char.toCode(ch))
    expect(result)->toEqual(970000) // 97 (a) * 10000 = 970000
  })
})
