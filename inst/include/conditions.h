#ifndef _INCLUDE_CONDITIONS_H_
#define _INCLUDE_CONDITIONS_H_
#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include <R_ext/Visibility.h>

#ifdef __cplusplus
extern "C" {
#endif

SEXP attribute_hidden condition_error(const char * class, const char * message, SEXP call, ...);
SEXP attribute_hidden condition_warning(const char * class, const char * message, SEXP call, ...);
SEXP attribute_hidden condition_message(const char * class, const char * message, SEXP call, ...);
void attribute_hidden cstop(SEXP condition);
void attribute_hidden cwarn(SEXP condition);
void attribute_hidden cmessage(SEXP condition);

#ifdef __cplusplus
}
#endif

#endif
