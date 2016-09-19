#ifndef CONDITIONS_CONDITION_H_
#define CONDITIONS_CONDITION_H_

#include <R.h>
#include <Rinternals.h>

SEXP condition_error(const char * class, const char * message, SEXP call);
SEXP condition_error_(SEXP class, SEXP message, SEXP call);
SEXP condition_warning(const char * class, const char * message, SEXP call);
SEXP condition_warning_(SEXP class, SEXP message, SEXP call);
SEXP condition_message(const char * class, const char * message, SEXP call);
SEXP condition_message_(SEXP class, SEXP message, SEXP call);
SEXP cmessage(SEXP condition);
SEXP cwarn(SEXP condition);
SEXP cstop(SEXP condition);

#endif
