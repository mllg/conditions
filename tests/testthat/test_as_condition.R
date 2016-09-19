context("as_conditions")

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
