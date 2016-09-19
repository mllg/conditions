"%??%" = function(lhs, rhs) {
  if (is.null(lhs)) rhs else lhs
}

is_condition = function(cond) {
  inherits(cond, "condition")
}
