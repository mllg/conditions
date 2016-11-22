#' @title Generate a custom condition
#'
#' @description
#' \code{condition} creates a custom condition.
#' The functions \code{condition_message}, \code{condition_warning} and \code{condition_error}
#' are specialized to create conditions of type \dQuote{message}, \dQuote{warning} or \dQuote{error},
#' respectively. Furthermore, the constructors for some standardized conditions are predefined (see details).
#'
#' @details
#' The standardized conditions include:
#' \describe{
#'   \item{\dQuote{assertion}:}{Assertion (on user input) failed.}
#'   \item{\dQuote{deprecated}:}{Feature is deprecated.}
#'   \item{\dQuote{dimension}:}{Wrong dimension.}
#'   \item{\dQuote{future}:}{Feature is subject to change in the future.}
#'   \item{\dQuote{index}:}{Subscript out of range.}
#'   \item{\dQuote{io}:}{File/directory not found or accessible.}
#'   \item{\dQuote{length}:}{Wrong length.}
#'   \item{\dQuote{library}:}{Required package not installed.}
#'   \item{\dQuote{lookup}:}{Named subelement does not exist.}
#'   \item{\dQuote{missing}:}{Missing values.}
#'   \item{\dQuote{name}:}{Failed lookup of a global variable.}
#'   \item{\dQuote{runtime}:}{Something else which does not fit in any other category went wrong.}
#'   \item{\dQuote{type}:}{Unexpected type/class.}
#'   \item{\dQuote{value}:}{Inappropriate value.}
#' }
#'
#' @param type [\code{character(1)}]\cr
#'   Should be one of \dQuote{error}, \dQuote{warning} or \dQuote{message}.
#' @param class [\code{character}]\cr
#'   Class for the condition.
#'   The functions \code{condition_error}, \code{condition_warning} and \code{condition_message}
#'   automatically append the respective type with an underscore (see example).
#' @param message [\code{character(1)}]\cr
#'   Information about the condition.
#' @param call [\code{call} | \code{NULL}]\cr
#'   Call stack.
#' @param attach [ANY]\cr
#'   Object to attach to the condition. Can be accessed via \code{cond$attached}
#'   in a \code{\link[base]{tryCatch}} (see example).
#' @return [\code{condition}].
#' @export
#' @examples
#' # A simple IO error:
#' e = condition_error("io", "Failed to load file")
#' print(e)
#' class(e)
#'
#' # To signal the condition, use message/warning/stop.
#' \dontrun{
#' message(e)
#' warning(e)
#' stop(e)
#' }
#'
#' # These are equivalent (except the call):
#' w1 = condition("warning", "dimension_warning", "foo")
#' w2 = condition_warning("dimension", "foo")
#' w3 = tryCatch(dimension_warning("foo"), condition = function(e) e)
#'
#' # Attaching additional information:
#' e = condition_error("deprecated", "Function is deprecated",
#'   attach = packageVersion("conditions"))
#' e$attached
condition = function(type, class = character(0L), message, call = sys.call(-1L)) {
  x = list(message = message, call = call)
  class(x) = c(class, type, "condition")
  x
}

#' @rdname condition
#' @export
condition_error = function(class, message, call = sys.call(-1L), attach = NULL) {
  .Call(condition_error_, class, message, call, attach)
}

#' @rdname condition
#' @export
condition_warning = function(class, message, call = sys.call(-1L), attach = NULL) {
  .Call(condition_warning_, class, message, call, attach)
}

#' @rdname condition
#' @export
condition_message = function(class, message, call = sys.call(-1L), attach = NULL) {
  .Call(condition_message_, class, message, call, attach)
}
