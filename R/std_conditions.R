#' @title Functions to generate standardized conditions
#' @name std_conditions
#' @rdname std_conditions
#'
#' @description
#' Implementations to generate standardized conditions:
#' \itemize{
#'   \item{assertion}{Assertion (on user input) failed.}
#'   \item{deprecated}{Feature is deprecated.}
#'   \item{dimension}{Wrong dimension.}
#'   \item{future}{Feature is subject to change in the future.}
#'   \item{index}{Subscript out of range.}
#'   \item{io}{File/directory not found or accessible.}
#'   \item{length}{Wrong length.}
#'   \item{library}{Required package not installed.}
#'   \item{lookup}{Named subelement does not exist.}
#'   \item{missing}{Missing values.}
#'   \item{name}{Failed lookup of a global variable.}
#'   \item{runtime}{Something else which does not fit in any other category went wrong.}
#'   \item{type}{Unexpected type/class.}
#'   \item{value}{Inappropriate value.}
#' }
#'
#' @param message [\code{character(1)}]\cr
#'   Condition message.
#' @param call [\code{call} || \code{NULL}]\cr
#'   Call stack.
#' @return [\code{\link[base]{condition}}].
NULL
