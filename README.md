# conditions

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/conditions)](https://cran.r-project.org/package=conditions)
[![Build Status](https://travis-ci.org/mllg/conditions.svg?branch=master)](https://travis-ci.org/mllg/conditions)
[![Build status](https://ci.appveyor.com/api/projects/status/19a7aulu94031hny?svg=true)](https://ci.appveyor.com/project/mllg/conditions/branch/master)
[![Coverage Status](https://img.shields.io/coveralls/mllg/conditions.svg)](https://coveralls.io/r/mllg/conditions?branch=master)

This package provides standardized conditions and allows to conveniently create own conditions.
Conditions can be caught and handled via `tryCatch`.
Consider the following small wrapper around `log(x)`:
```{r}
library(conditions)

f = function(x) {
  if (!is.numeric(x))
    stop(type_error("x must be numeric"))
  if (length(x) != 1)
    stop(length_error("x must have length 1"))
  if (any(x < 0))
    stop(value_error("x may not be negative"))
  log(x)
}
```
The functions `type_error()`, `length_error()` and `value_error()` create specialized, typed conditions which are signaled by `stop()`.
Given these types, the user can now easily react the misspecified input in a meaningful way.
For instance, to suppress the value error for negative input and instead just return `0`, the function can be called with:
```{r}
tryCatch(f(-5), value_error = function(e) 0)
```
We can simultaneously adept the behaviour of other error types, too.
Here, we additionally catch the length error, turn it into a warning and return `NA`:
```{r}
tryCatch(f(1:10),
  value_error = function(e) 0,
  length_error = function(e) { warning(e); NA })
```

Package developers are encouraged to use the standardized condition types where appropriate (all can be signaled as error, warning or message):

* `assertion`: Assertion (on user input) failed.
* `deprecated`: Feature is deprecated.
* `dimension`: Wrong dimension.
* `future`: Feature is subject to change in the future.
* `index`: Subscript out of range.
* `io`: File/directory not found or accessible.
* `length`: Wrong length.
* `library`: Required package not installed.
* `lookup`: Named subelement does not exist.
* `missing`: Missing values.
* `name`: Failed lookup of a global variable.
* `runtime`: Something else which does not fit in any other category went wrong.
* `type`: Unexpected type/class.
* `value`: Inappropriate value.

However, it is often necessary and convenient to create custom error conditions.
Lets say you want to further specialize the `missing_error` to be able to differentiate between regular `NA` values and double `NaN` values.
The function `condition_warning` constructs a warning condition with a custom type and message:
```{r}
res = mean(integer(0), na.rm = TRUE)
if (is.nan(res)) {
  warning(condition_warning("nan", "NaN produced in mean()"))
} else if (is.na(res)) {
  warning(condition_warning("missing", "Missing value produced in mean()"))
}
```

The package also assists in augmenting third party functions with specialized conditions:
```{r}
# sqrt(-1) signals a warning and returns NaN.
# Suppress the warning and instead raise a value_error
tryCatch(sqrt(-1), warning = as_value_error("sqrt of negative value"))
```

## Installation
Install via [devtools](https://cran.r-project.org/package=devtools):
```{R}
devtools::install_github("mllg/conditions")
```
