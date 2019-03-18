# conditions

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/conditions)](https://cran.r-project.org/package=conditions)
[![Build Status](https://travis-ci.org/mllg/conditions.svg?branch=master)](https://travis-ci.org/mllg/conditions)
[![Build status](https://ci.appveyor.com/api/projects/status/19a7aulu94031hny?svg=true)](https://ci.appveyor.com/project/mllg/conditions/branch/master)
[![Coverage Status](https://img.shields.io/coveralls/mllg/conditions.svg)](https://coveralls.io/r/mllg/conditions?branch=master)

## Installation
Install via [devtools](https://cran.r-project.org/package=devtools):
```{R}
devtools::install_github("mllg/conditions")
```

## Base functionality

This package provides some standardized conditions and allows to conveniently create own conditions.
Conditions can be caught and handled via `tryCatch`.
Consider the following small wrapper function around `log(x)`:

```{r}
library(conditions)

f = function(x) {
  if (!is.numeric(x))
    typeError("x must be numeric")
  if (length(x) != 1)
    lengthError("x must have length 1")
  if (any(x < 0))
    valueError("x may not be negative")
  log(x)
}
```
The functions `typeError()`, `lengthError()` and `valueError()` create specialized conditions which are signaled using `stop()`.
By giving conditions a more specific type, the user can react in a meaningful way.
For instance, to suppress the value error for negative input and instead just return `0`, the function can be called with:
```{r}
tryCatch(f(-5), valueError = function(e) 0)
```
Here, we additionally catch the length error, turn it into a warning and return `NA`:
```{r}
tryCatch(f(1:10),
  valueError = function(e) 0,
  lengthError = function(e) { warning(e); NA })
```

It is also possible to catch warnings and messages, as illustrated here:
```{r}
f = function(x) {
  if (x %% 2)
    valueWarning("foo")
  else
    valueMessage("bar")
}

tryCatch(f(1),
  valueWarning = function(e) paste("Catched warning:", e$message),
  valueMessage = function(e) paste("Catched message:", e$message)
)
```


## Standardized conditions

The package comes with some standardized condition types, as derived from [Python exceptions](https://docs.python.org/2/library/exceptions.html)).
Note that it is an ongoing effort to form a working group to define more/other types, with a hierarchical structure (see [here](https://github.com/RConsortium/wishlist/issues/6)).
As a consequence, some types implemented in this package might get deprecated in the future.

* `assertion`: Assertion (on user input) failed.
* `deprecated`: Feature is deprecated. See `.Deprecated`.
* `defunct`: Feature is defunct. See `.Defunct`.
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

All conditions come as error, warning and message, and the package provides constructors for each class (e.g., `libraryError()`, `valueWarning()` or `deprecatedMessage()`).


## Custom conditions

It is often both necessary and convenient to create custom error conditions.
Lets say you want to further specialize the `missing_error` to be able to differentiate between regular `NA` values and double `NaN` values.
The function `conditionWarning` constructs a warning condition with a custom type and message (here we use `NaNWarning` and `NA_warning`):
```{r}
res = mean(integer(0), na.rm = TRUE)
if (is.nan(res)) {
  condition_warning("NaN", "NaN produced in mean()")
} else if (is.na(res)) {
  condition_warning("NA", "NA values produced in mean()")
}
```

The package also assists in augmenting third party functions with specialized conditions:
```{r}
# sqrt(-1) signals a warning and returns NaN.
# Suppress the warning and instead raise a valueError
tryCatch(sqrt(-1), warning = as_valueError("sqrt of negative value"))
```


## Raising custom conditions from compiled code

You can link against `conditions` from C/C++ to use the functions exported [here](https://github.com/mllg/conditions/blob/master/inst/include/conditions.h).
