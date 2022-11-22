#include "Untitled1.h"
#include "rtwtypes.h"
#include "Untitled1_private.h"
#include "mwmathutil.h"
#include <string.h>
#include <stddef.h>
#include "rt_logging_mmi.h"
#include "Untitled1_capi.h"
#include "Untitled1_dt.h"
extern void * CreateDiagnosticAsVoidPtr_wrapper ( const char * id , int nargs
, ... ) ; RTWExtModeInfo * gblRTWExtModeInfo = NULL ; void
raccelForceExtModeShutdown ( boolean_T extModeStartPktReceived ) { if ( !
extModeStartPktReceived ) { boolean_T stopRequested = false ;
rtExtModeWaitForStartPkt ( gblRTWExtModeInfo , 2 , & stopRequested ) ; }
rtExtModeShutdown ( 2 ) ; }
#include "slsv_diagnostic_codegen_c_api.h"
#include "slsa_sim_engine.h"
const int_T gblNumToFiles = 0 ; const int_T gblNumFrFiles = 0 ; const int_T
gblNumFrWksBlocks = 0 ;
#ifdef RSIM_WITH_SOLVER_MULTITASKING
boolean_T gbl_raccel_isMultitasking = 1 ;
#else
boolean_T gbl_raccel_isMultitasking = 0 ;
#endif
boolean_T gbl_raccel_tid01eq = 0 ; int_T gbl_raccel_NumST = 3 ; const char_T
* gbl_raccel_Version = "9.7 (R2022a) 13-Nov-2021" ; void
raccel_setup_MMIStateLog ( SimStruct * S ) {
#ifdef UseMMIDataLogging
rt_FillStateSigInfoFromMMI ( ssGetRTWLogInfo ( S ) , & ssGetErrorStatus ( S )
) ;
#else
UNUSED_PARAMETER ( S ) ;
#endif
} static DataMapInfo rt_dataMapInfo ; DataMapInfo * rt_dataMapInfoPtr = &
rt_dataMapInfo ; rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr = & (
rt_dataMapInfo . mmi ) ; const int_T gblNumRootInportBlks = 0 ; const int_T
gblNumModelInputs = 0 ; extern const char * gblInportFileName ; extern
rtInportTUtable * gblInportTUtables ; const int_T gblInportDataTypeIdx [ ] =
{ - 1 } ; const int_T gblInportDims [ ] = { - 1 } ; const int_T
gblInportComplex [ ] = { - 1 } ; const int_T gblInportInterpoFlag [ ] = { - 1
} ; const int_T gblInportContinuous [ ] = { - 1 } ; int_T enableFcnCallFlag [
] = { 1 , 1 , 1 } ; const char * raccelLoadInputsAndAperiodicHitTimes (
SimStruct * S , const char * inportFileName , int * matFileFormat ) { return
rt_RAccelReadInportsMatFile ( S , inportFileName , matFileFormat ) ; }
#include "simstruc.h"
#include "fixedpoint.h"
#include "slsa_sim_engine.h"
#include "simtarget/slSimTgtSLExecSimBridge.h"
B rtB ; X rtX ; DW rtDW ; static SimStruct model_S ; SimStruct * const rtS =
& model_S ; void fjgxmk3spi ( real_T h1um02h5ma , real_T ofs15kamds ,
ccy2mtqfog * localB ) { localB -> krfr5v4lja = ofs15kamds / (
muDoubleScalarExp ( - ( h1um02h5ma + 20.0 ) ) + 1.0 ) ; } void dfbsjhxmp2 (
real_T e30rwwkvvi , pr1lgur2yp * localB ) { real_T hCaT0 ; real_T mCaL0 ;
real_T mCaT0 ; mCaL0 = 1.0 / ( muDoubleScalarExp ( ( e30rwwkvvi + 45.0 ) / -
5.0 ) + 1.0 ) ; mCaT0 = 1.0 / ( muDoubleScalarExp ( ( e30rwwkvvi + 60.0 ) / -
5.0 ) + 1.0 ) ; hCaT0 = 1.0 / ( muDoubleScalarExp ( ( e30rwwkvvi + 85.0 ) /
10.0 ) + 1.0 ) ; localB -> bcbbityvgg [ 0 ] = e30rwwkvvi ; localB ->
bcbbityvgg [ 1 ] = 1.0 / ( muDoubleScalarExp ( ( e30rwwkvvi + 25.0 ) / - 5.0
) + 1.0 ) ; localB -> bcbbityvgg [ 2 ] = 1.0 / ( muDoubleScalarExp ( (
e30rwwkvvi + 40.0 ) / 10.0 ) + 1.0 ) ; localB -> bcbbityvgg [ 3 ] = 1.0 / (
muDoubleScalarExp ( ( e30rwwkvvi + 15.0 ) / - 10.0 ) + 1.0 ) ; localB ->
bcbbityvgg [ 4 ] = 1.0 / ( muDoubleScalarExp ( ( e30rwwkvvi + 80.0 ) / - 10.0
) + 1.0 ) ; localB -> bcbbityvgg [ 5 ] = 1.0 / ( muDoubleScalarExp ( (
e30rwwkvvi + 60.0 ) / 5.0 ) + 1.0 ) ; localB -> bcbbityvgg [ 6 ] = 1.0 / (
muDoubleScalarExp ( ( e30rwwkvvi + 60.0 ) / - 10.0 ) + 1.0 ) ; localB ->
bcbbityvgg [ 7 ] = 1.0 / ( muDoubleScalarExp ( ( e30rwwkvvi + 20.0 ) / 5.0 )
+ 1.0 ) ; localB -> bcbbityvgg [ 8 ] = mCaL0 ; localB -> bcbbityvgg [ 9 ] =
mCaT0 ; localB -> bcbbityvgg [ 10 ] = hCaT0 ; localB -> bcbbityvgg [ 11 ] =
1.0 / ( muDoubleScalarExp ( ( e30rwwkvvi + 85.0 ) / 10.0 ) + 1.0 ) ; localB
-> bcbbityvgg [ 12 ] = - 0.0 * mCaT0 * hCaT0 * ( e30rwwkvvi - 120.0 ) + - 0.0
* mCaL0 * ( e30rwwkvvi - 120.0 ) ; } void mzbrkph513 ( const real_T
cgawyanv0k [ 13 ] , real_T gljqwzldei , real_T lznwyvbqk0 , eqqcjgcd3s *
localB ) { localB -> nlkstedhnb [ 0 ] = ( ( ( ( ( ( ( ( ( ( ( ( - 100.0 *
cgawyanv0k [ 1 ] * cgawyanv0k [ 2 ] * ( cgawyanv0k [ 0 ] - 40.0 ) + - 65.0 *
cgawyanv0k [ 3 ] * ( cgawyanv0k [ 0 ] - - 90.0 ) ) - 15.0 * cgawyanv0k [ 4 ]
* cgawyanv0k [ 5 ] * ( cgawyanv0k [ 0 ] - - 90.0 ) ) - 0.0 * cgawyanv0k [ 6 ]
* cgawyanv0k [ 7 ] * ( cgawyanv0k [ 0 ] - - 90.0 ) ) + 1.0 / (
muDoubleScalarExp ( ( cgawyanv0k [ 12 ] + - 30.0 ) / - 10.0 ) + 1.0 ) * - 0.0
* ( cgawyanv0k [ 0 ] - - 90.0 ) ) + - 0.0 * cgawyanv0k [ 8 ] * ( cgawyanv0k [
0 ] - 120.0 ) ) + - 0.0 * cgawyanv0k [ 9 ] * cgawyanv0k [ 10 ] * ( cgawyanv0k
[ 0 ] - 120.0 ) ) + - 0.0 * cgawyanv0k [ 11 ] * ( cgawyanv0k [ 0 ] - - 40.0 )
) + ( cgawyanv0k [ 0 ] - - 50.0 ) * - 0.3 ) + 200.0 ) + ( (
muDoubleScalarSign ( gljqwzldei - 500.0 ) + 1.0 ) / 2.0 - (
muDoubleScalarSign ( gljqwzldei - 2500.0 ) + 1.0 ) / 2.0 ) * 0.0 ) + ( (
muDoubleScalarSign ( gljqwzldei - 3500.0 ) + 1.0 ) / 2.0 - (
muDoubleScalarSign ( gljqwzldei - 5500.0 ) + 1.0 ) / 2.0 ) * 0.0 ) +
lznwyvbqk0 ) * 10000.0 ; localB -> nlkstedhnb [ 1 ] = 1.0 / ( 0.75 - 0.5 / (
muDoubleScalarExp ( ( cgawyanv0k [ 0 ] + 100.0 ) / - 20.0 ) + 1.0 ) ) *
1000.0 * ( 1.0 / ( muDoubleScalarExp ( ( cgawyanv0k [ 0 ] + 25.0 ) / - 5.0 )
+ 1.0 ) - cgawyanv0k [ 1 ] ) ; localB -> nlkstedhnb [ 2 ] = 1.0 / ( 4.0 - 3.5
/ ( muDoubleScalarExp ( ( cgawyanv0k [ 0 ] + 50.0 ) / - 20.0 ) + 1.0 ) ) *
1000.0 * ( 1.0 / ( muDoubleScalarExp ( ( cgawyanv0k [ 0 ] + 40.0 ) / 10.0 ) +
1.0 ) - cgawyanv0k [ 2 ] ) ; localB -> nlkstedhnb [ 3 ] = 1.0 / ( 5.0 - 4.5 /
( muDoubleScalarExp ( ( cgawyanv0k [ 0 ] + 30.0 ) / - 20.0 ) + 1.0 ) ) *
1000.0 * ( 1.0 / ( muDoubleScalarExp ( ( cgawyanv0k [ 0 ] + 15.0 ) / - 10.0 )
+ 1.0 ) - cgawyanv0k [ 3 ] ) ; localB -> nlkstedhnb [ 4 ] = 1.0 / ( 0.75 -
0.5 / ( muDoubleScalarExp ( ( cgawyanv0k [ 0 ] + 100.0 ) / - 20.0 ) + 1.0 ) )
* 1000.0 * ( 1.0 / ( muDoubleScalarExp ( ( cgawyanv0k [ 0 ] + 80.0 ) / - 10.0
) + 1.0 ) - cgawyanv0k [ 4 ] ) ; localB -> nlkstedhnb [ 5 ] = 1.0 / ( ( 0.75
- 0.5 / ( muDoubleScalarExp ( ( cgawyanv0k [ 0 ] + 100.0 ) / - 20.0 ) + 1.0 )
) * 10.0 ) * 1000.0 * ( 1.0 / ( muDoubleScalarExp ( ( cgawyanv0k [ 0 ] + 60.0
) / 5.0 ) + 1.0 ) - cgawyanv0k [ 5 ] ) ; localB -> nlkstedhnb [ 6 ] = 1.0 / (
( 0.75 - 0.5 / ( muDoubleScalarExp ( ( cgawyanv0k [ 0 ] + 100.0 ) / - 20.0 )
+ 1.0 ) ) * 10.0 ) * 1000.0 * ( 1.0 / ( muDoubleScalarExp ( ( cgawyanv0k [ 0
] + 60.0 ) / - 10.0 ) + 1.0 ) - cgawyanv0k [ 6 ] ) ; localB -> nlkstedhnb [ 7
] = 1.0 / ( ( 0.75 - 0.5 / ( muDoubleScalarExp ( ( cgawyanv0k [ 0 ] + 100.0 )
/ - 20.0 ) + 1.0 ) ) * 100.0 ) * 1000.0 * ( 1.0 / ( muDoubleScalarExp ( (
cgawyanv0k [ 0 ] + 20.0 ) / 5.0 ) + 1.0 ) - cgawyanv0k [ 7 ] ) ; localB ->
nlkstedhnb [ 8 ] = 1.0 / ( 6.0 - 5.5 / ( muDoubleScalarExp ( ( cgawyanv0k [ 0
] + 30.0 ) / - 20.0 ) + 1.0 ) ) * 1000.0 * ( 1.0 / ( muDoubleScalarExp ( (
cgawyanv0k [ 0 ] + 45.0 ) / - 5.0 ) + 1.0 ) - cgawyanv0k [ 8 ] ) ; localB ->
nlkstedhnb [ 9 ] = 1.0 / ( 6.0 - 5.5 / ( muDoubleScalarExp ( ( cgawyanv0k [ 0
] + 30.0 ) / - 20.0 ) + 1.0 ) ) * 1000.0 * ( 1.0 / ( muDoubleScalarExp ( (
cgawyanv0k [ 0 ] + 60.0 ) / - 5.0 ) + 1.0 ) - cgawyanv0k [ 9 ] ) ; localB ->
nlkstedhnb [ 10 ] = 1.0 / ( ( 6.0 - 5.5 / ( muDoubleScalarExp ( ( cgawyanv0k
[ 0 ] + 30.0 ) / - 20.0 ) + 1.0 ) ) * 100.0 ) * 1000.0 * ( 1.0 / (
muDoubleScalarExp ( ( cgawyanv0k [ 0 ] + 85.0 ) / 10.0 ) + 1.0 ) - cgawyanv0k
[ 10 ] ) ; localB -> nlkstedhnb [ 11 ] = 1.0 / ( ( 6.0 - 5.5 / (
muDoubleScalarExp ( ( cgawyanv0k [ 0 ] + 30.0 ) / - 20.0 ) + 1.0 ) ) * 50.0 )
* 1000.0 * ( 1.0 / ( muDoubleScalarExp ( ( cgawyanv0k [ 0 ] + 85.0 ) / 10.0 )
+ 1.0 ) - cgawyanv0k [ 11 ] ) ; localB -> nlkstedhnb [ 12 ] = ( ( - 0.0 *
cgawyanv0k [ 9 ] * cgawyanv0k [ 10 ] * ( cgawyanv0k [ 0 ] - 120.0 ) + - 0.0 *
cgawyanv0k [ 8 ] * ( cgawyanv0k [ 0 ] - 120.0 ) ) - cgawyanv0k [ 12 ] ) * 2.0
; } void MdlInitialize ( void ) { boolean_T tmp ; rtDW . psybpwndnj = 1 ; if
( ssIsFirstInitCond ( rtS ) ) { memset ( & rtX . g0mc3r5gzj [ 0 ] , 0 , 13U *
sizeof ( real_T ) ) ; tmp = slIsRapidAcceleratorSimulating ( ) ; if ( tmp ) {
tmp = ssGetGlobalInitialStatesAvailable ( rtS ) ; rtDW . psybpwndnj = ! tmp ;
} else { rtDW . psybpwndnj = 1 ; } memset ( & rtX . lzbko4ydo0 [ 0 ] , 0 ,
13U * sizeof ( real_T ) ) ; } rtDW . lg1ypko4k2 = 1 ; if ( ssIsFirstInitCond
( rtS ) ) { tmp = slIsRapidAcceleratorSimulating ( ) ; if ( tmp ) { tmp =
ssGetGlobalInitialStatesAvailable ( rtS ) ; rtDW . lg1ypko4k2 = ! tmp ; }
else { rtDW . lg1ypko4k2 = 1 ; } } } void MdlStart ( void ) { CXPtMax *
_rtXPerturbMax ; CXPtMin * _rtXPerturbMin ; NeModelParameters modelParameters
; NeModelParameters modelParameters_p ; NeslRtpManager * manager ;
NeslRtpManager * manager_p ; NeslSimulationData * simulationData ;
NeslSimulator * tmp_p ; NeuDiagnosticManager * diagnosticManager ;
NeuDiagnosticTree * diagnosticTree ; NeuDiagnosticTree * diagnosticTree_e ;
NeuDiagnosticTree * diagnosticTree_p ; char * msg ; char * msg_e ; char *
msg_p ; real_T tmp_m [ 4 ] ; real_T time ; real_T tmp_e ; int32_T tmp_i ;
int_T tmp_g [ 2 ] ; boolean_T tmp ; boolean_T val ; { bool
externalInputIsInDatasetFormat = false ; void * pISigstreamManager =
rt_GetISigstreamManager ( rtS ) ;
rtwISigstreamManagerGetInputIsInDatasetFormat ( pISigstreamManager , &
externalInputIsInDatasetFormat ) ; if ( externalInputIsInDatasetFormat ) { }
} _rtXPerturbMax = ( ( CXPtMax * ) ssGetJacobianPerturbationBoundsMaxVec (
rtS ) ) ; _rtXPerturbMin = ( ( CXPtMin * )
ssGetJacobianPerturbationBoundsMinVec ( rtS ) ) ; manager_p =
nesl_lease_rtp_manager ( "Untitled1/Solver Configuration_1" , 0 ) ; manager =
manager_p ; tmp = pointer_is_null ( manager_p ) ; if ( tmp ) {
Untitled1_da03314a_1_gateway ( ) ; manager = nesl_lease_rtp_manager (
"Untitled1/Solver Configuration_1" , 0 ) ; } rtDW . bbpuvhaqb1 = ( void * )
manager ; rtDW . jqp0un0nfr = true ; tmp_p = nesl_lease_simulator (
"Untitled1/Solver Configuration_1" , 0 , 0 ) ; rtDW . ntaizccyaf = ( void * )
tmp_p ; tmp = pointer_is_null ( rtDW . ntaizccyaf ) ; if ( tmp ) {
Untitled1_da03314a_1_gateway ( ) ; tmp_p = nesl_lease_simulator (
"Untitled1/Solver Configuration_1" , 0 , 0 ) ; rtDW . ntaizccyaf = ( void * )
tmp_p ; } slsaSaveRawMemoryForSimTargetOP ( rtS ,
"Untitled1/Solver Configuration_100" , ( void * * ) ( & rtDW . ntaizccyaf ) ,
0U * sizeof ( real_T ) , nesl_save_simdata , nesl_restore_simdata ) ;
simulationData = nesl_create_simulation_data ( ) ; rtDW . am0ltiyuj4 = ( void
* ) simulationData ; diagnosticManager = rtw_create_diagnostics ( ) ; rtDW .
llvyklp4og = ( void * ) diagnosticManager ; modelParameters . mSolverType =
NE_SOLVER_TYPE_DAE ; modelParameters . mSolverTolerance = 0.001 ;
modelParameters . mSolverAbsTol = 0.001 ; modelParameters . mSolverRelTol =
0.001 ; modelParameters . mVariableStepSolver = true ; modelParameters .
mIsUsingODEN = false ; modelParameters . mSolverModifyAbsTol =
NE_MODIFY_ABS_TOL_MAYBE ; modelParameters . mFixedStepSize = 0.001 ;
modelParameters . mStartTime = 0.0 ; modelParameters . mLoadInitialState =
false ; modelParameters . mUseSimState = false ; modelParameters .
mLinTrimCompile = false ; modelParameters . mLoggingMode = SSC_LOGGING_NONE ;
modelParameters . mRTWModifiedTimeStamp = 5.7550694E+8 ; modelParameters .
mZcDisabled = false ; tmp_e = 0.001 ; modelParameters . mSolverTolerance =
tmp_e ; tmp_e = 0.0 ; modelParameters . mFixedStepSize = tmp_e ; tmp = true ;
modelParameters . mVariableStepSolver = tmp ; tmp = false ; modelParameters .
mIsUsingODEN = tmp ; val = false ; tmp = slIsRapidAcceleratorSimulating ( ) ;
if ( tmp ) { tmp = ssGetGlobalInitialStatesAvailable ( rtS ) ; val = ( tmp &&
ssIsFirstInitCond ( rtS ) ) ; } modelParameters . mLoadInitialState = val ;
modelParameters . mZcDisabled = false ; diagnosticManager = (
NeuDiagnosticManager * ) rtDW . llvyklp4og ; diagnosticTree =
neu_diagnostic_manager_get_initial_tree ( diagnosticManager ) ; tmp_i =
nesl_initialize_simulator ( ( NeslSimulator * ) rtDW . ntaizccyaf , &
modelParameters , diagnosticManager ) ; if ( tmp_i != 0 ) { tmp =
error_buffer_is_empty ( ssGetErrorStatus ( rtS ) ) ; if ( tmp ) { msg =
rtw_diagnostics_msg ( diagnosticTree ) ; ssSetErrorStatus ( rtS , msg ) ; } }
simulationData = ( NeslSimulationData * ) rtDW . am0ltiyuj4 ; time = ssGetT (
rtS ) ; simulationData -> mData -> mTime . mN = 1 ; simulationData -> mData
-> mTime . mX = & time ; simulationData -> mData -> mContStates . mN = 4 ;
simulationData -> mData -> mContStates . mX = & rtX . fv1jm0s3ra [ 0 ] ;
simulationData -> mData -> mDiscStates . mN = 0 ; simulationData -> mData ->
mDiscStates . mX = & rtDW . fom02y4gvs ; simulationData -> mData ->
mModeVector . mN = 0 ; simulationData -> mData -> mModeVector . mX = & rtDW .
jepf1iw4x1 ; tmp = ( ssIsMajorTimeStep ( rtS ) && ssGetRTWSolverInfo ( rtS )
-> foundContZcEvents ) ; simulationData -> mData -> mFoundZcEvents = tmp ;
simulationData -> mData -> mIsMajorTimeStep = ssIsMajorTimeStep ( rtS ) ; tmp
= ( ssGetMdlInfoPtr ( rtS ) -> mdlFlags . solverAssertCheck == 1U ) ;
simulationData -> mData -> mIsSolverAssertCheck = tmp ; tmp =
ssIsSolverCheckingCIC ( rtS ) ; simulationData -> mData ->
mIsSolverCheckingCIC = tmp ; tmp = ssIsSolverComputingJacobian ( rtS ) ;
simulationData -> mData -> mIsComputingJacobian = tmp ; simulationData ->
mData -> mIsEvaluatingF0 = ( ssGetEvaluatingF0ForJacobian ( rtS ) != 0 ) ;
tmp = ssIsSolverRequestingReset ( rtS ) ; simulationData -> mData ->
mIsSolverRequestingReset = tmp ; simulationData -> mData ->
mIsModeUpdateTimeStep = ssIsModeUpdateTimeStep ( rtS ) ; tmp_g [ 0 ] = 0 ;
tmp_m [ 0 ] = rtB . o0x1n3piu3 [ 0 ] ; tmp_m [ 1 ] = rtB . o0x1n3piu3 [ 1 ] ;
tmp_m [ 2 ] = rtB . o0x1n3piu3 [ 2 ] ; tmp_m [ 3 ] = rtB . o0x1n3piu3 [ 3 ] ;
tmp_g [ 1 ] = 4 ; simulationData -> mData -> mInputValues . mN = 4 ;
simulationData -> mData -> mInputValues . mX = & tmp_m [ 0 ] ; simulationData
-> mData -> mInputOffsets . mN = 2 ; simulationData -> mData -> mInputOffsets
. mX = & tmp_g [ 0 ] ; simulationData -> mData -> mNumjacDxLo . mN = 4 ;
simulationData -> mData -> mNumjacDxLo . mX = & _rtXPerturbMin -> fv1jm0s3ra
[ 0 ] ; simulationData -> mData -> mNumjacDxHi . mN = 4 ; simulationData ->
mData -> mNumjacDxHi . mX = & _rtXPerturbMax -> fv1jm0s3ra [ 0 ] ;
diagnosticManager = ( NeuDiagnosticManager * ) rtDW . llvyklp4og ;
diagnosticTree_p = neu_diagnostic_manager_get_initial_tree (
diagnosticManager ) ; tmp_i = ne_simulator_method ( ( NeslSimulator * ) rtDW
. ntaizccyaf , NESL_SIM_NUMJAC_DX_BOUNDS , simulationData , diagnosticManager
) ; if ( tmp_i != 0 ) { tmp = error_buffer_is_empty ( ssGetErrorStatus ( rtS
) ) ; if ( tmp ) { msg_p = rtw_diagnostics_msg ( diagnosticTree_p ) ;
ssSetErrorStatus ( rtS , msg_p ) ; } } tmp_p = nesl_lease_simulator (
"Untitled1/Solver Configuration_1" , 1 , 0 ) ; rtDW . c4m2irodvz = ( void * )
tmp_p ; tmp = pointer_is_null ( rtDW . c4m2irodvz ) ; if ( tmp ) {
Untitled1_da03314a_1_gateway ( ) ; tmp_p = nesl_lease_simulator (
"Untitled1/Solver Configuration_1" , 1 , 0 ) ; rtDW . c4m2irodvz = ( void * )
tmp_p ; } slsaSaveRawMemoryForSimTargetOP ( rtS ,
"Untitled1/Solver Configuration_110" , ( void * * ) ( & rtDW . c4m2irodvz ) ,
0U * sizeof ( real_T ) , nesl_save_simdata , nesl_restore_simdata ) ;
simulationData = nesl_create_simulation_data ( ) ; rtDW . lrhuya04aq = ( void
* ) simulationData ; diagnosticManager = rtw_create_diagnostics ( ) ; rtDW .
pf2k450y4x = ( void * ) diagnosticManager ; modelParameters_p . mSolverType =
NE_SOLVER_TYPE_DAE ; modelParameters_p . mSolverTolerance = 0.001 ;
modelParameters_p . mSolverAbsTol = 0.001 ; modelParameters_p . mSolverRelTol
= 0.001 ; modelParameters_p . mVariableStepSolver = true ; modelParameters_p
. mIsUsingODEN = false ; modelParameters_p . mSolverModifyAbsTol =
NE_MODIFY_ABS_TOL_MAYBE ; modelParameters_p . mFixedStepSize = 0.001 ;
modelParameters_p . mStartTime = 0.0 ; modelParameters_p . mLoadInitialState
= false ; modelParameters_p . mUseSimState = false ; modelParameters_p .
mLinTrimCompile = false ; modelParameters_p . mLoggingMode = SSC_LOGGING_NONE
; modelParameters_p . mRTWModifiedTimeStamp = 5.7550694E+8 ;
modelParameters_p . mZcDisabled = false ; tmp_e = 0.001 ; modelParameters_p .
mSolverTolerance = tmp_e ; tmp_e = 0.0 ; modelParameters_p . mFixedStepSize =
tmp_e ; tmp = true ; modelParameters_p . mVariableStepSolver = tmp ; tmp =
false ; modelParameters_p . mIsUsingODEN = tmp ; val = false ; tmp =
slIsRapidAcceleratorSimulating ( ) ; if ( tmp ) { tmp =
ssGetGlobalInitialStatesAvailable ( rtS ) ; val = ( tmp && ssIsFirstInitCond
( rtS ) ) ; } modelParameters_p . mLoadInitialState = val ; modelParameters_p
. mZcDisabled = false ; diagnosticManager = ( NeuDiagnosticManager * ) rtDW .
pf2k450y4x ; diagnosticTree_e = neu_diagnostic_manager_get_initial_tree (
diagnosticManager ) ; tmp_i = nesl_initialize_simulator ( ( NeslSimulator * )
rtDW . c4m2irodvz , & modelParameters_p , diagnosticManager ) ; if ( tmp_i !=
0 ) { tmp = error_buffer_is_empty ( ssGetErrorStatus ( rtS ) ) ; if ( tmp ) {
msg_e = rtw_diagnostics_msg ( diagnosticTree_e ) ; ssSetErrorStatus ( rtS ,
msg_e ) ; } } MdlInitialize ( ) ; } void MdlOutputs ( int_T tid ) { real_T
fs4abh4qng ; real_T g1nzhyaeqb ; NeParameterBundle expl_temp ;
NeslSimulationData * simulationData ; NeuDiagnosticManager * diag ;
NeuDiagnosticTree * diagTree ; NeuDiagnosticTree * diagnosticTree ;
NeuDiagnosticTree * diagnosticTree_p ; char * msg ; char * msg_e ; char *
msg_p ; real_T tmp_i [ 8 ] ; real_T tmp_p [ 4 ] ; real_T tmp [ 3 ] ; real_T
time ; real_T time_e ; real_T time_i ; real_T time_p ; real_T *
parameterBundle_mRealParameters_mX ; int32_T i ; int_T tmp_m [ 3 ] ; int_T
tmp_e [ 2 ] ; boolean_T ok ; if ( ssIsSampleHit ( rtS , 1 , 0 ) ) {
dfbsjhxmp2 ( rtP . V0_Value , & rtB . oo3ambzquj ) ; } if (
ssIsModeUpdateTimeStep ( rtS ) ) { if ( rtDW . psybpwndnj != 0 ) { memcpy ( &
rtX . g0mc3r5gzj [ 0 ] , & rtB . oo3ambzquj . bcbbityvgg [ 0 ] , 13U * sizeof
( real_T ) ) ; } memcpy ( & rtB . bp3pppoyvc [ 0 ] , & rtX . g0mc3r5gzj [ 0 ]
, 13U * sizeof ( real_T ) ) ; } else { memcpy ( & rtB . bp3pppoyvc [ 0 ] , &
rtX . g0mc3r5gzj [ 0 ] , 13U * sizeof ( real_T ) ) ; } if ( ssIsSampleHit (
rtS , 1 , 0 ) ) { dfbsjhxmp2 ( rtP . V0_Value_ijxamwyxru , & rtB . plbg54lico
) ; } if ( ssIsModeUpdateTimeStep ( rtS ) ) { if ( rtDW . lg1ypko4k2 != 0 ) {
memcpy ( & rtX . lzbko4ydo0 [ 0 ] , & rtB . plbg54lico . bcbbityvgg [ 0 ] ,
13U * sizeof ( real_T ) ) ; } memcpy ( & rtB . al4dlzzee3 [ 0 ] , & rtX .
lzbko4ydo0 [ 0 ] , 13U * sizeof ( real_T ) ) ; } else { memcpy ( & rtB .
al4dlzzee3 [ 0 ] , & rtX . lzbko4ydo0 [ 0 ] , 13U * sizeof ( real_T ) ) ; }
if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { if ( rtDW . jqp0un0nfr ) { tmp [ 0 ] =
rtP . RTP_027A0CB6_GravityVector_Value [ 0 ] ; tmp [ 1 ] = rtP .
RTP_027A0CB6_GravityVector_Value [ 1 ] ; tmp [ 2 ] = rtP .
RTP_027A0CB6_GravityVector_Value [ 2 ] ; parameterBundle_mRealParameters_mX =
& tmp [ 0 ] ; diag = rtw_create_diagnostics ( ) ; diagTree =
neu_diagnostic_manager_get_initial_tree ( diag ) ; expl_temp .
mRealParameters . mN = 3 ; expl_temp . mRealParameters . mX =
parameterBundle_mRealParameters_mX ; expl_temp . mLogicalParameters . mN = 0
; expl_temp . mLogicalParameters . mX = NULL ; expl_temp . mIntegerParameters
. mN = 0 ; expl_temp . mIntegerParameters . mX = NULL ; expl_temp .
mIndexParameters . mN = 0 ; expl_temp . mIndexParameters . mX = NULL ; ok =
nesl_rtp_manager_set_rtps ( ( NeslRtpManager * ) rtDW . bbpuvhaqb1 , ssGetT (
rtS ) , expl_temp , diag ) ; if ( ! ok ) { ok = error_buffer_is_empty (
ssGetErrorStatus ( rtS ) ) ; if ( ok ) { msg = rtw_diagnostics_msg ( diagTree
) ; ssSetErrorStatus ( rtS , msg ) ; } } } rtDW . jqp0un0nfr = false ; }
simulationData = ( NeslSimulationData * ) rtDW . am0ltiyuj4 ; time = ssGetT (
rtS ) ; simulationData -> mData -> mTime . mN = 1 ; simulationData -> mData
-> mTime . mX = & time ; simulationData -> mData -> mContStates . mN = 4 ;
simulationData -> mData -> mContStates . mX = & rtX . fv1jm0s3ra [ 0 ] ;
simulationData -> mData -> mDiscStates . mN = 0 ; simulationData -> mData ->
mDiscStates . mX = & rtDW . fom02y4gvs ; simulationData -> mData ->
mModeVector . mN = 0 ; simulationData -> mData -> mModeVector . mX = & rtDW .
jepf1iw4x1 ; ok = ( ssIsMajorTimeStep ( rtS ) && ssGetRTWSolverInfo ( rtS )
-> foundContZcEvents ) ; simulationData -> mData -> mFoundZcEvents = ok ;
simulationData -> mData -> mIsMajorTimeStep = ssIsMajorTimeStep ( rtS ) ; ok
= ( ssGetMdlInfoPtr ( rtS ) -> mdlFlags . solverAssertCheck == 1U ) ;
simulationData -> mData -> mIsSolverAssertCheck = ok ; ok =
ssIsSolverCheckingCIC ( rtS ) ; simulationData -> mData ->
mIsSolverCheckingCIC = ok ; ok = ssIsSolverComputingJacobian ( rtS ) ;
simulationData -> mData -> mIsComputingJacobian = ok ; simulationData ->
mData -> mIsEvaluatingF0 = ( ssGetEvaluatingF0ForJacobian ( rtS ) != 0 ) ; ok
= ssIsSolverRequestingReset ( rtS ) ; simulationData -> mData ->
mIsSolverRequestingReset = ok ; simulationData -> mData ->
mIsModeUpdateTimeStep = ssIsModeUpdateTimeStep ( rtS ) ; tmp_e [ 0 ] = 0 ;
tmp_p [ 0 ] = rtB . o0x1n3piu3 [ 0 ] ; tmp_p [ 1 ] = rtB . o0x1n3piu3 [ 1 ] ;
tmp_p [ 2 ] = rtB . o0x1n3piu3 [ 2 ] ; tmp_p [ 3 ] = rtB . o0x1n3piu3 [ 3 ] ;
tmp_e [ 1 ] = 4 ; simulationData -> mData -> mInputValues . mN = 4 ;
simulationData -> mData -> mInputValues . mX = & tmp_p [ 0 ] ; simulationData
-> mData -> mInputOffsets . mN = 2 ; simulationData -> mData -> mInputOffsets
. mX = & tmp_e [ 0 ] ; simulationData -> mData -> mOutputs . mN = 4 ;
simulationData -> mData -> mOutputs . mX = & rtB . m05vyxtmat [ 0 ] ;
simulationData -> mData -> mTolerances . mN = 0 ; simulationData -> mData ->
mTolerances . mX = NULL ; simulationData -> mData -> mCstateHasChanged =
false ; time_p = ssGetTaskTime ( rtS , 0 ) ; simulationData -> mData -> mTime
. mN = 1 ; simulationData -> mData -> mTime . mX = & time_p ; simulationData
-> mData -> mSampleHits . mN = 0 ; simulationData -> mData -> mSampleHits .
mX = NULL ; simulationData -> mData -> mIsFundamentalSampleHit = false ; diag
= ( NeuDiagnosticManager * ) rtDW . llvyklp4og ; diagnosticTree =
neu_diagnostic_manager_get_initial_tree ( diag ) ; i = ne_simulator_method (
( NeslSimulator * ) rtDW . ntaizccyaf , NESL_SIM_OUTPUTS , simulationData ,
diag ) ; if ( i != 0 ) { ok = error_buffer_is_empty ( ssGetErrorStatus ( rtS
) ) ; if ( ok ) { msg_p = rtw_diagnostics_msg ( diagnosticTree ) ;
ssSetErrorStatus ( rtS , msg_p ) ; } } if ( ssIsMajorTimeStep ( rtS ) &&
simulationData -> mData -> mCstateHasChanged ) {
ssSetBlockStateForSolverChangedAtMajorStep ( rtS ) ; } simulationData = (
NeslSimulationData * ) rtDW . lrhuya04aq ; time_e = ssGetT ( rtS ) ;
simulationData -> mData -> mTime . mN = 1 ; simulationData -> mData -> mTime
. mX = & time_e ; simulationData -> mData -> mContStates . mN = 0 ;
simulationData -> mData -> mContStates . mX = NULL ; simulationData -> mData
-> mDiscStates . mN = 0 ; simulationData -> mData -> mDiscStates . mX = &
rtDW . gjy15tdmce ; simulationData -> mData -> mModeVector . mN = 0 ;
simulationData -> mData -> mModeVector . mX = & rtDW . jw3jeluxdh ; ok = (
ssIsMajorTimeStep ( rtS ) && ssGetRTWSolverInfo ( rtS ) -> foundContZcEvents
) ; simulationData -> mData -> mFoundZcEvents = ok ; simulationData -> mData
-> mIsMajorTimeStep = ssIsMajorTimeStep ( rtS ) ; ok = ( ssGetMdlInfoPtr (
rtS ) -> mdlFlags . solverAssertCheck == 1U ) ; simulationData -> mData ->
mIsSolverAssertCheck = ok ; ok = ssIsSolverCheckingCIC ( rtS ) ;
simulationData -> mData -> mIsSolverCheckingCIC = ok ; simulationData ->
mData -> mIsComputingJacobian = false ; simulationData -> mData ->
mIsEvaluatingF0 = false ; ok = ssIsSolverRequestingReset ( rtS ) ;
simulationData -> mData -> mIsSolverRequestingReset = ok ; simulationData ->
mData -> mIsModeUpdateTimeStep = ssIsModeUpdateTimeStep ( rtS ) ; tmp_m [ 0 ]
= 0 ; tmp_i [ 0 ] = rtB . o0x1n3piu3 [ 0 ] ; tmp_i [ 1 ] = rtB . o0x1n3piu3 [
1 ] ; tmp_i [ 2 ] = rtB . o0x1n3piu3 [ 2 ] ; tmp_i [ 3 ] = rtB . o0x1n3piu3 [
3 ] ; tmp_m [ 1 ] = 4 ; tmp_i [ 4 ] = rtB . m05vyxtmat [ 0 ] ; tmp_i [ 5 ] =
rtB . m05vyxtmat [ 1 ] ; tmp_i [ 6 ] = rtB . m05vyxtmat [ 2 ] ; tmp_i [ 7 ] =
rtB . m05vyxtmat [ 3 ] ; tmp_m [ 2 ] = 8 ; simulationData -> mData ->
mInputValues . mN = 8 ; simulationData -> mData -> mInputValues . mX = &
tmp_i [ 0 ] ; simulationData -> mData -> mInputOffsets . mN = 3 ;
simulationData -> mData -> mInputOffsets . mX = & tmp_m [ 0 ] ;
simulationData -> mData -> mOutputs . mN = 2 ; simulationData -> mData ->
mOutputs . mX = & rtB . kgzqkrdohc [ 0 ] ; simulationData -> mData ->
mTolerances . mN = 0 ; simulationData -> mData -> mTolerances . mX = NULL ;
simulationData -> mData -> mCstateHasChanged = false ; time_i = ssGetTaskTime
( rtS , 0 ) ; simulationData -> mData -> mTime . mN = 1 ; simulationData ->
mData -> mTime . mX = & time_i ; simulationData -> mData -> mSampleHits . mN
= 0 ; simulationData -> mData -> mSampleHits . mX = NULL ; simulationData ->
mData -> mIsFundamentalSampleHit = false ; diag = ( NeuDiagnosticManager * )
rtDW . pf2k450y4x ; diagnosticTree_p =
neu_diagnostic_manager_get_initial_tree ( diag ) ; i = ne_simulator_method (
( NeslSimulator * ) rtDW . c4m2irodvz , NESL_SIM_OUTPUTS , simulationData ,
diag ) ; if ( i != 0 ) { ok = error_buffer_is_empty ( ssGetErrorStatus ( rtS
) ) ; if ( ok ) { msg_e = rtw_diagnostics_msg ( diagnosticTree_p ) ;
ssSetErrorStatus ( rtS , msg_e ) ; } } if ( ssIsMajorTimeStep ( rtS ) &&
simulationData -> mData -> mCstateHasChanged ) {
ssSetBlockStateForSolverChangedAtMajorStep ( rtS ) ; } rtB . osrdp3vcae = rtB
. kgzqkrdohc [ 0 ] ; fjgxmk3spi ( rtB . bp3pppoyvc [ 0 ] , rtP .
Constant2_Value , & rtB . ha2dloucon ) ; fjgxmk3spi ( rtB . al4dlzzee3 [ 0 ]
, rtP . Constant3_Value , & rtB . kx2u2otjiy ) ; rtB . oj23ghszu3 = rtB .
ha2dloucon . krfr5v4lja + rtB . kx2u2otjiy . krfr5v4lja ; fs4abh4qng = ssGetT
( rtS ) ; rtB . ohhlnpvtnb = muDoubleScalarSin ( rtB . osrdp3vcae -
3.1415926535897931 ) * - rtP . Constant_Value + rtP . Constant1_Value ; rtB .
etpouhlg5j = ( muDoubleScalarSin ( rtP . SineWave_Freq * ssGetTaskTime ( rtS
, 0 ) + rtP . SineWave_Phase ) * rtP . SineWave_Amp + rtP . SineWave_Bias ) +
rtB . ohhlnpvtnb ; mzbrkph513 ( rtB . bp3pppoyvc , fs4abh4qng , rtB .
etpouhlg5j , & rtB . cqigm5udrw ) ; g1nzhyaeqb = ssGetT ( rtS ) ; rtB .
o4mvedy5x2 = muDoubleScalarSin ( rtB . osrdp3vcae - 3.1415926535897931 ) *
rtP . Constant5_Value + rtP . Constant4_Value ; rtB . dqx50lsmsy = (
muDoubleScalarSin ( rtP . SineWave_Freq_lwz20jzl5j * ssGetTaskTime ( rtS , 0
) + rtP . SineWave_Phase_kq4yrsmvx1 ) * rtP . SineWave_Amp_gtkrkjckvw + rtP .
SineWave_Bias_lm2amzzq1o ) + rtB . o4mvedy5x2 ; mzbrkph513 ( rtB . al4dlzzee3
, g1nzhyaeqb , rtB . dqx50lsmsy , & rtB . csiqn5xj0p ) ; rtB . o0x1n3piu3 [ 0
] = rtB . oj23ghszu3 ; rtB . o0x1n3piu3 [ 1 ] = 0.0 ; rtB . o0x1n3piu3 [ 2 ]
= 0.0 ; rtB . o0x1n3piu3 [ 3 ] = 0.0 ; UNUSED_PARAMETER ( tid ) ; } void
MdlOutputsTID2 ( int_T tid ) { UNUSED_PARAMETER ( tid ) ; } void MdlUpdate (
int_T tid ) { NeslSimulationData * simulationData ; NeuDiagnosticManager *
diagnosticManager ; NeuDiagnosticTree * diagnosticTree ; char * msg ; real_T
tmp_p [ 4 ] ; real_T time ; int32_T tmp_i ; int_T tmp_e [ 2 ] ; boolean_T tmp
; rtDW . psybpwndnj = 0 ; rtDW . lg1ypko4k2 = 0 ; simulationData = (
NeslSimulationData * ) rtDW . am0ltiyuj4 ; time = ssGetT ( rtS ) ;
simulationData -> mData -> mTime . mN = 1 ; simulationData -> mData -> mTime
. mX = & time ; simulationData -> mData -> mContStates . mN = 4 ;
simulationData -> mData -> mContStates . mX = & rtX . fv1jm0s3ra [ 0 ] ;
simulationData -> mData -> mDiscStates . mN = 0 ; simulationData -> mData ->
mDiscStates . mX = & rtDW . fom02y4gvs ; simulationData -> mData ->
mModeVector . mN = 0 ; simulationData -> mData -> mModeVector . mX = & rtDW .
jepf1iw4x1 ; tmp = ( ssIsMajorTimeStep ( rtS ) && ssGetRTWSolverInfo ( rtS )
-> foundContZcEvents ) ; simulationData -> mData -> mFoundZcEvents = tmp ;
simulationData -> mData -> mIsMajorTimeStep = ssIsMajorTimeStep ( rtS ) ; tmp
= ( ssGetMdlInfoPtr ( rtS ) -> mdlFlags . solverAssertCheck == 1U ) ;
simulationData -> mData -> mIsSolverAssertCheck = tmp ; tmp =
ssIsSolverCheckingCIC ( rtS ) ; simulationData -> mData ->
mIsSolverCheckingCIC = tmp ; tmp = ssIsSolverComputingJacobian ( rtS ) ;
simulationData -> mData -> mIsComputingJacobian = tmp ; simulationData ->
mData -> mIsEvaluatingF0 = ( ssGetEvaluatingF0ForJacobian ( rtS ) != 0 ) ;
tmp = ssIsSolverRequestingReset ( rtS ) ; simulationData -> mData ->
mIsSolverRequestingReset = tmp ; simulationData -> mData ->
mIsModeUpdateTimeStep = ssIsModeUpdateTimeStep ( rtS ) ; tmp_e [ 0 ] = 0 ;
tmp_p [ 0 ] = rtB . o0x1n3piu3 [ 0 ] ; tmp_p [ 1 ] = rtB . o0x1n3piu3 [ 1 ] ;
tmp_p [ 2 ] = rtB . o0x1n3piu3 [ 2 ] ; tmp_p [ 3 ] = rtB . o0x1n3piu3 [ 3 ] ;
tmp_e [ 1 ] = 4 ; simulationData -> mData -> mInputValues . mN = 4 ;
simulationData -> mData -> mInputValues . mX = & tmp_p [ 0 ] ; simulationData
-> mData -> mInputOffsets . mN = 2 ; simulationData -> mData -> mInputOffsets
. mX = & tmp_e [ 0 ] ; diagnosticManager = ( NeuDiagnosticManager * ) rtDW .
llvyklp4og ; diagnosticTree = neu_diagnostic_manager_get_initial_tree (
diagnosticManager ) ; tmp_i = ne_simulator_method ( ( NeslSimulator * ) rtDW
. ntaizccyaf , NESL_SIM_UPDATE , simulationData , diagnosticManager ) ; if (
tmp_i != 0 ) { tmp = error_buffer_is_empty ( ssGetErrorStatus ( rtS ) ) ; if
( tmp ) { msg = rtw_diagnostics_msg ( diagnosticTree ) ; ssSetErrorStatus (
rtS , msg ) ; } } UNUSED_PARAMETER ( tid ) ; } void MdlUpdateTID2 ( int_T tid
) { UNUSED_PARAMETER ( tid ) ; } void MdlDerivatives ( void ) {
NeslSimulationData * simulationData ; NeuDiagnosticManager *
diagnosticManager ; NeuDiagnosticTree * diagnosticTree ; XDot * _rtXdot ;
char * msg ; real_T tmp_p [ 4 ] ; real_T time ; int32_T i ; int_T tmp_e [ 2 ]
; boolean_T tmp ; _rtXdot = ( ( XDot * ) ssGetdX ( rtS ) ) ; memcpy ( &
_rtXdot -> g0mc3r5gzj [ 0 ] , & rtB . cqigm5udrw . nlkstedhnb [ 0 ] , 13U *
sizeof ( real_T ) ) ; memcpy ( & _rtXdot -> lzbko4ydo0 [ 0 ] , & rtB .
csiqn5xj0p . nlkstedhnb [ 0 ] , 13U * sizeof ( real_T ) ) ; simulationData =
( NeslSimulationData * ) rtDW . am0ltiyuj4 ; time = ssGetT ( rtS ) ;
simulationData -> mData -> mTime . mN = 1 ; simulationData -> mData -> mTime
. mX = & time ; simulationData -> mData -> mContStates . mN = 4 ;
simulationData -> mData -> mContStates . mX = & rtX . fv1jm0s3ra [ 0 ] ;
simulationData -> mData -> mDiscStates . mN = 0 ; simulationData -> mData ->
mDiscStates . mX = & rtDW . fom02y4gvs ; simulationData -> mData ->
mModeVector . mN = 0 ; simulationData -> mData -> mModeVector . mX = & rtDW .
jepf1iw4x1 ; tmp = ( ssIsMajorTimeStep ( rtS ) && ssGetRTWSolverInfo ( rtS )
-> foundContZcEvents ) ; simulationData -> mData -> mFoundZcEvents = tmp ;
simulationData -> mData -> mIsMajorTimeStep = ssIsMajorTimeStep ( rtS ) ; tmp
= ( ssGetMdlInfoPtr ( rtS ) -> mdlFlags . solverAssertCheck == 1U ) ;
simulationData -> mData -> mIsSolverAssertCheck = tmp ; tmp =
ssIsSolverCheckingCIC ( rtS ) ; simulationData -> mData ->
mIsSolverCheckingCIC = tmp ; tmp = ssIsSolverComputingJacobian ( rtS ) ;
simulationData -> mData -> mIsComputingJacobian = tmp ; simulationData ->
mData -> mIsEvaluatingF0 = ( ssGetEvaluatingF0ForJacobian ( rtS ) != 0 ) ;
tmp = ssIsSolverRequestingReset ( rtS ) ; simulationData -> mData ->
mIsSolverRequestingReset = tmp ; simulationData -> mData ->
mIsModeUpdateTimeStep = ssIsModeUpdateTimeStep ( rtS ) ; tmp_e [ 0 ] = 0 ;
tmp_p [ 0 ] = rtB . o0x1n3piu3 [ 0 ] ; tmp_p [ 1 ] = rtB . o0x1n3piu3 [ 1 ] ;
tmp_p [ 2 ] = rtB . o0x1n3piu3 [ 2 ] ; tmp_p [ 3 ] = rtB . o0x1n3piu3 [ 3 ] ;
tmp_e [ 1 ] = 4 ; simulationData -> mData -> mInputValues . mN = 4 ;
simulationData -> mData -> mInputValues . mX = & tmp_p [ 0 ] ; simulationData
-> mData -> mInputOffsets . mN = 2 ; simulationData -> mData -> mInputOffsets
. mX = & tmp_e [ 0 ] ; simulationData -> mData -> mDx . mN = 4 ;
simulationData -> mData -> mDx . mX = & _rtXdot -> fv1jm0s3ra [ 0 ] ;
diagnosticManager = ( NeuDiagnosticManager * ) rtDW . llvyklp4og ;
diagnosticTree = neu_diagnostic_manager_get_initial_tree ( diagnosticManager
) ; i = ne_simulator_method ( ( NeslSimulator * ) rtDW . ntaizccyaf ,
NESL_SIM_DERIVATIVES , simulationData , diagnosticManager ) ; if ( i != 0 ) {
tmp = error_buffer_is_empty ( ssGetErrorStatus ( rtS ) ) ; if ( tmp ) { msg =
rtw_diagnostics_msg ( diagnosticTree ) ; ssSetErrorStatus ( rtS , msg ) ; } }
} void MdlProjection ( void ) { NeslSimulationData * simulationData ;
NeuDiagnosticManager * diagnosticManager ; NeuDiagnosticTree * diagnosticTree
; char * msg ; real_T tmp_p [ 4 ] ; real_T time ; int32_T tmp_i ; int_T tmp_e
[ 2 ] ; boolean_T tmp ; simulationData = ( NeslSimulationData * ) rtDW .
am0ltiyuj4 ; time = ssGetT ( rtS ) ; simulationData -> mData -> mTime . mN =
1 ; simulationData -> mData -> mTime . mX = & time ; simulationData -> mData
-> mContStates . mN = 4 ; simulationData -> mData -> mContStates . mX = & rtX
. fv1jm0s3ra [ 0 ] ; simulationData -> mData -> mDiscStates . mN = 0 ;
simulationData -> mData -> mDiscStates . mX = & rtDW . fom02y4gvs ;
simulationData -> mData -> mModeVector . mN = 0 ; simulationData -> mData ->
mModeVector . mX = & rtDW . jepf1iw4x1 ; tmp = ( ssIsMajorTimeStep ( rtS ) &&
ssGetRTWSolverInfo ( rtS ) -> foundContZcEvents ) ; simulationData -> mData
-> mFoundZcEvents = tmp ; simulationData -> mData -> mIsMajorTimeStep =
ssIsMajorTimeStep ( rtS ) ; tmp = ( ssGetMdlInfoPtr ( rtS ) -> mdlFlags .
solverAssertCheck == 1U ) ; simulationData -> mData -> mIsSolverAssertCheck =
tmp ; tmp = ssIsSolverCheckingCIC ( rtS ) ; simulationData -> mData ->
mIsSolverCheckingCIC = tmp ; tmp = ssIsSolverComputingJacobian ( rtS ) ;
simulationData -> mData -> mIsComputingJacobian = tmp ; simulationData ->
mData -> mIsEvaluatingF0 = ( ssGetEvaluatingF0ForJacobian ( rtS ) != 0 ) ;
tmp = ssIsSolverRequestingReset ( rtS ) ; simulationData -> mData ->
mIsSolverRequestingReset = tmp ; simulationData -> mData ->
mIsModeUpdateTimeStep = ssIsModeUpdateTimeStep ( rtS ) ; tmp_e [ 0 ] = 0 ;
tmp_p [ 0 ] = rtB . o0x1n3piu3 [ 0 ] ; tmp_p [ 1 ] = rtB . o0x1n3piu3 [ 1 ] ;
tmp_p [ 2 ] = rtB . o0x1n3piu3 [ 2 ] ; tmp_p [ 3 ] = rtB . o0x1n3piu3 [ 3 ] ;
tmp_e [ 1 ] = 4 ; simulationData -> mData -> mInputValues . mN = 4 ;
simulationData -> mData -> mInputValues . mX = & tmp_p [ 0 ] ; simulationData
-> mData -> mInputOffsets . mN = 2 ; simulationData -> mData -> mInputOffsets
. mX = & tmp_e [ 0 ] ; diagnosticManager = ( NeuDiagnosticManager * ) rtDW .
llvyklp4og ; diagnosticTree = neu_diagnostic_manager_get_initial_tree (
diagnosticManager ) ; tmp_i = ne_simulator_method ( ( NeslSimulator * ) rtDW
. ntaizccyaf , NESL_SIM_PROJECTION , simulationData , diagnosticManager ) ;
if ( tmp_i != 0 ) { tmp = error_buffer_is_empty ( ssGetErrorStatus ( rtS ) )
; if ( tmp ) { msg = rtw_diagnostics_msg ( diagnosticTree ) ;
ssSetErrorStatus ( rtS , msg ) ; } } } void MdlTerminate ( void ) {
neu_destroy_diagnostic_manager ( ( NeuDiagnosticManager * ) rtDW . llvyklp4og
) ; nesl_destroy_simulation_data ( ( NeslSimulationData * ) rtDW . am0ltiyuj4
) ; nesl_erase_simulator ( "Untitled1/Solver Configuration_1" ) ;
nesl_destroy_registry ( ) ; neu_destroy_diagnostic_manager ( (
NeuDiagnosticManager * ) rtDW . pf2k450y4x ) ; nesl_destroy_simulation_data (
( NeslSimulationData * ) rtDW . lrhuya04aq ) ; nesl_erase_simulator (
"Untitled1/Solver Configuration_1" ) ; nesl_destroy_registry ( ) ; } static
void mr_Untitled1_cacheDataAsMxArray ( mxArray * destArray , mwIndex i , int
j , const void * srcData , size_t numBytes ) ; static void
mr_Untitled1_cacheDataAsMxArray ( mxArray * destArray , mwIndex i , int j ,
const void * srcData , size_t numBytes ) { mxArray * newArray =
mxCreateUninitNumericMatrix ( ( size_t ) 1 , numBytes , mxUINT8_CLASS ,
mxREAL ) ; memcpy ( ( uint8_T * ) mxGetData ( newArray ) , ( const uint8_T *
) srcData , numBytes ) ; mxSetFieldByNumber ( destArray , i , j , newArray )
; } static void mr_Untitled1_restoreDataFromMxArray ( void * destData , const
mxArray * srcArray , mwIndex i , int j , size_t numBytes ) ; static void
mr_Untitled1_restoreDataFromMxArray ( void * destData , const mxArray *
srcArray , mwIndex i , int j , size_t numBytes ) { memcpy ( ( uint8_T * )
destData , ( const uint8_T * ) mxGetData ( mxGetFieldByNumber ( srcArray , i
, j ) ) , numBytes ) ; } static void mr_Untitled1_cacheBitFieldToMxArray (
mxArray * destArray , mwIndex i , int j , uint_T bitVal ) ; static void
mr_Untitled1_cacheBitFieldToMxArray ( mxArray * destArray , mwIndex i , int j
, uint_T bitVal ) { mxSetFieldByNumber ( destArray , i , j ,
mxCreateDoubleScalar ( ( double ) bitVal ) ) ; } static uint_T
mr_Untitled1_extractBitFieldFromMxArray ( const mxArray * srcArray , mwIndex
i , int j , uint_T numBits ) ; static uint_T
mr_Untitled1_extractBitFieldFromMxArray ( const mxArray * srcArray , mwIndex
i , int j , uint_T numBits ) { const uint_T varVal = ( uint_T ) mxGetScalar (
mxGetFieldByNumber ( srcArray , i , j ) ) ; return varVal & ( ( 1u << numBits
) - 1u ) ; } static void mr_Untitled1_cacheDataToMxArrayWithOffset ( mxArray
* destArray , mwIndex i , int j , mwIndex offset , const void * srcData ,
size_t numBytes ) ; static void mr_Untitled1_cacheDataToMxArrayWithOffset (
mxArray * destArray , mwIndex i , int j , mwIndex offset , const void *
srcData , size_t numBytes ) { uint8_T * varData = ( uint8_T * ) mxGetData (
mxGetFieldByNumber ( destArray , i , j ) ) ; memcpy ( ( uint8_T * ) & varData
[ offset * numBytes ] , ( const uint8_T * ) srcData , numBytes ) ; } static
void mr_Untitled1_restoreDataFromMxArrayWithOffset ( void * destData , const
mxArray * srcArray , mwIndex i , int j , mwIndex offset , size_t numBytes ) ;
static void mr_Untitled1_restoreDataFromMxArrayWithOffset ( void * destData ,
const mxArray * srcArray , mwIndex i , int j , mwIndex offset , size_t
numBytes ) { const uint8_T * varData = ( const uint8_T * ) mxGetData (
mxGetFieldByNumber ( srcArray , i , j ) ) ; memcpy ( ( uint8_T * ) destData ,
( const uint8_T * ) & varData [ offset * numBytes ] , numBytes ) ; } static
void mr_Untitled1_cacheBitFieldToCellArrayWithOffset ( mxArray * destArray ,
mwIndex i , int j , mwIndex offset , uint_T fieldVal ) ; static void
mr_Untitled1_cacheBitFieldToCellArrayWithOffset ( mxArray * destArray ,
mwIndex i , int j , mwIndex offset , uint_T fieldVal ) { mxSetCell (
mxGetFieldByNumber ( destArray , i , j ) , offset , mxCreateDoubleScalar ( (
double ) fieldVal ) ) ; } static uint_T
mr_Untitled1_extractBitFieldFromCellArrayWithOffset ( const mxArray *
srcArray , mwIndex i , int j , mwIndex offset , uint_T numBits ) ; static
uint_T mr_Untitled1_extractBitFieldFromCellArrayWithOffset ( const mxArray *
srcArray , mwIndex i , int j , mwIndex offset , uint_T numBits ) { const
uint_T fieldVal = ( uint_T ) mxGetScalar ( mxGetCell ( mxGetFieldByNumber (
srcArray , i , j ) , offset ) ) ; return fieldVal & ( ( 1u << numBits ) - 1u
) ; } mxArray * mr_Untitled1_GetDWork ( ) { static const char *
ssDWFieldNames [ 3 ] = { "rtB" , "rtDW" , "NULL_PrevZCX" , } ; mxArray * ssDW
= mxCreateStructMatrix ( 1 , 1 , 3 , ssDWFieldNames ) ;
mr_Untitled1_cacheDataAsMxArray ( ssDW , 0 , 0 , ( const void * ) & ( rtB ) ,
sizeof ( rtB ) ) ; { static const char * rtdwDataFieldNames [ 10 ] = {
"rtDW.i5gqks14de" , "rtDW.fom02y4gvs" , "rtDW.gjy15tdmce" , "rtDW.psybpwndnj"
, "rtDW.lg1ypko4k2" , "rtDW.jepf1iw4x1" , "rtDW.jw3jeluxdh" ,
"rtDW.jqp0un0nfr" , "rtDW.di50jkv023" , "rtDW.gd2flceb3v" , } ; mxArray *
rtdwData = mxCreateStructMatrix ( 1 , 1 , 10 , rtdwDataFieldNames ) ;
mr_Untitled1_cacheDataAsMxArray ( rtdwData , 0 , 0 , ( const void * ) & (
rtDW . i5gqks14de ) , sizeof ( rtDW . i5gqks14de ) ) ;
mr_Untitled1_cacheDataAsMxArray ( rtdwData , 0 , 1 , ( const void * ) & (
rtDW . fom02y4gvs ) , sizeof ( rtDW . fom02y4gvs ) ) ;
mr_Untitled1_cacheDataAsMxArray ( rtdwData , 0 , 2 , ( const void * ) & (
rtDW . gjy15tdmce ) , sizeof ( rtDW . gjy15tdmce ) ) ;
mr_Untitled1_cacheDataAsMxArray ( rtdwData , 0 , 3 , ( const void * ) & (
rtDW . psybpwndnj ) , sizeof ( rtDW . psybpwndnj ) ) ;
mr_Untitled1_cacheDataAsMxArray ( rtdwData , 0 , 4 , ( const void * ) & (
rtDW . lg1ypko4k2 ) , sizeof ( rtDW . lg1ypko4k2 ) ) ;
mr_Untitled1_cacheDataAsMxArray ( rtdwData , 0 , 5 , ( const void * ) & (
rtDW . jepf1iw4x1 ) , sizeof ( rtDW . jepf1iw4x1 ) ) ;
mr_Untitled1_cacheDataAsMxArray ( rtdwData , 0 , 6 , ( const void * ) & (
rtDW . jw3jeluxdh ) , sizeof ( rtDW . jw3jeluxdh ) ) ;
mr_Untitled1_cacheDataAsMxArray ( rtdwData , 0 , 7 , ( const void * ) & (
rtDW . jqp0un0nfr ) , sizeof ( rtDW . jqp0un0nfr ) ) ;
mr_Untitled1_cacheDataAsMxArray ( rtdwData , 0 , 8 , ( const void * ) & (
rtDW . di50jkv023 ) , sizeof ( rtDW . di50jkv023 ) ) ;
mr_Untitled1_cacheDataAsMxArray ( rtdwData , 0 , 9 , ( const void * ) & (
rtDW . gd2flceb3v ) , sizeof ( rtDW . gd2flceb3v ) ) ; mxSetFieldByNumber (
ssDW , 0 , 1 , rtdwData ) ; } return ssDW ; } void mr_Untitled1_SetDWork (
const mxArray * ssDW ) { ( void ) ssDW ; mr_Untitled1_restoreDataFromMxArray
( ( void * ) & ( rtB ) , ssDW , 0 , 0 , sizeof ( rtB ) ) ; { const mxArray *
rtdwData = mxGetFieldByNumber ( ssDW , 0 , 1 ) ;
mr_Untitled1_restoreDataFromMxArray ( ( void * ) & ( rtDW . i5gqks14de ) ,
rtdwData , 0 , 0 , sizeof ( rtDW . i5gqks14de ) ) ;
mr_Untitled1_restoreDataFromMxArray ( ( void * ) & ( rtDW . fom02y4gvs ) ,
rtdwData , 0 , 1 , sizeof ( rtDW . fom02y4gvs ) ) ;
mr_Untitled1_restoreDataFromMxArray ( ( void * ) & ( rtDW . gjy15tdmce ) ,
rtdwData , 0 , 2 , sizeof ( rtDW . gjy15tdmce ) ) ;
mr_Untitled1_restoreDataFromMxArray ( ( void * ) & ( rtDW . psybpwndnj ) ,
rtdwData , 0 , 3 , sizeof ( rtDW . psybpwndnj ) ) ;
mr_Untitled1_restoreDataFromMxArray ( ( void * ) & ( rtDW . lg1ypko4k2 ) ,
rtdwData , 0 , 4 , sizeof ( rtDW . lg1ypko4k2 ) ) ;
mr_Untitled1_restoreDataFromMxArray ( ( void * ) & ( rtDW . jepf1iw4x1 ) ,
rtdwData , 0 , 5 , sizeof ( rtDW . jepf1iw4x1 ) ) ;
mr_Untitled1_restoreDataFromMxArray ( ( void * ) & ( rtDW . jw3jeluxdh ) ,
rtdwData , 0 , 6 , sizeof ( rtDW . jw3jeluxdh ) ) ;
mr_Untitled1_restoreDataFromMxArray ( ( void * ) & ( rtDW . jqp0un0nfr ) ,
rtdwData , 0 , 7 , sizeof ( rtDW . jqp0un0nfr ) ) ;
mr_Untitled1_restoreDataFromMxArray ( ( void * ) & ( rtDW . di50jkv023 ) ,
rtdwData , 0 , 8 , sizeof ( rtDW . di50jkv023 ) ) ;
mr_Untitled1_restoreDataFromMxArray ( ( void * ) & ( rtDW . gd2flceb3v ) ,
rtdwData , 0 , 9 , sizeof ( rtDW . gd2flceb3v ) ) ; } } mxArray *
mr_Untitled1_GetSimStateDisallowedBlocks ( ) { mxArray * data =
mxCreateCellMatrix ( 9 , 3 ) ; mwIndex subs [ 2 ] , offset ; { static const
char * blockType [ 9 ] = { "Scope" , "SimscapeRtp" , "SimscapeExecutionBlock"
, "SimscapeExecutionBlock" , "Scope" , "Scope" , "SimscapeSinkBlock" ,
"SimscapeExecutionBlock" , "SimscapeExecutionBlock" , } ; static const char *
blockPath [ 9 ] = { "Untitled1/Scope" ,
"Untitled1/Solver Configuration/RTP_1" ,
"Untitled1/Solver Configuration/EVAL_KEY/STATE_1" ,
"Untitled1/Solver Configuration/EVAL_KEY/OUTPUT_1_0" , "Untitled1/Scope1" ,
"Untitled1/Scope2" , "Untitled1/Solver Configuration/EVAL_KEY/SINK_1" ,
"Untitled1/Solver Configuration/EVAL_KEY/OUTPUT_1_0" ,
"Untitled1/Solver Configuration/EVAL_KEY/STATE_1" , } ; static const int
reason [ 9 ] = { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 6 , 6 , } ; for ( subs [ 0 ] = 0
; subs [ 0 ] < 9 ; ++ ( subs [ 0 ] ) ) { subs [ 1 ] = 0 ; offset =
mxCalcSingleSubscript ( data , 2 , subs ) ; mxSetCell ( data , offset ,
mxCreateString ( blockType [ subs [ 0 ] ] ) ) ; subs [ 1 ] = 1 ; offset =
mxCalcSingleSubscript ( data , 2 , subs ) ; mxSetCell ( data , offset ,
mxCreateString ( blockPath [ subs [ 0 ] ] ) ) ; subs [ 1 ] = 2 ; offset =
mxCalcSingleSubscript ( data , 2 , subs ) ; mxSetCell ( data , offset ,
mxCreateDoubleScalar ( ( double ) reason [ subs [ 0 ] ] ) ) ; } } return data
; } void MdlInitializeSizes ( void ) { ssSetNumContStates ( rtS , 30 ) ;
ssSetNumPeriodicContStates ( rtS , 0 ) ; ssSetNumY ( rtS , 0 ) ; ssSetNumU (
rtS , 0 ) ; ssSetDirectFeedThrough ( rtS , 0 ) ; ssSetNumSampleTimes ( rtS ,
2 ) ; ssSetNumBlocks ( rtS , 60 ) ; ssSetNumBlockIO ( rtS , 18 ) ;
ssSetNumBlockParams ( rtS , 19 ) ; } void MdlInitializeSampleTimes ( void ) {
ssSetSampleTime ( rtS , 0 , 0.0 ) ; ssSetSampleTime ( rtS , 1 , 0.0 ) ;
ssSetOffsetTime ( rtS , 0 , 0.0 ) ; ssSetOffsetTime ( rtS , 1 , 1.0 ) ; }
void raccel_set_checksum ( ) { ssSetChecksumVal ( rtS , 0 , 3660660612U ) ;
ssSetChecksumVal ( rtS , 1 , 34751504U ) ; ssSetChecksumVal ( rtS , 2 ,
1021262967U ) ; ssSetChecksumVal ( rtS , 3 , 2058824963U ) ; }
#if defined(_MSC_VER)
#pragma optimize( "", off )
#endif
SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) {
static struct _ssMdlInfo mdlInfo ; static struct _ssBlkInfo2 blkInfo2 ;
static struct _ssBlkInfoSLSize blkInfoSLSize ; ( void ) memset ( ( char * )
rtS , 0 , sizeof ( SimStruct ) ) ; ( void ) memset ( ( char * ) & mdlInfo , 0
, sizeof ( struct _ssMdlInfo ) ) ; ( void ) memset ( ( char * ) & blkInfo2 ,
0 , sizeof ( struct _ssBlkInfo2 ) ) ; ( void ) memset ( ( char * ) &
blkInfoSLSize , 0 , sizeof ( struct _ssBlkInfoSLSize ) ) ; ssSetBlkInfo2Ptr (
rtS , & blkInfo2 ) ; ssSetBlkInfoSLSizePtr ( rtS , & blkInfoSLSize ) ;
ssSetMdlInfoPtr ( rtS , & mdlInfo ) ; ssSetExecutionInfo ( rtS ,
executionInfo ) ; slsaAllocOPModelData ( rtS ) ; { static time_T mdlPeriod [
NSAMPLE_TIMES ] ; static time_T mdlOffset [ NSAMPLE_TIMES ] ; static time_T
mdlTaskTimes [ NSAMPLE_TIMES ] ; static int_T mdlTsMap [ NSAMPLE_TIMES ] ;
static int_T mdlSampleHits [ NSAMPLE_TIMES ] ; static boolean_T
mdlTNextWasAdjustedPtr [ NSAMPLE_TIMES ] ; static int_T mdlPerTaskSampleHits
[ NSAMPLE_TIMES * NSAMPLE_TIMES ] ; static time_T mdlTimeOfNextSampleHit [
NSAMPLE_TIMES ] ; { int_T i ; for ( i = 0 ; i < NSAMPLE_TIMES ; i ++ ) {
mdlPeriod [ i ] = 0.0 ; mdlOffset [ i ] = 0.0 ; mdlTaskTimes [ i ] = 0.0 ;
mdlTsMap [ i ] = i ; mdlSampleHits [ i ] = 1 ; } } ssSetSampleTimePtr ( rtS ,
& mdlPeriod [ 0 ] ) ; ssSetOffsetTimePtr ( rtS , & mdlOffset [ 0 ] ) ;
ssSetSampleTimeTaskIDPtr ( rtS , & mdlTsMap [ 0 ] ) ; ssSetTPtr ( rtS , &
mdlTaskTimes [ 0 ] ) ; ssSetSampleHitPtr ( rtS , & mdlSampleHits [ 0 ] ) ;
ssSetTNextWasAdjustedPtr ( rtS , & mdlTNextWasAdjustedPtr [ 0 ] ) ;
ssSetPerTaskSampleHitsPtr ( rtS , & mdlPerTaskSampleHits [ 0 ] ) ;
ssSetTimeOfNextSampleHitPtr ( rtS , & mdlTimeOfNextSampleHit [ 0 ] ) ; }
ssSetSolverMode ( rtS , SOLVER_MODE_SINGLETASKING ) ; { ssSetBlockIO ( rtS ,
( ( void * ) & rtB ) ) ; ( void ) memset ( ( ( void * ) & rtB ) , 0 , sizeof
( B ) ) ; } { real_T * x = ( real_T * ) & rtX ; ssSetContStates ( rtS , x ) ;
( void ) memset ( ( void * ) x , 0 , sizeof ( X ) ) ; } { void * dwork = (
void * ) & rtDW ; ssSetRootDWork ( rtS , dwork ) ; ( void ) memset ( dwork ,
0 , sizeof ( DW ) ) ; } { static DataTypeTransInfo dtInfo ; ( void ) memset (
( char_T * ) & dtInfo , 0 , sizeof ( dtInfo ) ) ; ssSetModelMappingInfo ( rtS
, & dtInfo ) ; dtInfo . numDataTypes = 22 ; dtInfo . dataTypeSizes = &
rtDataTypeSizes [ 0 ] ; dtInfo . dataTypeNames = & rtDataTypeNames [ 0 ] ;
dtInfo . BTransTable = & rtBTransTable ; dtInfo . PTransTable = &
rtPTransTable ; dtInfo . dataTypeInfoTable = rtDataTypeInfoTable ; }
Untitled1_InitializeDataMapInfo ( ) ; ssSetIsRapidAcceleratorActive ( rtS ,
true ) ; ssSetRootSS ( rtS , rtS ) ; ssSetVersion ( rtS ,
SIMSTRUCT_VERSION_LEVEL2 ) ; ssSetModelName ( rtS , "Untitled1" ) ; ssSetPath
( rtS , "Untitled1" ) ; ssSetTStart ( rtS , 0.0 ) ; ssSetTFinal ( rtS , 20.0
) ; { static RTWLogInfo rt_DataLoggingInfo ; rt_DataLoggingInfo .
loggingInterval = ( NULL ) ; ssSetRTWLogInfo ( rtS , & rt_DataLoggingInfo ) ;
} { { static int_T rt_LoggedStateWidths [ ] = { 13 , 13 , 1 , 1 , 1 , 1 , 2 }
; static int_T rt_LoggedStateNumDimensions [ ] = { 1 , 1 , 1 , 1 , 1 , 1 , 1
} ; static int_T rt_LoggedStateDimensions [ ] = { 13 , 13 , 1 , 1 , 1 , 1 , 2
} ; static boolean_T rt_LoggedStateIsVarDims [ ] = { 0 , 0 , 0 , 0 , 0 , 0 ,
0 } ; static BuiltInDTypeId rt_LoggedStateDataTypeIds [ ] = { SS_DOUBLE ,
SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE } ;
static int_T rt_LoggedStateComplexSignals [ ] = { 0 , 0 , 0 , 0 , 0 , 0 , 0 }
; static RTWPreprocessingFcnPtr rt_LoggingStatePreprocessingFcnPtrs [ ] = { (
NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) } ;
static const char_T * rt_LoggedStateLabels [ ] = { "CSTATE" , "CSTATE" ,
"CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" , "Discrete" } ; static const
char_T * rt_LoggedStateBlockNames [ ] = { "Untitled1/Neuron 1/Integrator" ,
"Untitled1/Neuron 2/Integrator" , "Untitled1/Revolute Joint" ,
"Untitled1/Revolute Joint" , "Untitled1/Revolute Joint1" ,
"Untitled1/Revolute Joint1" ,
"Untitled1/Solver\nConfiguration/EVAL_KEY/INPUT_1_1_1" } ; static const
char_T * rt_LoggedStateNames [ ] = { "" , "" ,
"Untitled1.Revolute_Joint.Rz.q" , "Untitled1.Revolute_Joint.Rz.w" ,
"Untitled1.Revolute_Joint1.Rz.q" , "Untitled1.Revolute_Joint1.Rz.w" ,
"Discrete" } ; static boolean_T rt_LoggedStateCrossMdlRef [ ] = { 0 , 0 , 0 ,
0 , 0 , 0 , 0 } ; static RTWLogDataTypeConvert rt_RTWLogDataTypeConvert [ ] =
{ { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE
, SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 ,
0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 ,
0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 ,
SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE ,
SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } } ; static int_T
rt_LoggedStateIdxList [ ] = { 0 , 1 , 2 , 0 } ; static RTWLogSignalInfo
rt_LoggedStateSignalInfo = { 7 , rt_LoggedStateWidths ,
rt_LoggedStateNumDimensions , rt_LoggedStateDimensions ,
rt_LoggedStateIsVarDims , ( NULL ) , ( NULL ) , rt_LoggedStateDataTypeIds ,
rt_LoggedStateComplexSignals , ( NULL ) , rt_LoggingStatePreprocessingFcnPtrs
, { rt_LoggedStateLabels } , ( NULL ) , ( NULL ) , ( NULL ) , {
rt_LoggedStateBlockNames } , { rt_LoggedStateNames } ,
rt_LoggedStateCrossMdlRef , rt_RTWLogDataTypeConvert , rt_LoggedStateIdxList
} ; static void * rt_LoggedStateSignalPtrs [ 7 ] ; rtliSetLogXSignalPtrs (
ssGetRTWLogInfo ( rtS ) , ( LogSignalPtrsType ) rt_LoggedStateSignalPtrs ) ;
rtliSetLogXSignalInfo ( ssGetRTWLogInfo ( rtS ) , & rt_LoggedStateSignalInfo
) ; rt_LoggedStateSignalPtrs [ 0 ] = ( void * ) & rtX . g0mc3r5gzj [ 0 ] ;
rt_LoggedStateSignalPtrs [ 1 ] = ( void * ) & rtX . lzbko4ydo0 [ 0 ] ;
rt_LoggedStateSignalPtrs [ 2 ] = ( void * ) & rtX . fv1jm0s3ra [ 0 ] ;
rt_LoggedStateSignalPtrs [ 3 ] = ( void * ) & rtX . fv1jm0s3ra [ 1 ] ;
rt_LoggedStateSignalPtrs [ 4 ] = ( void * ) & rtX . fv1jm0s3ra [ 2 ] ;
rt_LoggedStateSignalPtrs [ 5 ] = ( void * ) & rtX . fv1jm0s3ra [ 3 ] ;
rt_LoggedStateSignalPtrs [ 6 ] = ( void * ) rtDW . i5gqks14de ; } rtliSetLogT
( ssGetRTWLogInfo ( rtS ) , "tout" ) ; rtliSetLogX ( ssGetRTWLogInfo ( rtS )
, "" ) ; rtliSetLogXFinal ( ssGetRTWLogInfo ( rtS ) , "xFinal" ) ;
rtliSetLogVarNameModifier ( ssGetRTWLogInfo ( rtS ) , "none" ) ;
rtliSetLogFormat ( ssGetRTWLogInfo ( rtS ) , 4 ) ; rtliSetLogMaxRows (
ssGetRTWLogInfo ( rtS ) , 0 ) ; rtliSetLogDecimation ( ssGetRTWLogInfo ( rtS
) , 1 ) ; rtliSetLogY ( ssGetRTWLogInfo ( rtS ) , "" ) ;
rtliSetLogYSignalInfo ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ;
rtliSetLogYSignalPtrs ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ; } { static
struct _ssStatesInfo2 statesInfo2 ; ssSetStatesInfo2 ( rtS , & statesInfo2 )
; } { static ssPeriodicStatesInfo periodicStatesInfo ;
ssSetPeriodicStatesInfo ( rtS , & periodicStatesInfo ) ; } { static
ssJacobianPerturbationBounds jacobianPerturbationBounds ;
ssSetJacobianPerturbationBounds ( rtS , & jacobianPerturbationBounds ) ; } {
static ssSolverInfo slvrInfo ; static struct _ssSFcnModelMethods3 mdlMethods3
; static struct _ssSFcnModelMethods2 mdlMethods2 ; static boolean_T
contStatesDisabled [ 30 ] ; static real_T absTol [ 30 ] = { 1.0E-6 , 1.0E-6 ,
1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 ,
1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 ,
1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 ,
1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 } ; static uint8_T absTolControl [ 30 ] = {
0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U
, 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U } ;
static real_T contStateJacPerturbBoundMinVec [ 30 ] ; static real_T
contStateJacPerturbBoundMaxVec [ 30 ] ; static ssNonContDerivSigInfo
nonContDerivSigInfo [ 1 ] = { { 1 * sizeof ( real_T ) , ( char * ) ( & rtB .
bxrj01vgkv ) , ( NULL ) } } ; { int i ; for ( i = 0 ; i < 30 ; ++ i ) {
contStateJacPerturbBoundMinVec [ i ] = 0 ; contStateJacPerturbBoundMaxVec [ i
] = rtGetInf ( ) ; } } ssSetSolverRelTol ( rtS , 0.001 ) ; ssSetStepSize (
rtS , 0.0 ) ; ssSetMinStepSize ( rtS , 0.0 ) ; ssSetMaxNumMinSteps ( rtS , -
1 ) ; ssSetMinStepViolatedError ( rtS , 0 ) ; ssSetMaxStepSize ( rtS , 0.4 )
; ssSetSolverMaxOrder ( rtS , - 1 ) ; ssSetSolverRefineFactor ( rtS , 1 ) ;
ssSetOutputTimes ( rtS , ( NULL ) ) ; ssSetNumOutputTimes ( rtS , 0 ) ;
ssSetOutputTimesOnly ( rtS , 0 ) ; ssSetOutputTimesIndex ( rtS , 0 ) ;
ssSetZCCacheNeedsReset ( rtS , 0 ) ; ssSetDerivCacheNeedsReset ( rtS , 0 ) ;
ssSetNumNonContDerivSigInfos ( rtS , 1 ) ; ssSetNonContDerivSigInfos ( rtS ,
nonContDerivSigInfo ) ; ssSetSolverInfo ( rtS , & slvrInfo ) ;
ssSetSolverName ( rtS , "VariableStepAuto" ) ; ssSetVariableStepSolver ( rtS
, 1 ) ; ssSetSolverConsistencyChecking ( rtS , 0 ) ;
ssSetSolverAdaptiveZcDetection ( rtS , 0 ) ; ssSetSolverRobustResetMethod (
rtS , 0 ) ; _ssSetSolverUpdateJacobianAtReset ( rtS , true ) ;
ssSetAbsTolVector ( rtS , absTol ) ; ssSetAbsTolControlVector ( rtS ,
absTolControl ) ; ssSetSolverAbsTol_Obsolete ( rtS , absTol ) ;
ssSetSolverAbsTolControl_Obsolete ( rtS , absTolControl ) ;
ssSetJacobianPerturbationBoundsMinVec ( rtS , contStateJacPerturbBoundMinVec
) ; ssSetJacobianPerturbationBoundsMaxVec ( rtS ,
contStateJacPerturbBoundMaxVec ) ; ssSetSolverStateProjection ( rtS , 1 ) ; (
void ) memset ( ( void * ) & mdlMethods2 , 0 , sizeof ( mdlMethods2 ) ) ;
ssSetModelMethods2 ( rtS , & mdlMethods2 ) ; ( void ) memset ( ( void * ) &
mdlMethods3 , 0 , sizeof ( mdlMethods3 ) ) ; ssSetModelMethods3 ( rtS , &
mdlMethods3 ) ; ssSetModelProjection ( rtS , MdlProjection ) ;
ssSetSolverMassMatrixType ( rtS , ( ssMatrixType ) 0 ) ;
ssSetSolverMassMatrixNzMax ( rtS , 0 ) ; ssSetModelOutputs ( rtS , MdlOutputs
) ; ssSetModelLogData ( rtS , rt_UpdateTXYLogVars ) ;
ssSetModelLogDataIfInInterval ( rtS , rt_UpdateTXXFYLogVars ) ;
ssSetModelUpdate ( rtS , MdlUpdate ) ; ssSetModelDerivatives ( rtS ,
MdlDerivatives ) ; ssSetSolverMaxConsecutiveMinStep ( rtS , 1 ) ;
ssSetSolverShapePreserveControl ( rtS , 2 ) ; ssSetTNextTid ( rtS , INT_MIN )
; ssSetTNext ( rtS , rtMinusInf ) ; ssSetSolverNeedsReset ( rtS ) ;
ssSetNumNonsampledZCs ( rtS , 0 ) ; ssSetContStateDisabled ( rtS ,
contStatesDisabled ) ; ssSetSolverMaxConsecutiveMinStep ( rtS , 1 ) ; }
ssSetChecksumVal ( rtS , 0 , 3660660612U ) ; ssSetChecksumVal ( rtS , 1 ,
34751504U ) ; ssSetChecksumVal ( rtS , 2 , 1021262967U ) ; ssSetChecksumVal (
rtS , 3 , 2058824963U ) ; { static const sysRanDType rtAlwaysEnabled =
SUBSYS_RAN_BC_ENABLE ; static RTWExtModeInfo rt_ExtModeInfo ; static const
sysRanDType * systemRan [ 9 ] ; gblRTWExtModeInfo = & rt_ExtModeInfo ;
ssSetRTWExtModeInfo ( rtS , & rt_ExtModeInfo ) ;
rteiSetSubSystemActiveVectorAddresses ( & rt_ExtModeInfo , systemRan ) ;
systemRan [ 0 ] = & rtAlwaysEnabled ; systemRan [ 1 ] = & rtAlwaysEnabled ;
systemRan [ 2 ] = & rtAlwaysEnabled ; systemRan [ 3 ] = & rtAlwaysEnabled ;
systemRan [ 4 ] = & rtAlwaysEnabled ; systemRan [ 5 ] = & rtAlwaysEnabled ;
systemRan [ 6 ] = & rtAlwaysEnabled ; systemRan [ 7 ] = & rtAlwaysEnabled ;
systemRan [ 8 ] = & rtAlwaysEnabled ; rteiSetModelMappingInfoPtr (
ssGetRTWExtModeInfo ( rtS ) , & ssGetModelMappingInfo ( rtS ) ) ;
rteiSetChecksumsPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetChecksums ( rtS ) )
; rteiSetTPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetTPtr ( rtS ) ) ; }
slsaDisallowedBlocksForSimTargetOP ( rtS ,
mr_Untitled1_GetSimStateDisallowedBlocks ) ; slsaGetWorkFcnForSimTargetOP (
rtS , mr_Untitled1_GetDWork ) ; slsaSetWorkFcnForSimTargetOP ( rtS ,
mr_Untitled1_SetDWork ) ; rt_RapidReadMatFileAndUpdateParams ( rtS ) ; if (
ssGetErrorStatus ( rtS ) ) { return rtS ; } return rtS ; }
#if defined(_MSC_VER)
#pragma optimize( "", on )
#endif
const int_T gblParameterTuningTid = 2 ; void MdlOutputsParameterSampleTime (
int_T tid ) { MdlOutputsTID2 ( tid ) ; }
