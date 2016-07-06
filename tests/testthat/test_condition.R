context("condition constructor")

test_that("condition constructor", {
  x = condition("error", "")
  expect_is(x, "condition")
  expect_is(x, "error")
  expect_true(setequal(names(x), c("message", "call")))
  expect_is(x$message, "character")
  expect_length(x$message, 1)
  expect_true(is.null(x$call) || is.call(x$call))

  x = condition("warning", "", "custom_warning")
  expect_is(x, "condition")
  expect_is(x, "warning")
  expect_is(x, "custom_warning")
})
