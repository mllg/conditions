#' @title Functions to generate standardized errors
#' @name std_error
#' @rdname std_error
#'
#' @description
#' Implementations to throw errors with the following types:
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
#' @param subclass [\code{character}]\cr
#'   Additional classes the condition should inherit from.
#' @param call [\code{character(1)}]\cr
#'   Call stack.
#' @return [raised exception].
NULL

#' @rdname std_error
#' @export
assertion_error = function(message, subclass = character(0L), call = sys.call(-1L)) {
  stop(condition("error", message, c("assertion_error", subclass), call))
}

#' @rdname std_error
#' @export
type_error = function(message, subclass = character(0L), call = sys.call(-1L)) {
  stop(condition("error", message, c("type_error", subclass), call))
}

#' @rdname std_error
#' @export
length_error = function(message, subclass = character(0L), call = sys.call(-1L)) {
  stop(condition("error", message, c("length_error", subclass), call))
}

#' @rdname std_error
#' @export
missing_error = function(message, subclass = character(0L), call = sys.call(-1L)) {
  stop(condition("error", message, c("missing_error", subclass), call))
}

#' @rdname std_error
#' @export
io_error = function(message, subclass = character(0L), call = sys.call(-1L)) {
  stop(condition("error", message, c("io_error", subclass), call))
}

#' @rdname std_error
#' @export
lookup_error = function(message, subclass = character(0L), call = sys.call(-1L)) {
  stop(condition("error", message, c("lookup_error", subclass), call))
}

#' @rdname std_error
#' @export
index_error = function(message, subclass = character(0L), call = sys.call(-1L)) {
  stop(condition("error", message, c("index_error", subclass), call))
}

#' @rdname std_error
#' @export
value_error = function(message, subclass = character(0L), call = sys.call(-1L)) {
  stop(condition("error", message, c("value_error", subclass), call))
}

#' @rdname std_error
#' @export
library_error = function(message, subclass = character(0L), call = sys.call(-1L)) {
  stop(condition("error", message, c("library_error", subclass), call))
}

#' @rdname std_error
#' @export
name_error = function(message, subclass = character(0L), call = sys.call(-1L)) {
  stop(condition("error", message, c("name_error", subclass), call))
}

#' @rdname std_error
#' @export
runtime_error = function(message, subclass = character(0L), call = sys.call(-1L)) {
  stop(condition("error", message, c("runtime_error", subclass), call))
}
