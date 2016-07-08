#ifndef CONDITIONS_STD_CONDITIONS_H_
#define CONDITIONS_STD_CONDITIONS_H_

#include <R.h>
#include <Rinternals.h>
SEXP assertion_error_(SEXP message, SEXP call);
SEXP assertion_error(const char * message, SEXP call);
SEXP type_error_(SEXP message, SEXP call);
SEXP type_error(const char * message, SEXP call);
SEXP length_error_(SEXP message, SEXP call);
SEXP length_error(const char * message, SEXP call);
SEXP missing_error_(SEXP message, SEXP call);
SEXP missing_error(const char * message, SEXP call);
SEXP lookup_error_(SEXP message, SEXP call);
SEXP lookup_error(const char * message, SEXP call);
SEXP index_error_(SEXP message, SEXP call);
SEXP index_error(const char * message, SEXP call);
SEXP value_error_(SEXP message, SEXP call);
SEXP value_error(const char * message, SEXP call);
SEXP name_error_(SEXP message, SEXP call);
SEXP name_error(const char * message, SEXP call);
SEXP io_error_(SEXP message, SEXP call);
SEXP io_error(const char * message, SEXP call);
SEXP library_error_(SEXP message, SEXP call);
SEXP library_error(const char * message, SEXP call);
SEXP runtime_error_(SEXP message, SEXP call);
SEXP runtime_error(const char * message, SEXP call);
SEXP deprecated_warning_(SEXP message, SEXP call);
SEXP deprecated_warning(const char * message, SEXP call);
SEXP future_warning_(SEXP message, SEXP call);
SEXP future_warning(const char * message, SEXP call);
SEXP runtime_warning_(SEXP message, SEXP call);
SEXP runtime_warning(const char * message, SEXP call);

#endif
