# conditions

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/conditions)](http://cran.r-project.org/package=conditions)
[![Build Status](https://travis-ci.org/mllg/conditions.svg?branch=master)](https://travis-ci.org/mllg/conditions)
[![Build status](https://ci.appveyor.com/api/projects/status/19a7aulu94031hny?svg=true)](https://ci.appveyor.com/project/mllg/conditions/branch/master)
[![Coverage Status](https://img.shields.io/coveralls/mllg/conditions.svg)](https://coveralls.io/r/mllg/conditions?branch=master)

## Standardized conditions for R

Provides standardized conditions and allows to conveniently create own conditions.
Conditions can be caught and handled via `tryCatch`:

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

# ignore value errors, instead just set to 0
res = tryCatch(f(-5),
  value_error = function(c) 0
)

print(res)
```
