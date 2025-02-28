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

// include Core__Global

// module Array = Core__Array
module Array = Stdlib__Array
module Bool = Stdlib__Bool
module Char = Stdlib__Char
//module Console = Core__Console
//module DataView = Core__DataView
//module Date = Core__Date
//module Dict = Core__Dict
//module Error = Core__Error
//module Float = Core__Float
module Float = Stdlib__Float
//module Int = Core__Int
module Int = Stdlib__Int
//module BigInt = Core__BigInt
module BigInt = Stdlib__BigInt
//module Math = Core__Math
module Math = Stdlib__Math
//module Null = Core__Null
//module Nullable = Core__Nullable
//module Object = Core__Object
//module Ordering = Core__Ordering
module Ordering = Stdlib__Ordering
//module Promise = Core__Promise
//module RegExp = Core__RegExp
//module String = Core__String
module String = Stdlib__String
//module Symbol = Core__Symbol
//module Type = Core__Type
//module JSON = Core__JSON

//module Iterator = Core__Iterator
//module AsyncIterator = Core__AsyncIterator
//module Map = Core__Map
//module WeakMap = Core__WeakMap
//module Set = Core__Set
module Set = Stdlib__Set
//module WeakSet = Core__WeakSet

//module ArrayBuffer = Core__ArrayBuffer
//module TypedArray = Core__TypedArray
//module Float32Array = Core__Float32Array
//module Float64Array = Core__Float64Array
//module Int8Array = Core__Int8Array
//module Int16Array = Core__Int16Array
//module Int32Array = Core__Int32Array
//module Uint8Array = Core__Uint8Array
//module Uint16Array = Core__Uint16Array
//module Uint32Array = Core__Uint32Array
//module Uint8ClampedArray = Core__Uint8ClampedArray
//module BigInt64Array = Core__BigInt64Array
//module BigUint64Array = Core__BigUint64Array

//module Intl = Core__Intl

module Option = Stdlib__Option
module List = Stdlib__List
module Result = Stdlib__Result
