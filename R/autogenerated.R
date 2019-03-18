#' @useDynLib conditions condition_message_
#' @rdname condition
#' @export
assertionMessage = function(message, call = sys.call(-1L), attach = NULL) {
  message(.Call(condition_message_, "assertion", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_assertionMessage = function(message = NULL) {
  as_message("assertion", message)
}

#' @useDynLib conditions condition_message_
#' @rdname condition
#' @export
deprecatedMessage = function(message, call = sys.call(-1L), attach = NULL) {
  message(.Call(condition_message_, "deprecated", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_deprecatedMessage = function(message = NULL) {
  as_message("deprecated", message)
}

#' @useDynLib conditions condition_message_
#' @rdname condition
#' @export
defunctMessage = function(message, call = sys.call(-1L), attach = NULL) {
  message(.Call(condition_message_, "defunct", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_defunctMessage = function(message = NULL) {
  as_message("defunct", message)
}

#' @useDynLib conditions condition_message_
#' @rdname condition
#' @export
dimensionMessage = function(message, call = sys.call(-1L), attach = NULL) {
  message(.Call(condition_message_, "dimension", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_dimensionMessage = function(message = NULL) {
  as_message("dimension", message)
}

#' @useDynLib conditions condition_message_
#' @rdname condition
#' @export
futureMessage = function(message, call = sys.call(-1L), attach = NULL) {
  message(.Call(condition_message_, "future", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_futureMessage = function(message = NULL) {
  as_message("future", message)
}

#' @useDynLib conditions condition_message_
#' @rdname condition
#' @export
indexMessage = function(message, call = sys.call(-1L), attach = NULL) {
  message(.Call(condition_message_, "index", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_indexMessage = function(message = NULL) {
  as_message("index", message)
}

#' @useDynLib conditions condition_message_
#' @rdname condition
#' @export
ioMessage = function(message, call = sys.call(-1L), attach = NULL) {
  message(.Call(condition_message_, "io", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_ioMessage = function(message = NULL) {
  as_message("io", message)
}

#' @useDynLib conditions condition_message_
#' @rdname condition
#' @export
lengthMessage = function(message, call = sys.call(-1L), attach = NULL) {
  message(.Call(condition_message_, "length", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_lengthMessage = function(message = NULL) {
  as_message("length", message)
}

#' @useDynLib conditions condition_message_
#' @rdname condition
#' @export
libraryMessage = function(message, call = sys.call(-1L), attach = NULL) {
  message(.Call(condition_message_, "library", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_libraryMessage = function(message = NULL) {
  as_message("library", message)
}

#' @useDynLib conditions condition_message_
#' @rdname condition
#' @export
lookupMessage = function(message, call = sys.call(-1L), attach = NULL) {
  message(.Call(condition_message_, "lookup", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_lookupMessage = function(message = NULL) {
  as_message("lookup", message)
}

#' @useDynLib conditions condition_message_
#' @rdname condition
#' @export
missingMessage = function(message, call = sys.call(-1L), attach = NULL) {
  message(.Call(condition_message_, "missing", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_missingMessage = function(message = NULL) {
  as_message("missing", message)
}

#' @useDynLib conditions condition_message_
#' @rdname condition
#' @export
nameMessage = function(message, call = sys.call(-1L), attach = NULL) {
  message(.Call(condition_message_, "name", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_nameMessage = function(message = NULL) {
  as_message("name", message)
}

#' @useDynLib conditions condition_message_
#' @rdname condition
#' @export
runtimeMessage = function(message, call = sys.call(-1L), attach = NULL) {
  message(.Call(condition_message_, "runtime", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_runtimeMessage = function(message = NULL) {
  as_message("runtime", message)
}

#' @useDynLib conditions condition_message_
#' @rdname condition
#' @export
typeMessage = function(message, call = sys.call(-1L), attach = NULL) {
  message(.Call(condition_message_, "type", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_typeMessage = function(message = NULL) {
  as_message("type", message)
}

#' @useDynLib conditions condition_message_
#' @rdname condition
#' @export
valueMessage = function(message, call = sys.call(-1L), attach = NULL) {
  message(.Call(condition_message_, "value", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_valueMessage = function(message = NULL) {
  as_message("value", message)
}

#' @useDynLib conditions condition_warning_
#' @rdname condition
#' @export
assertionWarning = function(message, call = sys.call(-1L), attach = NULL) {
  warning(.Call(condition_warning_, "assertion", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_assertionWarning = function(message = NULL) {
  as_warning("assertion", message)
}

#' @useDynLib conditions condition_warning_
#' @rdname condition
#' @export
deprecatedWarning = function(message, call = sys.call(-1L), attach = NULL) {
  warning(.Call(condition_warning_, "deprecated", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_deprecatedWarning = function(message = NULL) {
  as_warning("deprecated", message)
}

#' @useDynLib conditions condition_warning_
#' @rdname condition
#' @export
defunctWarning = function(message, call = sys.call(-1L), attach = NULL) {
  warning(.Call(condition_warning_, "defunct", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_defunctWarning = function(message = NULL) {
  as_warning("defunct", message)
}

#' @useDynLib conditions condition_warning_
#' @rdname condition
#' @export
dimensionWarning = function(message, call = sys.call(-1L), attach = NULL) {
  warning(.Call(condition_warning_, "dimension", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_dimensionWarning = function(message = NULL) {
  as_warning("dimension", message)
}

#' @useDynLib conditions condition_warning_
#' @rdname condition
#' @export
futureWarning = function(message, call = sys.call(-1L), attach = NULL) {
  warning(.Call(condition_warning_, "future", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_futureWarning = function(message = NULL) {
  as_warning("future", message)
}

#' @useDynLib conditions condition_warning_
#' @rdname condition
#' @export
indexWarning = function(message, call = sys.call(-1L), attach = NULL) {
  warning(.Call(condition_warning_, "index", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_indexWarning = function(message = NULL) {
  as_warning("index", message)
}

#' @useDynLib conditions condition_warning_
#' @rdname condition
#' @export
ioWarning = function(message, call = sys.call(-1L), attach = NULL) {
  warning(.Call(condition_warning_, "io", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_ioWarning = function(message = NULL) {
  as_warning("io", message)
}

#' @useDynLib conditions condition_warning_
#' @rdname condition
#' @export
lengthWarning = function(message, call = sys.call(-1L), attach = NULL) {
  warning(.Call(condition_warning_, "length", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_lengthWarning = function(message = NULL) {
  as_warning("length", message)
}

#' @useDynLib conditions condition_warning_
#' @rdname condition
#' @export
libraryWarning = function(message, call = sys.call(-1L), attach = NULL) {
  warning(.Call(condition_warning_, "library", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_libraryWarning = function(message = NULL) {
  as_warning("library", message)
}

#' @useDynLib conditions condition_warning_
#' @rdname condition
#' @export
lookupWarning = function(message, call = sys.call(-1L), attach = NULL) {
  warning(.Call(condition_warning_, "lookup", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_lookupWarning = function(message = NULL) {
  as_warning("lookup", message)
}

#' @useDynLib conditions condition_warning_
#' @rdname condition
#' @export
missingWarning = function(message, call = sys.call(-1L), attach = NULL) {
  warning(.Call(condition_warning_, "missing", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_missingWarning = function(message = NULL) {
  as_warning("missing", message)
}

#' @useDynLib conditions condition_warning_
#' @rdname condition
#' @export
nameWarning = function(message, call = sys.call(-1L), attach = NULL) {
  warning(.Call(condition_warning_, "name", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_nameWarning = function(message = NULL) {
  as_warning("name", message)
}

#' @useDynLib conditions condition_warning_
#' @rdname condition
#' @export
runtimeWarning = function(message, call = sys.call(-1L), attach = NULL) {
  warning(.Call(condition_warning_, "runtime", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_runtimeWarning = function(message = NULL) {
  as_warning("runtime", message)
}

#' @useDynLib conditions condition_warning_
#' @rdname condition
#' @export
typeWarning = function(message, call = sys.call(-1L), attach = NULL) {
  warning(.Call(condition_warning_, "type", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_typeWarning = function(message = NULL) {
  as_warning("type", message)
}

#' @useDynLib conditions condition_warning_
#' @rdname condition
#' @export
valueWarning = function(message, call = sys.call(-1L), attach = NULL) {
  warning(.Call(condition_warning_, "value", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_valueWarning = function(message = NULL) {
  as_warning("value", message)
}

#' @useDynLib conditions condition_error_
#' @rdname condition
#' @export
assertionError = function(message, call = sys.call(-1L), attach = NULL) {
  stop(.Call(condition_error_, "assertion", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_assertionError = function(message = NULL) {
  as_error("assertion", message)
}

#' @useDynLib conditions condition_error_
#' @rdname condition
#' @export
deprecatedError = function(message, call = sys.call(-1L), attach = NULL) {
  stop(.Call(condition_error_, "deprecated", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_deprecatedError = function(message = NULL) {
  as_error("deprecated", message)
}

#' @useDynLib conditions condition_error_
#' @rdname condition
#' @export
defunctError = function(message, call = sys.call(-1L), attach = NULL) {
  stop(.Call(condition_error_, "defunct", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_defunctError = function(message = NULL) {
  as_error("defunct", message)
}

#' @useDynLib conditions condition_error_
#' @rdname condition
#' @export
dimensionError = function(message, call = sys.call(-1L), attach = NULL) {
  stop(.Call(condition_error_, "dimension", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_dimensionError = function(message = NULL) {
  as_error("dimension", message)
}

#' @useDynLib conditions condition_error_
#' @rdname condition
#' @export
futureError = function(message, call = sys.call(-1L), attach = NULL) {
  stop(.Call(condition_error_, "future", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_futureError = function(message = NULL) {
  as_error("future", message)
}

#' @useDynLib conditions condition_error_
#' @rdname condition
#' @export
indexError = function(message, call = sys.call(-1L), attach = NULL) {
  stop(.Call(condition_error_, "index", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_indexError = function(message = NULL) {
  as_error("index", message)
}

#' @useDynLib conditions condition_error_
#' @rdname condition
#' @export
ioError = function(message, call = sys.call(-1L), attach = NULL) {
  stop(.Call(condition_error_, "io", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_ioError = function(message = NULL) {
  as_error("io", message)
}

#' @useDynLib conditions condition_error_
#' @rdname condition
#' @export
lengthError = function(message, call = sys.call(-1L), attach = NULL) {
  stop(.Call(condition_error_, "length", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_lengthError = function(message = NULL) {
  as_error("length", message)
}

#' @useDynLib conditions condition_error_
#' @rdname condition
#' @export
libraryError = function(message, call = sys.call(-1L), attach = NULL) {
  stop(.Call(condition_error_, "library", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_libraryError = function(message = NULL) {
  as_error("library", message)
}

#' @useDynLib conditions condition_error_
#' @rdname condition
#' @export
lookupError = function(message, call = sys.call(-1L), attach = NULL) {
  stop(.Call(condition_error_, "lookup", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_lookupError = function(message = NULL) {
  as_error("lookup", message)
}

#' @useDynLib conditions condition_error_
#' @rdname condition
#' @export
missingError = function(message, call = sys.call(-1L), attach = NULL) {
  stop(.Call(condition_error_, "missing", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_missingError = function(message = NULL) {
  as_error("missing", message)
}

#' @useDynLib conditions condition_error_
#' @rdname condition
#' @export
nameError = function(message, call = sys.call(-1L), attach = NULL) {
  stop(.Call(condition_error_, "name", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_nameError = function(message = NULL) {
  as_error("name", message)
}

#' @useDynLib conditions condition_error_
#' @rdname condition
#' @export
runtimeError = function(message, call = sys.call(-1L), attach = NULL) {
  stop(.Call(condition_error_, "runtime", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_runtimeError = function(message = NULL) {
  as_error("runtime", message)
}

#' @useDynLib conditions condition_error_
#' @rdname condition
#' @export
typeError = function(message, call = sys.call(-1L), attach = NULL) {
  stop(.Call(condition_error_, "type", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_typeError = function(message = NULL) {
  as_error("type", message)
}

#' @useDynLib conditions condition_error_
#' @rdname condition
#' @export
valueError = function(message, call = sys.call(-1L), attach = NULL) {
  stop(.Call(condition_error_, "value", message, call, attach, PACKAGE = "conditions"))
}

#' @rdname as_condition
#' @export
as_valueError = function(message = NULL) {
  as_error("value", message)
}

