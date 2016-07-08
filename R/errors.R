#' @title Functions to generate standardized errors
#' @name std_error
#' @rdname std_error
#'
#' @description
#' Implementations to generate specialised conditions for errors:
#' \itemize{
#'   \item{assertion_error}{Thrown in assertions.}
#'   \item{type_error}{Unexpected type/class.}
#'   \item{length_error}{Unexpected length.}
#'   \item{missing_error}{Unexpected missing values.}
#'   \item{lookup_error}{Named subelement does not exist.}
#'   \item{index_error}{Subscript out of range.}
#'   \item{value_error}{Inappropriate value.}
#'   \item{name_error}{Failed lookup of a global variable.}
#'   \item{io_error}{File/directory not found or accessible.}
#'   \item{library_error}{Required package not installed.}
#'   \item{runtime_error}{Something else which does not fit in any other category went wrong.}
#' }
#'
#' @param message [\code{character(1)}]\cr
#'   Error message.
#' @param call [\code{character(1)}]\cr
#'   Call stack.
#' @return [\code{\link[base]{condition}}].
NULL

#' @rdname std_error
#' @useDynLib conditions assertion_error_
#' @export
assertion_error = function(message = "Generic Assertion Error", call = sys.call(-1L)) {
  .Call(assertion_error_, message, call)
}

#' @rdname std_error
#' @useDynLib conditions type_error_
#' @export
type_error = function(message = "Generic Type Error", call = sys.call(-1L)) {
  .Call(type_error_, message, call)
}

#' @rdname std_error
#' @useDynLib conditions length_error_
#' @export
length_error = function(message = "Generic Length Error", call = sys.call(-1L)) {
  .Call(length_error_, message, call)
}

#' @rdname std_error
#' @useDynLib conditions missing_error_
#' @export
missing_error = function(message = "Generic Missing Error", call = sys.call(-1L)) {
  .Call(missing_error_, message, call)
}

#' @rdname std_error
#' @useDynLib conditions io_error_
#' @export
io_error = function(message = "Generic IO Error", call = sys.call(-1L)) {
  .Call(io_error_, message, call)
}

#' @rdname std_error
#' @useDynLib conditions lookup_error_
#' @export
lookup_error = function(message = "Generic Lookup Error", call = sys.call(-1L)) {
  .Call(lookup_error_, message, call)
}

#' @rdname std_error
#' @useDynLib conditions index_error_
#' @export
index_error = function(message = "Generic Index Error", call = sys.call(-1L)) {
  .Call(index_error_, message, call)
}

#' @rdname std_error
#' @useDynLib conditions value_error_
#' @export
value_error = function(message = "Generic Value Error", call = sys.call(-1L)) {
  .Call(value_error_, message, call)
}

#' @rdname std_error
#' @useDynLib conditions library_error_
#' @export
library_error = function(message = "Generic Library Error", call = sys.call(-1L)) {
  .Call(library_error_, message, call)
}

#' @rdname std_error
#' @useDynLib conditions name_error_
#' @export
name_error = function(message = "Generic Name Error", call = sys.call(-1L)) {
  .Call(name_error_, message, call)
}

#' @rdname std_error
#' @useDynLib conditions runtime_error_
#' @export
runtime_error = function(message = "Generic Runtime Error", call = sys.call(-1L)) {
  .Call(runtime_error_, message, call)
}
