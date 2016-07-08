#' @title Generate a custom condition
#'
#' @description
#' Helper function to generate a custom \code{\link[base]{condition}}.
#'
#' @param type [\code{character(1)}]\cr
#'   Should be one of \dQuote{error}, \dQuote{warning} or \dQuote{message}.
#' @param class [\code{character}]\cr
#'   Classes for the condition.
#'   The functions \code{condition_error}, \code{condition_warning} and \code{condition_message}
#'   automatically append the respective type with an underscore (see example).
#' @param message [\code{character(1)}]\cr
#'   Information about the condition.
#' @param call [\code{call} | \code{NULL}]\cr
#'   Call stack.
#' @return [\code{condition}].
#' @export
condition = function(type, class = character(0L), message, call = sys.call(-1L)) {
  x = list(message = message, call = call)
  class(x) = c(class, type, "condition")
  x
}

#' @rdname condition
#' @export
condition_error = function(class, message, call = sys.call(-1L)) {
  condition("error", sprintf("%s_error", class), message, call)
}

#' @rdname condition
#' @export
condition_warning = function(class, message, call = sys.call(-1L)) {
  condition("warning", sprintf("%s_warning", class), message, call)
}

#' @rdname condition
#' @export
condition_message = function(class, message, call = sys.call(-1L)) {
  condition("message", sprintf("%s_message", class), message, call)
}
