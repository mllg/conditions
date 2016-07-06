#' @title Functions to generate standardized warnings
#' @name std_warning
#' @rdname std_warning
#'
#' @description
#' Implementation for the following error types:
#' \itemize{
#'   \item{deprecated_warning}{Some features are deprecated.}
#'   \item{future_warning}{Something will change semantically in the future.}
#'   \item{runtime_warning}{Something else which does not fit in any other category went wrong.}
#' }
#'
#' @param message [\code{character(1)}]\cr
#'   Warning message.
#' @param subclass [\code{character}]\cr
#'   Additional classes the condition should inherit from.
#' @param call [\code{character(1)}]\cr
#'   Call stack.
#' @return [warning].
NULL

#' @rdname std_warning
#' @export
deprecated_warning = function(message, subclass = character(0L), call = sys.call(-1L)) {
  warning(condition("warning", message, c("deprecated_warning", subclass), call))
}

#' @rdname std_warning
#' @export
future_warning = function(message, subclass = character(0L), call = sys.call(-1L)) {
  warning(condition("warning", message, c("future_warning", subclass), call))
}

#' @rdname std_warning
#' @export
runtime_warning = function(message, subclass = character(0L), call = sys.call(-1L)) {
  warning(condition("warning", message, c("runtime_warning", subclass), call))
}
