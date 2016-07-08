#include "std_conditions.h"

static inline SEXP condition(const char *type, SEXP message, SEXP class, SEXP call) {
    SEXP cond = PROTECT(allocVector(VECSXP, 2));
    SET_VECTOR_ELT(cond, 0, message);
    SET_VECTOR_ELT(cond, 1, call);

    SEXP names = PROTECT(allocVector(STRSXP, 2));
    SET_STRING_ELT(names, 0, mkChar("message"));
    SET_STRING_ELT(names, 1, mkChar("call"));
    setAttrib(cond, R_NamesSymbol, names);

    const R_len_t n = length(class);
    SEXP cl = PROTECT(allocVector(STRSXP, n + 2));
    for (R_len_t i = 0; i < n; i++)
        SET_STRING_ELT(cl, i, STRING_ELT(class, i));
    SET_STRING_ELT(cl, n, mkChar(type));
    SET_STRING_ELT(cl, n + 1, mkChar("condition"));
    setAttrib(cond, R_ClassSymbol, cl);

    UNPROTECT(3);
    return cond;
}

#define GENERATE(TYPE, SUBCLASS) \
    SEXP SUBCLASS##_(SEXP message, SEXP call) { \
        return condition(#TYPE, message, mkString(#SUBCLASS), call); \
    }; \
    SEXP SUBCLASS(const char * message, SEXP call) { \
        SEXP tmp = PROTECT(ScalarString(mkChar(message))); \
        SEXP res = condition(#TYPE, tmp, mkString(#SUBCLASS), call); \
        UNPROTECT(1); \
        return res; \
    };

GENERATE(error, assertion_error);
GENERATE(error, type_error);
GENERATE(error, length_error);
GENERATE(error, missing_error);
GENERATE(error, lookup_error);
GENERATE(error, index_error);
GENERATE(error, value_error);
GENERATE(error, name_error);
GENERATE(error, io_error);
GENERATE(error, library_error);
GENERATE(error, runtime_error);
GENERATE(warning, deprecated_warning);
GENERATE(warning, future_warning);
GENERATE(warning, runtime_warning);
