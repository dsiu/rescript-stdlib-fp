// mirror ReScriptCore.res and extend some module with Stdlib of my own

// additional modules
module Tablecloth = Tablecloth
module Function = Stdlib_Function
module Tuple2 = Stdlib_Tuple2
module Tuple3 = Stdlib_Tuple3

// aliases for Function module
module Fn = Function
module Fun = Function

include Core__Global

// module Array = Core__Array
module Array = Stdlib_Array
module Console = Core__Console
module DataView = Core__DataView
module Date = Core__Date
module Dict = Core__Dict
module Error = Core__Error
//module Float = Core__Float
module Float = Stdlib_Float
//module Int = Core__Int
module Int = Stdlib_Int
module BigInt = Core__BigInt
module Math = Core__Math
module Null = Core__Null
module Nullable = Core__Nullable
module Object = Core__Object
module Ordering = Core__Ordering
module Promise = Core__Promise
module RegExp = Core__RegExp
//module String = Core__String
module String = Stdlib_String
module Symbol = Core__Symbol
module Type = Core__Type
module JSON = Core__JSON

module Iterator = Core__Iterator
module AsyncIterator = Core__AsyncIterator
module Map = Core__Map
module WeakMap = Core__WeakMap
module Set = Core__Set
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

type t<'a> = Js.t<'a>
module MapperRt = Js.MapperRt
module Internal = Js.Internal
module Re = Core__RegExp // needed for the %re sugar
module Exn = Js.Exn
//module Option = Core__Option
module Option = Stdlib_Option
//module List = Core__List
module List = Stdlib_List

//module Result = Stdlib_Result
module Result = Core__Result

type null<+'a> = Js.null<'a>

type undefined<+'a> = Js.undefined<'a>

type nullable<+'a> = Js.nullable<'a>

let panic = Core__Error.panic
