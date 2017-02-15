#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>
#include "condition.h"
#include "signal.h"

/* .Call calls */
extern SEXP condition_error_(SEXP, SEXP, SEXP, SEXP);
extern SEXP condition_message_(SEXP, SEXP, SEXP, SEXP);
extern SEXP condition_warning_(SEXP, SEXP, SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
    {"condition_error_",   (DL_FUNC) &condition_error_,   4},
    {"condition_message_", (DL_FUNC) &condition_message_, 4},
    {"condition_warning_", (DL_FUNC) &condition_warning_, 4},
    {"cmessage",           (DL_FUNC) &cmessage,           1},
    {"cwarn",              (DL_FUNC) &cwarn,              1},
    {"cstop",              (DL_FUNC) &cstop,              1},
    {NULL, NULL, 0}
};

void R_init_conditions(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
    R_RegisterCCallable("conditions", "condition_error", (DL_FUNC) &condition_error);
    R_RegisterCCallable("conditions", "condition_warning", (DL_FUNC) &condition_warning);
    R_RegisterCCallable("conditions", "condition_message", (DL_FUNC) &condition_message);
    R_RegisterCCallable("conditions", "cmessage", (DL_FUNC) &cmessage);
    R_RegisterCCallable("conditions", "cwarn", (DL_FUNC) &cwarn);
    R_RegisterCCallable("conditions", "cstop", (DL_FUNC) &cstop);
}
