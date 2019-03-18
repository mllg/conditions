context("as_conditions")

test_that("standardized condition converters", {
  ns = asNamespace("conditions")
  funs = ls(ns)
  funs = funs[grepl("^as_[A-Za-z]+(Error|Warning|Message)$", funs)]
  funs = split(funs, tolower(gsub("^as_[A-Za-z]+((Error|Warning|Message))$", "\\1", funs)))
  cond = condition_message("io", "replace me")
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
