#include <math.h>
#include <string.h>
#include "pm_std.h"
#include "sm_std.h"
#include "ne_std.h"
#include "ne_dae.h"
#include "sm_ssci_run_time_errors.h"
#include "sm_RuntimeDerivedValuesBundle.h"
#include "Untitled1_da03314a_1_geometries.h"
PmfMessageId Untitled1_da03314a_1_recordLog ( const
RuntimeDerivedValuesBundle * rtdv , const int * eqnEnableFlags , const double
* state , const int * modeVector , const double * input , const double *
inputDot , const double * inputDdot , double * logVector , double *
errorResult , NeuDiagnosticManager * neDiagMgr ) { const double * rtdvd =
rtdv -> mDoubles . mValues ; const int * rtdvi = rtdv -> mInts . mValues ;
int ii [ 1 ] ; double xx [ 37 ] ; ( void ) rtdvi ; ( void ) eqnEnableFlags ;
( void ) modeVector ; ( void ) inputDot ; ( void ) inputDdot ; ( void )
neDiagMgr ; xx [ 0 ] = 57.29577951308232 ; xx [ 1 ] = 3.926990816987242 ; xx
[ 2 ] = 2.0 ; xx [ 3 ] = 0.5 ; xx [ 4 ] = xx [ 3 ] * state [ 2 ] ; xx [ 5 ] =
sin ( xx [ 4 ] ) ; xx [ 6 ] = 0.25 * xx [ 5 ] ; xx [ 7 ] = xx [ 3 ] - xx [ 2
] * xx [ 6 ] * xx [ 5 ] ; xx [ 8 ] = state [ 1 ] * xx [ 7 ] * state [ 1 ] ;
xx [ 9 ] = xx [ 8 ] * xx [ 5 ] ; xx [ 10 ] = cos ( xx [ 4 ] ) ; xx [ 4 ] = xx
[ 2 ] * xx [ 6 ] * xx [ 10 ] ; xx [ 6 ] = xx [ 4 ] * state [ 1 ] * state [ 1
] ; xx [ 11 ] = xx [ 6 ] * xx [ 5 ] ; xx [ 12 ] = xx [ 1 ] * ( xx [ 2 ] * (
xx [ 9 ] * xx [ 10 ] + xx [ 11 ] * xx [ 5 ] ) - xx [ 6 ] ) ; xx [ 6 ] =
0.9817477042468107 ; xx [ 13 ] = 0.2500000000000001 ; xx [ 14 ] =
0.329703604009554 ; ii [ 0 ] = factorSymmetricPosDef ( xx + 14 , 1 , xx + 15
) ; if ( ii [ 0 ] != 0 ) { return sm_ssci_recordRunTimeError (
"sm:compiler:messages:simulationErrors:DegenerateMass" ,
 "'Untitled1/Revolute Joint1' has a degenerate mass distribution on its follower side."
, neDiagMgr ) ; } xx [ 15 ] = xx [ 13 ] * xx [ 12 ] / xx [ 14 ] ; xx [ 16 ] =
xx [ 12 ] - xx [ 6 ] * xx [ 15 ] ; xx [ 12 ] = xx [ 1 ] * ( xx [ 2 ] * ( xx [
9 ] * xx [ 5 ] - xx [ 11 ] * xx [ 10 ] ) - xx [ 8 ] - xx [ 13 ] * state [ 3 ]
* ( state [ 1 ] + state [ 1 ] + state [ 3 ] ) ) ; xx [ 8 ] = xx [ 12 ] * xx [
5 ] ; xx [ 9 ] = xx [ 16 ] * xx [ 5 ] ; xx [ 11 ] = xx [ 16 ] + xx [ 2 ] * (
xx [ 8 ] * xx [ 10 ] - xx [ 9 ] * xx [ 5 ] ) ; xx [ 16 ] =
0.08426667794785123 ; xx [ 17 ] = xx [ 13 ] * state [ 1 ] * state [ 1 ] ; xx
[ 18 ] = xx [ 6 ] / xx [ 14 ] ; xx [ 19 ] = xx [ 16 ] * xx [ 18 ] ; xx [ 20 ]
= xx [ 2 ] * xx [ 10 ] * xx [ 5 ] ; xx [ 21 ] = xx [ 10 ] * xx [ 10 ] ; xx [
22 ] = 1.0 ; xx [ 23 ] = xx [ 2 ] * ( xx [ 21 ] + xx [ 5 ] * xx [ 5 ] ) - xx
[ 22 ] ; xx [ 24 ] = xx [ 19 ] * xx [ 20 ] * xx [ 23 ] ; xx [ 25 ] = xx [ 1 ]
* xx [ 20 ] ; xx [ 26 ] = xx [ 2 ] * xx [ 21 ] - xx [ 22 ] ; xx [ 21 ] = xx [
1 ] - xx [ 6 ] * xx [ 18 ] ; xx [ 6 ] = xx [ 21 ] * xx [ 26 ] ; xx [ 22 ] =
xx [ 25 ] * xx [ 26 ] - xx [ 20 ] * xx [ 6 ] ; xx [ 27 ] = xx [ 20 ] * xx [
21 ] ; xx [ 21 ] = xx [ 1 ] * xx [ 26 ] ; xx [ 28 ] = xx [ 22 ] * xx [ 7 ] -
xx [ 4 ] * ( xx [ 20 ] * xx [ 27 ] + xx [ 21 ] * xx [ 26 ] ) ; xx [ 29 ] = xx
[ 24 ] + xx [ 28 ] ; xx [ 30 ] = xx [ 20 ] * xx [ 21 ] - xx [ 27 ] * xx [ 26
] ; xx [ 21 ] = xx [ 16 ] / xx [ 14 ] ; xx [ 14 ] = xx [ 19 ] * xx [ 26 ] *
xx [ 23 ] ; xx [ 19 ] = xx [ 4 ] * xx [ 24 ] + xx [ 14 ] * xx [ 7 ] ; xx [ 24
] = xx [ 6 ] * xx [ 26 ] + xx [ 20 ] * xx [ 25 ] ; xx [ 6 ] = xx [ 24 ] * xx
[ 7 ] - xx [ 4 ] * xx [ 30 ] ; xx [ 20 ] = xx [ 6 ] - xx [ 14 ] ; xx [ 14 ] =
xx [ 20 ] + xx [ 13 ] * ( xx [ 1 ] + xx [ 24 ] ) ; xx [ 1 ] = ( xx [ 16 ] -
xx [ 16 ] * xx [ 21 ] ) * xx [ 23 ] * xx [ 23 ] - xx [ 19 ] - xx [ 19 ] + xx
[ 6 ] * xx [ 7 ] - xx [ 4 ] * xx [ 28 ] + xx [ 13 ] * xx [ 20 ] + xx [ 13 ] *
xx [ 14 ] + xx [ 16 ] ; ii [ 0 ] = factorSymmetricPosDef ( xx + 1 , 1 , xx +
6 ) ; if ( ii [ 0 ] != 0 ) { return sm_ssci_recordRunTimeError (
"sm:compiler:messages:simulationErrors:DegenerateMass" ,
 "'Untitled1/Revolute Joint' has a degenerate mass distribution on its follower side."
, neDiagMgr ) ; } xx [ 6 ] = 0.7071067811865476 ; xx [ 19 ] = xx [ 3 ] *
state [ 0 ] ; xx [ 3 ] = xx [ 6 ] * sin ( xx [ 19 ] ) ; xx [ 20 ] = xx [ 6 ]
* cos ( xx [ 19 ] ) ; xx [ 23 ] = xx [ 3 ] ; xx [ 24 ] = xx [ 20 ] ; xx [ 25
] = xx [ 20 ] ; xx [ 26 ] = xx [ 3 ] ; xx [ 31 ] = - rtdvd [ 0 ] ; xx [ 32 ]
= - rtdvd [ 1 ] ; xx [ 33 ] = - rtdvd [ 2 ] ;
pm_math_Quaternion_inverseXform_ra ( xx + 23 , xx + 31 , xx + 34 ) ; xx [ 3 ]
= ( input [ 0 ] - ( xx [ 11 ] * xx [ 7 ] - xx [ 4 ] * ( xx [ 12 ] - xx [ 2 ]
* ( xx [ 9 ] * xx [ 10 ] + xx [ 8 ] * xx [ 5 ] ) ) - xx [ 16 ] * xx [ 15 ] -
xx [ 17 ] * xx [ 29 ] + xx [ 13 ] * ( xx [ 11 ] - xx [ 17 ] * xx [ 30 ] ) ) )
/ xx [ 1 ] - ( xx [ 14 ] / xx [ 1 ] * xx [ 35 ] + ( xx [ 13 ] * xx [ 22 ] +
xx [ 29 ] ) / xx [ 1 ] * xx [ 36 ] ) ; xx [ 1 ] = xx [ 35 ] + xx [ 13 ] * xx
[ 3 ] + xx [ 3 ] * xx [ 7 ] ; logVector [ 0 ] = xx [ 0 ] * state [ 0 ] ;
logVector [ 1 ] = xx [ 0 ] * state [ 1 ] ; logVector [ 2 ] = xx [ 0 ] * state
[ 2 ] ; logVector [ 3 ] = xx [ 0 ] * state [ 3 ] ; logVector [ 4 ] = xx [ 0 ]
* xx [ 3 ] ; logVector [ 5 ] = - ( xx [ 0 ] * ( xx [ 15 ] + ( xx [ 1 ] - xx [
2 ] * ( ( xx [ 36 ] - xx [ 17 ] - xx [ 4 ] * xx [ 3 ] ) * xx [ 5 ] * xx [ 10
] + xx [ 1 ] * xx [ 5 ] * xx [ 5 ] ) ) * xx [ 18 ] + xx [ 3 ] * xx [ 21 ] ) )
; errorResult [ 0 ] = 0.0 ; return NULL ; }
