context("stop/warn called from C")

cstop = function(condition) {
  .Call(stop_, condition)
}

cwarn = function(condition) {
  .Call(warn_, condition)
}

test_that("stop", {
  expect_error(cstop("foo"), "inherit")
  cond = missing_error("foo")
  expect_error(cstop(cond), "foo")

  res = tryCatch(cstop(cond),
    condition = function(c) { c }
  )
  expect_is(res, "missing_error")
  expect_is(res, "error")
})

test_that("warn", {
  expect_error(cwarn("foo"), "inherit")
  cond = missing_warning("foo")
  expect_warning(cwarn(cond), "foo")

  res = tryCatch(cwarn(cond),
    condition = function(c) { c }
  )
  expect_is(res, "missing_warning")
  expect_is(res, "warning")
})
