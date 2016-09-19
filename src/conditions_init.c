#include <R.h>
#include <R_ext/Rdynload.h>
#include "condition.h"

void R_init_conditions(DllInfo *info) {
  R_RegisterCCallable("conditions", "condition_error", (DL_FUNC) &condition_error);
  R_RegisterCCallable("conditions", "condition_warning", (DL_FUNC) &condition_warning);
  R_RegisterCCallable("conditions", "condition_message", (DL_FUNC) &condition_message);
  R_RegisterCCallable("conditions", "cstop", (DL_FUNC) &cstop);
  R_RegisterCCallable("conditions", "cwarn", (DL_FUNC) &cwarn);
  R_RegisterCCallable("conditions", "cmessage", (DL_FUNC) &cmessage);
}
