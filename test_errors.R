context("errors")

test_that("errors", {
  expect_error(stop(assertion_error()), "Generic")
  expect_error(stop(assertion_error("foo")), "foo")

  expect_equal(class(assertion_error("foo")), c("assertion_error", "error", "condition"))
  expect_equal(class(index_error()), c("index_error", "error", "condition"))
})
