capitalize = function(x) {
  substr(x, 1L, 1L) = toupper(substr(x, 1L, 1L))
  x
}
