#' @title Functions to generate standardized warnings
#' @name std_warning
#' @rdname std_warning
#'
#' @description
#' Implementations to generate specialised conditions for warnings:
#' \itemize{
#'   \item{deprecated_warning}{Some features are deprecated.}
#'   \item{future_warning}{Something will change semantically in the future.}
#'   \item{runtime_warning}{Something else which does not fit in any other category went wrong.}
#' }
#'
#' @param message [\code{character(1)}]\cr
#'   Warning message.
#' @param call [\code{character(1)}]\cr
#'   Call stack.
#' @return [\code{\link[base]{condition}}].
NULL

#' @rdname std_warning
#' @export
deprecated_warning = function(message = "Generic Deprecated Warning", call = sys.call(-1L)) {
  condition("warning", message, "deprecated_warning", call)
}

#' @rdname std_warning
#' @export
future_warning = function(message = "Generic Future Warning", call = sys.call(-1L)) {
  condition("warning", message, "future_warning", call)
}

#' @rdname std_warning
#' @export
runtime_warning = function(message = "Generic Runtime Warning", call = sys.call(-1L)) {
  condition("warning", message, "runtime_warning", call)
}
