#include "conditions.h"

#define REGISTER(NAME) \
    SEXP attribute_hidden NAME(const char * fmt, SEXP call, ...) { \
        static SEXP(*fun)(const char *, SEXP) = NULL; \
        if (fun == NULL) \
            fun = (SEXP(*)(const char *, SEXP)) R_GetCCallable("conditions", #NAME); \
        char msg[255]; \
        va_list vargs; \
        va_start(vargs, call); \
        vsnprintf(msg, 255, fmt, vargs); \
        va_end(vargs); \
        return fun(msg, call); \
    };

REGISTER(assertion_error);
REGISTER(type_error);
REGISTER(length_error);
REGISTER(missing_error);
REGISTER(lookup_error);
REGISTER(index_error);
REGISTER(value_error);
REGISTER(name_error);
REGISTER(io_error);
REGISTER(library_error);
REGISTER(runtime_error);
REGISTER(deprecated_warning);
REGISTER(future_warning);
REGISTER(runtime_warning);

SEXP attribute_hidden signal_condition(SEXP condition) {
    static SEXP(*fun)(SEXP) = NULL;
    if (fun == NULL)
        fun = (SEXP(*)(SEXP)) R_GetCCallable("conditions", "signal_condition");

    return fun(condition);
};
