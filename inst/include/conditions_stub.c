#include <R_ext/Rdynload.h>
#include "conditions.h"

#define CONDITION(NAME) \
    SEXP attribute_hidden NAME(const char * class, const char * message, ...) { \
        static SEXP(*fun)(const char *, const char *, SEXP) = NULL; \
        if (fun == NULL) \
            fun = (SEXP(*)(const char *, const char *, SEXP)) R_GetCCallable("conditions", #NAME); \
        char buf[512]; \
        va_list vargs; \
        va_start(vargs, message); \
        vsnprintf(buf, sizeof buf, message, vargs); \
        va_end(vargs); \
        return fun(class, buf, R_NilValue); \
    };

#define SIGNAL(NAME) \
    void attribute_hidden NAME(SEXP condition) { \
        static SEXP(*fun)(SEXP) = NULL; \
        if (fun == NULL) \
            fun = (SEXP(*)(SEXP)) R_GetCCallable("conditions", #NAME); \
        fun(condition); \
    };

CONDITION(condition_error);
CONDITION(condition_warning);
CONDITION(condition_message);
SIGNAL(cstop);
SIGNAL(cwarn);
SIGNAL(cmessage);

#undef CONDITION
#undef SIGNAL
