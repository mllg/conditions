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
#' @export
assertion_error = function(message = "Generic Assertion Error", call = sys.call(-1L)) {
  condition("error", message, "assertion_error", call)
}

#' @rdname std_error
#' @export
type_error = function(message = "Generic Type Error", call = sys.call(-1L)) {
  condition("error", message, "type_error", call)
}

#' @rdname std_error
#' @export
length_error = function(message = "Generic Length Error", call = sys.call(-1L)) {
  condition("error", message, "length_error", call)
}

#' @rdname std_error
#' @export
missing_error = function(message = "Generic Missing Error", call = sys.call(-1L)) {
  condition("error", message, "missing_error", call)
}

#' @rdname std_error
#' @export
io_error = function(message = "Generic IO Error", call = sys.call(-1L)) {
  condition("error", message, "io_error", call)
}

#' @rdname std_error
#' @export
lookup_error = function(message = "Generic Lookup Error", call = sys.call(-1L)) {
  condition("error", message, "lookup_error", call)
}

#' @rdname std_error
#' @export
index_error = function(message = "Generic Index Error", call = sys.call(-1L)) {
  condition("error", message, "index_error", call)
}

#' @rdname std_error
#' @export
value_error = function(message = "Generic Value Error", call = sys.call(-1L)) {
  condition("error", message, "value_error", call)
}

#' @rdname std_error
#' @export
library_error = function(message = "Generic Library Error", call = sys.call(-1L)) {
  condition("error", message, "library_error", call)
}

#' @rdname std_error
#' @export
name_error = function(message = "Generic Name Error", call = sys.call(-1L)) {
  condition("error", message, "name_error", call)
}

#' @rdname std_error
#' @export
runtime_error = function(message = "Generic Runtime Error", call = sys.call(-1L)) {
  condition("error", message, "runtime_error", call)
}
