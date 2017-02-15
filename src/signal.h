#ifndef CONDITIONS_SIGNAL_H_
#define CONDITIONS_SIGNAL_H_

#include <R.h>
#include <Rinternals.h>

SEXP cmessage(SEXP condition);
SEXP cwarn(SEXP condition);
SEXP cstop(SEXP condition);

#endif
