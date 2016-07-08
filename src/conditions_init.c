#include <R.h>
#include <R_ext/Rdynload.h>
#include "condition.h"

void R_init_conditions(DllInfo *info) {
  R_RegisterCCallable("conditions", "condition_error", (DL_FUNC) &condition_error);
  R_RegisterCCallable("conditions", "condition_warning", (DL_FUNC) &condition_warning);
  R_RegisterCCallable("conditions", "condition_message", (DL_FUNC) &condition_message);
  R_RegisterCCallable("conditions", "stop", (DL_FUNC) &stop);
  R_RegisterCCallable("conditions", "warn", (DL_FUNC) &warn);
}
