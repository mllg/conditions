#include <R.h>
#include <R_ext/Rdynload.h>
#include "conditions_init.h"
#include "std_conditions.h"
#include "signal_condition.h"

void R_init_conditions(DllInfo *info) {
  R_RegisterCCallable("conditions", "assertion_error", (DL_FUNC) &assertion_error);
  R_RegisterCCallable("conditions", "type_error", (DL_FUNC) &type_error);
  R_RegisterCCallable("conditions", "length_error", (DL_FUNC) &length_error);
  R_RegisterCCallable("conditions", "missing_error", (DL_FUNC) &missing_error);
  R_RegisterCCallable("conditions", "lookup_error", (DL_FUNC) &lookup_error);
  R_RegisterCCallable("conditions", "index_error", (DL_FUNC) &index_error);
  R_RegisterCCallable("conditions", "value_error", (DL_FUNC) &value_error);
  R_RegisterCCallable("conditions", "name_error", (DL_FUNC) &name_error);
  R_RegisterCCallable("conditions", "io_error", (DL_FUNC) &io_error);
  R_RegisterCCallable("conditions", "library_error", (DL_FUNC) &library_error);
  R_RegisterCCallable("conditions", "runtime_error", (DL_FUNC) &runtime_error);

  R_RegisterCCallable("conditions", "signal_condition", (DL_FUNC) &signal_condition);
}
