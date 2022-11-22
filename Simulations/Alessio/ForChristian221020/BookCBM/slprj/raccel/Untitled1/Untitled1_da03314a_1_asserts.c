#include <math.h>
#include <string.h>
#include "pm_std.h"
#include "sm_std.h"
#include "ne_std.h"
#include "ne_dae.h"
#include "sm_ssci_run_time_errors.h"
#include "sm_RuntimeDerivedValuesBundle.h"
void Untitled1_da03314a_1_validateRuntimeParameters ( const double * rtp ,
int32_T * satFlags ) { boolean_T bb [ 2 ] ; double xx [ 3 ] ; xx [ 0 ] = rtp
[ 0 ] ; xx [ 1 ] = rtp [ 1 ] ; xx [ 2 ] = rtp [ 2 ] ; bb [ 0 ] =
sm_core_math_anyIsInf ( 3 , xx + 0 ) ; bb [ 1 ] = sm_core_math_anyIsNaN ( 3 ,
xx + 0 ) ; satFlags [ 0 ] = ! bb [ 0 ] ? 1 : 0 ; satFlags [ 1 ] = ! bb [ 1 ]
? 1 : 0 ; } const NeAssertData Untitled1_da03314a_1_assertData [ 2 ] = { {
"Untitled1/Mechanism Configuration" , 0 , 0 , "Mechanism_Configuration" , ""
, false ,
 "The parameter Gravitational Acceleration contains an Inf value, which is not allowed."
, "sm:model:evaluate:InvalidValueInf" } , {
"Untitled1/Mechanism Configuration" , 0 , 0 , "Mechanism_Configuration" , ""
, false ,
 "The parameter Gravitational Acceleration contains a NaN value, which is not allowed."
, "sm:model:evaluate:InvalidValueNaN" } } ;
