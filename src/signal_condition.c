#include "signal_condition.h"

SEXP signal_condition(SEXP condition) {
    SEXP cl = getAttrib(condition, R_ClassSymbol);
    const char *msg = CHAR(STRING_ELT(VECTOR_ELT(condition, 0), 0));
    const char *type = CHAR(STRING_ELT(cl, length(cl) - 2));

    if (strcmp(type, "error") == 0) {
        if (isNull(VECTOR_ELT(condition, 1))) {
            error(msg);
        } else {
            SEXP call = PROTECT(Rf_lang2(Rf_install("stop"), condition));
            Rf_eval(call, R_GlobalEnv);
            UNPROTECT(1);
        }
    } else if (strcmp(type, "warning") == 0) {
        if (isNull(VECTOR_ELT(condition, 1))) {
            warning(msg);
        } else {
            SEXP call = PROTECT(Rf_lang2(Rf_install("warning"), condition));
            Rf_eval(call, R_GlobalEnv);
            UNPROTECT(1);
        }
    } else if (strcmp(type, "message") == 0) {
        Rprintf(msg);
    } else {
        error("Invalid signal. Must inherit from 'error', 'warning' or 'message'");
    }
    return R_NilValue;
}
