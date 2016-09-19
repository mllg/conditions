#include <string.h>
#include "condition.h"

static SEXP condition(const char * type, const char * class, const char * message, SEXP call) {
    SEXP cond = PROTECT(allocVector(VECSXP, 2));
    SET_VECTOR_ELT(cond, 0, mkString(message));
    SET_VECTOR_ELT(cond, 1, call);

    SEXP names = PROTECT(allocVector(STRSXP, 2));
    SET_STRING_ELT(names, 0, mkChar("message"));
    SET_STRING_ELT(names, 1, mkChar("call"));
    setAttrib(cond, R_NamesSymbol, names);

    SEXP cl = PROTECT(allocVector(STRSXP, 3));
    SET_STRING_ELT(cl, 0, mkChar(class));
    SET_STRING_ELT(cl, 1, mkChar(type));
    SET_STRING_ELT(cl, 2, mkChar("condition"));
    setAttrib(cond, R_ClassSymbol, cl);

    UNPROTECT(3);
    return cond;
}

static inline Rboolean is_string(SEXP str) {
    return (isString(str) && length(str) == 1 && STRING_ELT(str, 0) != NA_STRING);
}

static inline void check_class(SEXP class) {
    if (!is_string(class) || length(STRING_ELT(class, 0)) == 0)
        cstop(condition_error("assertion", "Argument 'class' must be a single, non-missing string", R_NilValue));
}

static inline void check_message(SEXP message) {
    if (!is_string(message))
        cstop(condition_error("assertion", "Argument 'message' must be a single, non-missing string", R_NilValue));
}

static inline void check_condition(SEXP condition) {
    if (!inherits(condition, "condition"))
        cstop(condition_error("assertion", "Argument 'condition' must inherit from class 'condition'", R_NilValue));
}

static inline SEXP make_condition(const char * type, const char * class, const char * message, SEXP call) {
    char buf[256];
    snprintf(buf, sizeof buf, "%s_%s", class, type);
    return condition(type, buf, message, call);
}

SEXP condition_message(const char * class, const char * message, SEXP call) {
    return make_condition("message", class, message, call);
}

SEXP condition_message_(SEXP class, SEXP message, SEXP call) {
    check_class(class);
    check_message(message);
    return condition_message(CHAR(STRING_ELT(class, 0)), CHAR(STRING_ELT(message, 0)), call);
}

SEXP condition_warning(const char * class, const char * message, SEXP call) {
    return make_condition("warning", class, message, call);
}

SEXP condition_warning_(SEXP class, SEXP message, SEXP call) {
    check_class(class);
    check_message(message);
    return condition_warning(CHAR(STRING_ELT(class, 0)), CHAR(STRING_ELT(message, 0)), call);
}

SEXP condition_error(const char * class, const char * message, SEXP call) {
    return make_condition("error", class, message, call);
}

SEXP condition_error_(SEXP class, SEXP message, SEXP call) {
    check_class(class);
    check_message(message);
    return condition_error(CHAR(STRING_ELT(class, 0)), CHAR(STRING_ELT(message, 0)), call);
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
