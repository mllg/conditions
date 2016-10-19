#include "condition.h"
#include "signal.h"

static inline void check_condition(SEXP condition) {
    if (!inherits(condition, "condition"))
        cstop(condition_error("assertion", "Argument 'condition' must inherit from class 'condition'", R_NilValue));
}

static inline SEXP signal_condition(SEXP condition, const char * fun) {
    check_condition(condition);
    SEXP call = PROTECT(Rf_lang2(Rf_install(fun), condition));
    Rf_eval(call, R_GlobalEnv);
    UNPROTECT(1);
    return R_NilValue;
}

SEXP cmessage(SEXP condition) {
    return signal_condition(condition, "message");
}

SEXP cwarn(SEXP condition) {
    return signal_condition(condition, "warning");
}

SEXP cstop(SEXP condition) {
    return signal_condition(condition, "stop");
}
