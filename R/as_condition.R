#' @title Convert Conditions
#'
#' @description
#' These functions are intended to change the class of conditions.
#' This is especially useful in combination with \code{\link[base]{tryCatch}}.
#' See \code{\link{condition}} for a short explanation about the predefined
#' condition classes.
#'
#' @param class [\code{character}]\cr
#'   New classes for the condition.
#' @param message [\code{character}]\cr
#'   If provided, overwrites the original condition message.
#' @return [\code{function}]. Returns a function which takes a condition as first
#'   argument, creates a new condition of the respective type and signals the created
#'   condition with \code{\link[base]{message}}, \code{\link[base]{warning}} or
#'   \code{\link[base]{stop}}, respectively.
#' @export
#' @rdname as_condition
#' @examples
#' \dontrun{
#' # Turn the warning of sqrt() into a value error
#' tryCatch(sqrt(-1), warning = as_error("value"))
#' tryCatch(sqrt(-1), warning = as_value_error("sqrt of negative value"))
#' }
as_message = function(class, message = NULL) {
  force(class)
  force(message)
  function(e) {
    stopifnot(is_condition(e))
    message(.Call(condition_message_, class, message %??% e$message, e$call))
  }
}

#' @export
#' @rdname as_condition
as_warning = function(class, message = NULL) {
  force(class)
  force(message)
  function(e) {
    stopifnot(is_condition(e))
    warning(.Call(condition_warning_, class, message %??% e$message, e$call))
  }
}

#' @export
#' @rdname as_condition
as_error = function(class, message = NULL) {
  force(class)
  force(message)
  function(e) {
    stopifnot(is_condition(e))
    stop(.Call(condition_error_, class, message %??% e$message, e$call))
  }
}
