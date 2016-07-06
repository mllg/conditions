#' @title Generate a custom condition
#'
#' @description
#' Helper function to generate a custom \code{\link[base]{condition}}.
#'
#' @param type [\code{character(1)}]\cr
#'   Should be one of \dQuote{error}, \dQuote{warning} or \dQuote{message}.
#' @param message [\code{character(1)}]\cr
#'   Information about the condition.
#' @param class [\code{character}]\cr
#'   Classes for the condition.
#' @param call [\code{character(1)}]\cr
#'   Call stack.
#' @return [\code{condition}] inheriting from dQuote{class} and \dQuote{type}.
#' @export
condition = function(type, message, class = character(0L), call = sys.call(-1L)) {
  x = list(message = message, call = call)
  class(x) = c(class, type, "condition")
  x
}
