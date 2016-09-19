context("as_conditions")

check_structure = function(x, classes = character(0), pattern = NULL) {
  for (cl in c(classes, "condition"))
    expect_is(x, cl)
  expect_length(x, 2)
  expect_true(setequal(names(x), c("message", "call")))
  expect_is(x$message, "character")
  expect_length(x$message, 1)
  if (!is.null(pattern))
    expect_true(grepl(pattern, x$message))
  expect_true(is.null(x$call) || is.call(x$call))
}

test_that("standardized condition converters", {
  ns = asNamespace("conditions")
  funs = ls(ns)
  funs = funs[grepl("^as_[a-z]+_(error|warning|message)", funs)]
  funs = split(funs, gsub("as_[a-z]+_((error|warning|message))", "\\1", funs))
  cond = io_message("replace me")
  as_error("foo") -> x

  for (name in funs$message) {
    f = match.fun(name)
    x = f("<grepme>")
    expect_is(x, "function")
    expect_equal(names(formals(x)), "e")
    expect_message(x(cond), "<grepme>")
  }

  for (name in funs$warning) {
    f = match.fun(name)
    x = f("<grepme>")
    expect_is(x, "function")
    expect_equal(names(formals(x)), "e")
    expect_warning(x(cond), "<grepme>")
  }

  for (name in funs$error) {
    f = match.fun(name)
    x = f("<grepme>")
    expect_is(x, "function")
    expect_equal(names(formals(x)), "e")
    expect_error(x(cond), "<grepme>")
  }
})
