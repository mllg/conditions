context("errors")

test_that("standardized errors", {
  funs = c("assertion_error", "assertion_error", "index_error", "io_error", "length_error", "library_error", "lookup_error", "missing_error", "name_error", "runtime_error", "type_error", "value_error")

  msg = "foo <grepme> bar"
  for (f in funs) {
    fun = match.fun(f)
    x = fun(msg)

    expect_is(x, c(f, "error", "condition"))
    expect_true(grepl("<grepme>", x$message, fixed = TRUE))

    expect_true(grepl("^Generic", fun()$message))

    y = condition("error", msg, f)
    expect_identical(x, y)
  }
})
