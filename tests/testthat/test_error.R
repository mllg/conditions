context("errors")

test_that("errors", {
  error_classes = function(expr) tryCatch(expr, condition = function(c) head(class(c), -1))

  expect_error(assertion_error("foo"), "foo")

  expect_equal(error_classes(assertion_error("foo")), c("assertion_error", "error"))
  expect_equal(error_classes(type_error("foo", "assertion_error")), c("type_error", "assertion_error", "error"))
  expect_equal(error_classes(index_error("foo")), c("index_error", "error"))
})
