#include <stdbool.h>
#include <ctype.h>
#include "condition.h"
#include "signal.h"

static void set_condition_names(SEXP cond, Rboolean has_attach) {
    SEXP names = PROTECT(allocVector(STRSXP, 2));
    SET_STRING_ELT(names, 0, mkChar("message"));
    SET_STRING_ELT(names, 1, mkChar("call"));
    if (has_attach)
        SET_STRING_ELT(names, 2, mkChar("attached"));
    setAttrib(cond, R_NamesSymbol, names);

    UNPROTECT(1);
}

static void set_condition_class(SEXP cond, const char * class, const char * type) {
    SEXP cl = PROTECT(allocVector(STRSXP, 3));

    char buf[256];
    snprintf(buf, 255, "%s%s", class, type);
    R_len_t pos = strlen(class);
    buf[pos] = toupper(buf[pos]);

    SET_STRING_ELT(cl, 0, mkChar(buf));
    SET_STRING_ELT(cl, 1, mkChar(type));
    SET_STRING_ELT(cl, 2, mkChar("condition"));
    setAttrib(cond, R_ClassSymbol, cl);

    UNPROTECT(1);
}

/*****************************************************************************/
/* C interface                                                               */
/*****************************************************************************/
static SEXP condition(const char * type, const char * class, const char * message, SEXP call) {
    SEXP cond = PROTECT(allocVector(VECSXP, 2));
    SET_VECTOR_ELT(cond, 0, mkString(message));
    SET_VECTOR_ELT(cond, 1, call);

    set_condition_names(cond, FALSE);
    set_condition_class(cond, class, type);

    UNPROTECT(3);
    return cond;
}

SEXP condition_message(const char * class, const char * message, SEXP call) {
    return condition("message", class, message, call);
}

SEXP condition_warning(const char * class, const char * message, SEXP call) {
    return condition("warning", class, message, call);
}

SEXP condition_error(const char * class, const char * message, SEXP call) {
    return condition("error", class, message, call);
}


/*****************************************************************************/
/* R interface                                                               */
/*****************************************************************************/
static inline bool is_string(SEXP str) {
    return (isString(str) && length(str) == 1 && STRING_ELT(str, 0) != NA_STRING && length(STRING_ELT(str, 0)) > 0);
}

static SEXP condition_(const char * type, SEXP class, SEXP message, SEXP call, SEXP attach) {
    if (!is_string(class))
        error("Argument 'class' must be a single, non-missing, non-empty string");
    if (!is_string(message))
        error("Argument 'message' must be a single, non-missing, non-empty string");
    if (!isLanguage(call))
        error("Argument 'call' must be NULL or a language object");

    const bool has_attach = length(attach) > 0;

    SEXP cond = PROTECT(allocVector(VECSXP, 2 + has_attach));
    SET_VECTOR_ELT(cond, 0, message);
    SET_VECTOR_ELT(cond, 1, call);
    if (has_attach)
        SET_VECTOR_ELT(cond, 2, lazy_duplicate(attach));

    set_condition_names(cond, has_attach);
    set_condition_class(cond,CHAR(STRING_ELT(class, 0)), type);

    UNPROTECT(1);
    return cond;
}

SEXP condition_message_(SEXP class, SEXP message, SEXP call, SEXP attach) {
    return condition_("message", class, message, call, attach);
}

SEXP condition_warning_(SEXP class, SEXP message, SEXP call, SEXP attach) {
    return condition_("warning", class, message, call, attach);
}

SEXP condition_error_(SEXP class, SEXP message, SEXP call, SEXP attach) {
    return condition_("error", class, message, call, attach);
}
