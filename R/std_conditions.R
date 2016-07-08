#' @title Functions to generate standardized conditions
#' @name std_conditions
#' @rdname std_conditions
#'
#' @description
#' Implementations to generate standardized conditions:
#' \itemize{
#'   \item{assertion}{Thrown in assertions.}
#'   \item{type}{Unexpected type/class.}
#'   \item{length}{Unexpected length.}
#'   \item{missing}{Unexpected missing values.}
#'   \item{lookup}{Named subelement does not exist.}
#'   \item{index}{Subscript out of range.}
#'   \item{value}{Inappropriate value.}
#'   \item{name}{Failed lookup of a global variable.}
#'   \item{io}{File/directory not found or accessible.}
#'   \item{library}{Required package not installed.}
#'   \item{runtime}{Something else which does not fit in any other category went wrong.}
#'   \item{deprecated}{Some features are deprecated.}
#'   \item{future}{Something will change semantically in the future.}
#' }
#'
#' @param message [\code{character(1)}]\cr
#'   Condition message.
#' @param call [\code{call} || \code{NULL}]\cr
#'   Call stack.
#' @return [\code{\link[base]{condition}}].
NULL
