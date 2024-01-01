include RescriptCore.Result

include Stdlib__Result_Ext

let mapError = (result, fn) => {
  switch result {
  | Ok(_) as ok => ok
  | Error(error) => Error(fn(error))
  }
}
