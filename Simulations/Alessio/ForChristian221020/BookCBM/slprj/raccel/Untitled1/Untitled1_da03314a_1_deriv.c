#include <math.h>
#include <string.h>
#include "pm_std.h"
#include "sm_std.h"
#include "ne_std.h"
#include "ne_dae.h"
#include "sm_ssci_run_time_errors.h"
#include "sm_RuntimeDerivedValuesBundle.h"
#include "Untitled1_da03314a_1_geometries.h"
PmfMessageId Untitled1_da03314a_1_compDerivs ( const
RuntimeDerivedValuesBundle * rtdv , const int * eqnEnableFlags , const double
* state , const int * modeVector , const double * input , const double *
inputDot , const double * inputDdot , const double * discreteState , double *
deriv , double * errorResult , NeuDiagnosticManager * neDiagMgr ) { const
double * rtdvd = rtdv -> mDoubles . mValues ; const int * rtdvi = rtdv ->
mInts . mValues ; int ii [ 1 ] ; double xx [ 36 ] ; ( void ) rtdvi ; ( void )
eqnEnableFlags ; ( void ) modeVector ; ( void ) inputDot ; ( void ) inputDdot
; ( void ) discreteState ; ( void ) neDiagMgr ; xx [ 0 ] = 3.926990816987242
; xx [ 1 ] = 2.0 ; xx [ 2 ] = 0.5 ; xx [ 3 ] = xx [ 2 ] * state [ 2 ] ; xx [
4 ] = sin ( xx [ 3 ] ) ; xx [ 5 ] = 0.25 * xx [ 4 ] ; xx [ 6 ] = xx [ 2 ] -
xx [ 1 ] * xx [ 5 ] * xx [ 4 ] ; xx [ 7 ] = state [ 1 ] * xx [ 6 ] * state [
1 ] ; xx [ 8 ] = xx [ 7 ] * xx [ 4 ] ; xx [ 9 ] = cos ( xx [ 3 ] ) ; xx [ 3 ]
= xx [ 1 ] * xx [ 5 ] * xx [ 9 ] ; xx [ 5 ] = xx [ 3 ] * state [ 1 ] * state
[ 1 ] ; xx [ 10 ] = xx [ 5 ] * xx [ 4 ] ; xx [ 11 ] = xx [ 0 ] * ( xx [ 1 ] *
( xx [ 8 ] * xx [ 9 ] + xx [ 10 ] * xx [ 4 ] ) - xx [ 5 ] ) ; xx [ 5 ] =
0.9817477042468107 ; xx [ 12 ] = 0.2500000000000001 ; xx [ 13 ] =
0.329703604009554 ; ii [ 0 ] = factorSymmetricPosDef ( xx + 13 , 1 , xx + 14
) ; if ( ii [ 0 ] != 0 ) { return sm_ssci_recordRunTimeError (
"sm:compiler:messages:simulationErrors:DegenerateMass" ,
 "'Untitled1/Revolute Joint1' has a degenerate mass distribution on its follower side."
, neDiagMgr ) ; } xx [ 14 ] = xx [ 12 ] * xx [ 11 ] / xx [ 13 ] ; xx [ 15 ] =
xx [ 11 ] - xx [ 5 ] * xx [ 14 ] ; xx [ 11 ] = xx [ 0 ] * ( xx [ 1 ] * ( xx [
8 ] * xx [ 4 ] - xx [ 10 ] * xx [ 9 ] ) - xx [ 7 ] - xx [ 12 ] * state [ 3 ]
* ( state [ 1 ] + state [ 1 ] + state [ 3 ] ) ) ; xx [ 7 ] = xx [ 11 ] * xx [
4 ] ; xx [ 8 ] = xx [ 15 ] * xx [ 4 ] ; xx [ 10 ] = xx [ 15 ] + xx [ 1 ] * (
xx [ 7 ] * xx [ 9 ] - xx [ 8 ] * xx [ 4 ] ) ; xx [ 15 ] = 0.08426667794785123
; xx [ 16 ] = xx [ 12 ] * state [ 1 ] * state [ 1 ] ; xx [ 17 ] = xx [ 5 ] /
xx [ 13 ] ; xx [ 18 ] = xx [ 15 ] * xx [ 17 ] ; xx [ 19 ] = xx [ 1 ] * xx [ 9
] * xx [ 4 ] ; xx [ 20 ] = xx [ 9 ] * xx [ 9 ] ; xx [ 21 ] = 1.0 ; xx [ 22 ]
= xx [ 1 ] * ( xx [ 20 ] + xx [ 4 ] * xx [ 4 ] ) - xx [ 21 ] ; xx [ 23 ] = xx
[ 18 ] * xx [ 19 ] * xx [ 22 ] ; xx [ 24 ] = xx [ 0 ] * xx [ 19 ] ; xx [ 25 ]
= xx [ 1 ] * xx [ 20 ] - xx [ 21 ] ; xx [ 20 ] = xx [ 0 ] - xx [ 5 ] * xx [
17 ] ; xx [ 5 ] = xx [ 20 ] * xx [ 25 ] ; xx [ 21 ] = xx [ 24 ] * xx [ 25 ] -
xx [ 19 ] * xx [ 5 ] ; xx [ 26 ] = xx [ 19 ] * xx [ 20 ] ; xx [ 20 ] = xx [ 0
] * xx [ 25 ] ; xx [ 27 ] = xx [ 21 ] * xx [ 6 ] - xx [ 3 ] * ( xx [ 19 ] *
xx [ 26 ] + xx [ 20 ] * xx [ 25 ] ) ; xx [ 28 ] = xx [ 23 ] + xx [ 27 ] ; xx
[ 29 ] = xx [ 19 ] * xx [ 20 ] - xx [ 26 ] * xx [ 25 ] ; xx [ 20 ] = xx [ 15
] / xx [ 13 ] ; xx [ 13 ] = xx [ 18 ] * xx [ 25 ] * xx [ 22 ] ; xx [ 18 ] =
xx [ 3 ] * xx [ 23 ] + xx [ 13 ] * xx [ 6 ] ; xx [ 23 ] = xx [ 5 ] * xx [ 25
] + xx [ 19 ] * xx [ 24 ] ; xx [ 5 ] = xx [ 23 ] * xx [ 6 ] - xx [ 3 ] * xx [
29 ] ; xx [ 19 ] = xx [ 5 ] - xx [ 13 ] ; xx [ 13 ] = xx [ 19 ] + xx [ 12 ] *
( xx [ 0 ] + xx [ 23 ] ) ; xx [ 0 ] = ( xx [ 15 ] - xx [ 15 ] * xx [ 20 ] ) *
xx [ 22 ] * xx [ 22 ] - xx [ 18 ] - xx [ 18 ] + xx [ 5 ] * xx [ 6 ] - xx [ 3
] * xx [ 27 ] + xx [ 12 ] * xx [ 19 ] + xx [ 12 ] * xx [ 13 ] + xx [ 15 ] ;
ii [ 0 ] = factorSymmetricPosDef ( xx + 0 , 1 , xx + 5 ) ; if ( ii [ 0 ] != 0
) { return sm_ssci_recordRunTimeError (
"sm:compiler:messages:simulationErrors:DegenerateMass" ,
 "'Untitled1/Revolute Joint' has a degenerate mass distribution on its follower side."
, neDiagMgr ) ; } xx [ 5 ] = 0.7071067811865476 ; xx [ 18 ] = xx [ 2 ] *
state [ 0 ] ; xx [ 2 ] = xx [ 5 ] * sin ( xx [ 18 ] ) ; xx [ 19 ] = xx [ 5 ]
* cos ( xx [ 18 ] ) ; xx [ 22 ] = xx [ 2 ] ; xx [ 23 ] = xx [ 19 ] ; xx [ 24
] = xx [ 19 ] ; xx [ 25 ] = xx [ 2 ] ; xx [ 30 ] = - rtdvd [ 0 ] ; xx [ 31 ]
= - rtdvd [ 1 ] ; xx [ 32 ] = - rtdvd [ 2 ] ;
pm_math_Quaternion_inverseXform_ra ( xx + 22 , xx + 30 , xx + 33 ) ; xx [ 2 ]
= ( input [ 0 ] - ( xx [ 10 ] * xx [ 6 ] - xx [ 3 ] * ( xx [ 11 ] - xx [ 1 ]
* ( xx [ 8 ] * xx [ 9 ] + xx [ 7 ] * xx [ 4 ] ) ) - xx [ 15 ] * xx [ 14 ] -
xx [ 16 ] * xx [ 28 ] + xx [ 12 ] * ( xx [ 10 ] - xx [ 16 ] * xx [ 29 ] ) ) )
/ xx [ 0 ] - ( xx [ 13 ] / xx [ 0 ] * xx [ 34 ] + ( xx [ 12 ] * xx [ 21 ] +
xx [ 28 ] ) / xx [ 0 ] * xx [ 35 ] ) ; xx [ 0 ] = xx [ 34 ] + xx [ 12 ] * xx
[ 2 ] + xx [ 2 ] * xx [ 6 ] ; deriv [ 0 ] = state [ 1 ] ; deriv [ 1 ] = xx [
2 ] ; deriv [ 2 ] = state [ 3 ] ; deriv [ 3 ] = - ( xx [ 14 ] + ( xx [ 0 ] -
xx [ 1 ] * ( ( xx [ 35 ] - xx [ 16 ] - xx [ 3 ] * xx [ 2 ] ) * xx [ 4 ] * xx
[ 9 ] + xx [ 0 ] * xx [ 4 ] * xx [ 4 ] ) ) * xx [ 17 ] + xx [ 2 ] * xx [ 20 ]
) ; errorResult [ 0 ] = 0.0 ; return NULL ; } PmfMessageId
Untitled1_da03314a_1_numJacPerturbLoBounds ( const RuntimeDerivedValuesBundle
* rtdv , const int * eqnEnableFlags , const double * state , const int *
modeVector , const double * input , const double * inputDot , const double *
inputDdot , const double * discreteState , double * bounds , double *
errorResult , NeuDiagnosticManager * neDiagMgr ) { const double * rtdvd =
rtdv -> mDoubles . mValues ; const int * rtdvi = rtdv -> mInts . mValues ;
double xx [ 1 ] ; ( void ) rtdvd ; ( void ) rtdvi ; ( void ) eqnEnableFlags ;
( void ) state ; ( void ) modeVector ; ( void ) input ; ( void ) inputDot ; (
void ) inputDdot ; ( void ) discreteState ; ( void ) neDiagMgr ; xx [ 0 ] =
1.0e-8 ; bounds [ 0 ] = xx [ 0 ] ; bounds [ 1 ] = xx [ 0 ] ; bounds [ 2 ] =
xx [ 0 ] ; bounds [ 3 ] = xx [ 0 ] ; errorResult [ 0 ] = 0.0 ; return NULL ;
} PmfMessageId Untitled1_da03314a_1_numJacPerturbHiBounds ( const
RuntimeDerivedValuesBundle * rtdv , const int * eqnEnableFlags , const double
* state , const int * modeVector , const double * input , const double *
inputDot , const double * inputDdot , const double * discreteState , double *
bounds , double * errorResult , NeuDiagnosticManager * neDiagMgr ) { const
double * rtdvd = rtdv -> mDoubles . mValues ; const int * rtdvi = rtdv ->
mInts . mValues ; double xx [ 2 ] ; ( void ) rtdvd ; ( void ) rtdvi ; ( void
) eqnEnableFlags ; ( void ) state ; ( void ) modeVector ; ( void ) input ; (
void ) inputDot ; ( void ) inputDdot ; ( void ) discreteState ; ( void )
neDiagMgr ; xx [ 0 ] = 1.0 ; xx [ 1 ] = + pmf_get_inf ( ) ; bounds [ 0 ] = xx
[ 0 ] ; bounds [ 1 ] = xx [ 1 ] ; bounds [ 2 ] = xx [ 0 ] ; bounds [ 3 ] = xx
[ 1 ] ; errorResult [ 0 ] = 0.0 ; return NULL ; }
