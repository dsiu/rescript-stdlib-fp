// Generated by ReScript, PLEASE EDIT WITH CARE


function mapError(result, fn) {
  if (result.TAG === "Ok") {
    return result;
  } else {
    return {
            TAG: "Error",
            _0: fn(result._0)
          };
  }
}

export {
  mapError ,
}
/* No side effect */
