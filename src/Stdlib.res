// mirror ReScriptCore.res and extend some module with Stdlib of my own

// additional modules
module Tablecloth = Tablecloth // should remove Tablecloth
module Function = Stdlib__Function
module Tuple2 = Stdlib__Tuple2
module Tuple3 = Stdlib__Tuple3
module Tuple4 = Stdlib__Tuple4

// aliases for Function module
module Fn = Function
module Fun = Function

include Core__Global

// module Array = Core__Array
module Array = Stdlib__Array
module Bool = Stdlib__Bool
module Char = Stdlib__Char
module Console = Core__Console
module DataView = Core__DataView
module Date = Core__Date
module Dict = Core__Dict
module Error = Core__Error
//module Float = Core__Float
module Float = Stdlib__Float
//module Int = Core__Int
module Int = Stdlib__Int
//module BigInt = Core__BigInt
module BigInt = Stdlib__BigInt
//module Math = Core__Math
module Math = Stdlib__Math
module Null = Core__Null
module Nullable = Core__Nullable
module Object = Core__Object
//module Ordering = Core__Ordering
module Ordering = Stdlib__Ordering
module Promise = Core__Promise
module RegExp = Core__RegExp
//module String = Core__String
module String = Stdlib__String
module Symbol = Core__Symbol
module Type = Core__Type
module JSON = Core__JSON

module Iterator = Core__Iterator
module AsyncIterator = Core__AsyncIterator
module Map = Core__Map
module WeakMap = Core__WeakMap
//module Set = Core__Set
module Set = Stdlib__Set
module WeakSet = Core__WeakSet

module ArrayBuffer = Core__ArrayBuffer
module TypedArray = Core__TypedArray
module Float32Array = Core__Float32Array
module Float64Array = Core__Float64Array
module Int8Array = Core__Int8Array
module Int16Array = Core__Int16Array
module Int32Array = Core__Int32Array
module Uint8Array = Core__Uint8Array
module Uint16Array = Core__Uint16Array
module Uint32Array = Core__Uint32Array
module Uint8ClampedArray = Core__Uint8ClampedArray
module BigInt64Array = Core__BigInt64Array
module BigUint64Array = Core__BigUint64Array

module Intl = Core__Intl

@val external window: Dom.window = "window"
@val external document: Dom.document = "document"
@val external globalThis: {..} = "globalThis"

external null: Core__Nullable.t<'a> = "#null"
external undefined: Core__Nullable.t<'a> = "#undefined"
external typeof: 'a => Core__Type.t = "#typeof"

/**
`import(value)` dynamically import a value or function from a ReScript
module. The import call will return a `promise`, resolving to the dynamically loaded
value.

## Examples

`Core__Array.res` file:

```rescript
@send external indexOf: (array<'a>, 'a) => int = "indexOf"

let indexOfOpt = (arr, item) =>
  switch arr->indexOf(item) {
  | -1 => None
  | index => Some(index)
  }
```
In other file you can import the `indexOfOpt` value defined in `Core__Array.res`

```rescript
let main = async () => {
  let indexOfOpt = await import(Core__Array.indexOfOpt)
  let index = indexOfOpt([1, 2], 2)
  Console.log(index)
}
```

Compiles to:

```javascript
async function main() {
  var add = await import("./Core__Array.mjs").then(function(m) {
    return m.indexOfOpt;
  });
  var index = indexOfOpt([1, 2], 2);
  console.log(index);
}
```
*/
external import: 'a => promise<'a> = "#import"

type t<'a> = Js.t<'a>
module MapperRt = Js.MapperRt
module Internal = Js.Internal
module Re = Core__RegExp // needed for the %re sugar
module Exn = Js.Exn
//module Option = Core__Option
module Option = Stdlib__Option
//module List = Core__List
module List = Stdlib__List
//module Result = Core__Result
module Result = Stdlib__Result

type null<+'a> = Js.null<'a>

type undefined<+'a> = Js.undefined<'a>

type nullable<+'a> = Js.nullable<'a>

let panic = Core__Error.panic
