context("warnings")

test_that("standardized warnings", {
  funs = c("deprecated_warning", "future_warning", "runtime_warning")

  msg = "foo <grepme> bar"
  for (f in funs) {
    fun = match.fun(f)
    x = fun(msg)

    expect_is(x, c(f, "warning", "condition"))
    expect_true(grepl("<grepme>", x$message, fixed = TRUE))

    expect_true(grepl("^Generic", fun()$message))

    y = condition("warning", msg, f)
    expect_identical(x, y)
  }
})

