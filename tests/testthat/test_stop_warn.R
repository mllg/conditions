context("stop/warn called from C")

mystop = function(condition) { .Call(cstop, condition) }
mywarn = function(condition) { .Call(cwarn, condition) }

test_that("stop", {
  expect_error(mystop("foo"), "inherit")
  cond = missing_error("foo")
  expect_error(mystop(cond), "foo")

  res = tryCatch(mystop(cond),
    condition = function(c) { c }
  )
  expect_is(res, "missing_error")
  expect_is(res, "error")
})

test_that("warn", {
  expect_error(mywarn("foo"), "inherit")
  cond = missing_warning("foo")
  expect_warning(mywarn(cond), "foo")

  res = tryCatch(mywarn(cond),
    condition = function(c) { c }
  )
  expect_is(res, "missing_warning")
  expect_is(res, "warning")
})