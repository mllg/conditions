#include <string.h>
#include "condition.h"

static inline SEXP condition(const char * type, const char * class, const char * message, SEXP call) {
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

void static inline check_class(SEXP class) {
    if (!isString(class) || length(class) != 1 || STRING_ELT(class, 0) == NA_STRING)
        stop(condition_error("assertion", "Argument 'class' must be a non-missing string", R_NilValue));
}

void static inline check_message(SEXP message) {
    if (!isString(message) || length(message) != 1 || STRING_ELT(message, 0) == NA_STRING)
        stop(condition_error("assertion", "Argument 'message' must be a non-missing string", R_NilValue));
}

void static inline check_condition(SEXP condition) {
    if (!inherits(condition, "condition"))
        stop(condition_error("assertion", "Argument 'condition' must inherit from class 'condition'", R_NilValue));
}

SEXP condition_error(const char * class, const char * message, SEXP call) {
    char buf[256];
    snprintf(buf, sizeof buf, "%s_error", class);
    return condition("error", buf, message, call);
}

SEXP condition_warning(const char * class, const char * message, SEXP call) {
    char buf[256];
    snprintf(buf, sizeof buf, "%s_warning", class);
    return condition("warning", buf, message, call);
}

SEXP condition_message(const char * class, const char * message, SEXP call) {
    char buf[256];
    snprintf(buf, sizeof buf, "%s_message", class);
    return condition("message", buf, message, call);
}

void warn(SEXP condition) {
    check_condition(condition);
    SEXP call = PROTECT(Rf_lang2(Rf_install("warning"), condition));
    Rf_eval(call, R_GlobalEnv);
    UNPROTECT(1);
}

void stop(SEXP condition) {
    check_condition(condition);
    SEXP call = PROTECT(Rf_lang2(Rf_install("stop"), condition));
    Rf_eval(call, R_GlobalEnv);
    UNPROTECT(1);
}

SEXP condition_error_(SEXP class, SEXP message, SEXP call) {
    check_class(class);
    check_message(message);
    return condition_error(CHAR(STRING_ELT(class, 0)), CHAR(STRING_ELT(message, 0)), call);
}

SEXP condition_warning_(SEXP class, SEXP message, SEXP call) {
    check_class(class);
    check_message(message);
    return condition_warning(CHAR(STRING_ELT(class, 0)), CHAR(STRING_ELT(message, 0)), call);
}

SEXP condition_message_(SEXP class, SEXP message, SEXP call) {
    check_class(class);
    check_message(message);
    return condition_message(CHAR(STRING_ELT(class, 0)), CHAR(STRING_ELT(message, 0)), call);
}

SEXP warn_(SEXP condition) {
    warn(condition);
    return R_NilValue;
}

SEXP stop_(SEXP condition) {
    stop(condition);
    return R_NilValue;
}
