#ifndef _INCLUDE_CONDITIONS_H_
#define _INCLUDE_CONDITIONS_H_
#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include <R_ext/Rdynload.h>
#include <R_ext/Visibility.h>

#ifdef __cplusplus
extern "C" {
#endif

SEXP attribute_hidden assertion_error(const char * fmt, SEXP CALL, ...);
SEXP attribute_hidden type_error(const char * fmt, SEXP CALL, ...);
SEXP attribute_hidden length_error(const char * fmt, SEXP CALL, ...);
SEXP attribute_hidden missing_error(const char * fmt, SEXP CALL, ...);
SEXP attribute_hidden lookup_error(const char * fmt, SEXP CALL, ...);
SEXP attribute_hidden index_error(const char * fmt, SEXP CALL, ...);
SEXP attribute_hidden value_error(const char * fmt, SEXP CALL, ...);
SEXP attribute_hidden name_error(const char * fmt, SEXP CALL, ...);
SEXP attribute_hidden io_error(const char * fmt, SEXP CALL, ...);
SEXP attribute_hidden library_error(const char * fmt, SEXP CALL, ...);
SEXP attribute_hidden runtime_error(const char * fmt, SEXP CALL, ...);
SEXP attribute_hidden deprecated_warning(const char * fmt, SEXP CALL, ...);
SEXP attribute_hidden future_warning(const char * fmt, SEXP CALL, ...);
SEXP attribute_hidden runtime_warning(const char * fmt, SEXP CALL, ...);

SEXP attribute_hidden signal_condition(SEXP condition);

#ifdef __cplusplus
}
#endif

#endif
