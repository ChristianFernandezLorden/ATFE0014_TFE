#include <math.h>
#include <string.h>
#include "pm_std.h"
#include "sm_std.h"
#include "ne_std.h"
#include "ne_dae.h"
#include "sm_ssci_run_time_errors.h"
#include "sm_RuntimeDerivedValuesBundle.h"
void Untitled1_da03314a_1_computeRuntimeParameters ( const real_T t0 [ ] ,
real_T out [ ] ) { real_T t2 [ 3 ] ; real_T t3 [ 3 ] ; real_T t13 ; real_T
t14 ; real_T t15 ; t2 [ 0UL ] = t0 [ 0UL ] ; t2 [ 1UL ] = t0 [ 1UL ] ; t2 [
2UL ] = t0 [ 2UL ] ; memcpy ( & t3 [ 0 ] , & t2 [ 0 ] , 24U ) ; t13 = t3 [
0UL ] ; t14 = t3 [ 1UL ] ; t15 = t3 [ 2UL ] ; out [ 0 ] = t13 ; out [ 1 ] =
t14 ; out [ 2 ] = t15 ; } void
Untitled1_da03314a_1_computeAsmRuntimeDerivedValuesDoubles ( const double *
rtp , double * rtdvd ) { boolean_T bb [ 3 ] ; double xx [ 3 ] ; xx [ 0 ] =
rtp [ 0 ] ; xx [ 1 ] = rtp [ 1 ] ; xx [ 2 ] = rtp [ 2 ] ; bb [ 0 ] =
sm_core_math_anyIsInf ( 3 , xx + 0 ) ; bb [ 1 ] = sm_core_math_anyIsNaN ( 3 ,
xx + 0 ) ; bb [ 2 ] = ! bb [ 0 ] && ! bb [ 1 ] ; xx [ 0 ] = 0.0 ; rtdvd [ 0 ]
= bb [ 2 ] ? rtp [ 0 ] : xx [ 0 ] ; rtdvd [ 1 ] = bb [ 2 ] ? rtp [ 1 ] : xx [
0 ] ; rtdvd [ 2 ] = bb [ 2 ] ? rtp [ 2 ] : xx [ 0 ] ; } void
Untitled1_da03314a_1_computeAsmRuntimeDerivedValuesInts ( const double * rtp
, int * rtdvi ) { ( void ) rtp ; ( void ) rtdvi ; } void
Untitled1_da03314a_1_computeAsmRuntimeDerivedValues ( const double * rtp ,
RuntimeDerivedValuesBundle * rtdv ) {
Untitled1_da03314a_1_computeAsmRuntimeDerivedValuesDoubles ( rtp , rtdv ->
mDoubles . mValues ) ;
Untitled1_da03314a_1_computeAsmRuntimeDerivedValuesInts ( rtp , rtdv -> mInts
. mValues ) ; } void
Untitled1_da03314a_1_computeSimRuntimeDerivedValuesDoubles ( const double *
rtp , double * rtdvd ) { boolean_T bb [ 3 ] ; double xx [ 3 ] ; xx [ 0 ] =
rtp [ 0 ] ; xx [ 1 ] = rtp [ 1 ] ; xx [ 2 ] = rtp [ 2 ] ; bb [ 0 ] =
sm_core_math_anyIsInf ( 3 , xx + 0 ) ; bb [ 1 ] = sm_core_math_anyIsNaN ( 3 ,
xx + 0 ) ; bb [ 2 ] = ! bb [ 0 ] && ! bb [ 1 ] ; xx [ 0 ] = 0.0 ; rtdvd [ 0 ]
= bb [ 2 ] ? rtp [ 0 ] : xx [ 0 ] ; rtdvd [ 1 ] = bb [ 2 ] ? rtp [ 1 ] : xx [
0 ] ; rtdvd [ 2 ] = bb [ 2 ] ? rtp [ 2 ] : xx [ 0 ] ; } void
Untitled1_da03314a_1_computeSimRuntimeDerivedValuesInts ( const double * rtp
, int * rtdvi ) { ( void ) rtp ; ( void ) rtdvi ; } void
Untitled1_da03314a_1_computeSimRuntimeDerivedValues ( const double * rtp ,
RuntimeDerivedValuesBundle * rtdv ) {
Untitled1_da03314a_1_computeSimRuntimeDerivedValuesDoubles ( rtp , rtdv ->
mDoubles . mValues ) ;
Untitled1_da03314a_1_computeSimRuntimeDerivedValuesInts ( rtp , rtdv -> mInts
. mValues ) ; }
