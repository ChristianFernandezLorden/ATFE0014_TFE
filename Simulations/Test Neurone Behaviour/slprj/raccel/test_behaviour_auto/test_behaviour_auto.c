#include "test_behaviour_auto.h"
#include "rtwtypes.h"
#include "test_behaviour_auto_private.h"
#include "mwmathutil.h"
#include "rt_logging_mmi.h"
#include "test_behaviour_auto_capi.h"
#include "test_behaviour_auto_dt.h"
extern void * CreateDiagnosticAsVoidPtr_wrapper ( const char * id , int nargs
, ... ) ; RTWExtModeInfo * gblRTWExtModeInfo = NULL ; void
raccelForceExtModeShutdown ( boolean_T extModeStartPktReceived ) { if ( !
extModeStartPktReceived ) { boolean_T stopRequested = false ;
rtExtModeWaitForStartPkt ( gblRTWExtModeInfo , 2 , & stopRequested ) ; }
rtExtModeShutdown ( 2 ) ; }
#include "slsv_diagnostic_codegen_c_api.h"
#include "slsa_sim_engine.h"
const int_T gblNumToFiles = 0 ; const int_T gblNumFrFiles = 0 ; const int_T
gblNumFrWksBlocks = 1 ;
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
& model_S ; void d1w1oyto0m ( real_T pjvmursm2j , real_T pxkko0al3a , real_T
eh3xl2o5mg , real_T fj5kokri0u , fzo3wmzixp * localB ) { localB -> f3hsp4toa4
= ( muDoubleScalarTanh ( pjvmursm2j - eh3xl2o5mg ) - muDoubleScalarTanh (
fj5kokri0u - eh3xl2o5mg ) ) * pxkko0al3a ; } real_T
rt_urand_Upu32_Yd_f_pw_snf ( uint32_T * u ) { uint32_T hi ; uint32_T lo ; lo
= * u % 127773U * 16807U ; hi = * u / 127773U * 2836U ; if ( lo < hi ) { * u
= 2147483647U - ( hi - lo ) ; } else { * u = lo - hi ; } return ( real_T ) *
u * 4.6566128752457969E-10 ; } real_T rt_nrand_Upu32_Yd_f_pw_snf ( uint32_T *
u ) { real_T si ; real_T sr ; real_T y ; do { sr = 2.0 *
rt_urand_Upu32_Yd_f_pw_snf ( u ) - 1.0 ; si = 2.0 *
rt_urand_Upu32_Yd_f_pw_snf ( u ) - 1.0 ; si = sr * sr + si * si ; } while (
si > 1.0 ) ; y = muDoubleScalarSqrt ( - 2.0 * muDoubleScalarLog ( si ) / si )
* sr ; return y ; } void MdlInitialize ( void ) { real_T tmp ; int32_T r ;
int32_T t ; uint32_T tseed ; rtX . adxkeevqsi = 0.0 ; rtX . bgqaqdoh3u = 0.0
; rtX . oirhxuicxl = 0.0 ; rtX . m5wfoczshr = 0.0 ; rtX . o3r3d2s2ow = 0.0 ;
tmp = muDoubleScalarFloor ( rtP . BandLimitedWhiteNoise_seed ) ; if (
muDoubleScalarIsNaN ( tmp ) || muDoubleScalarIsInf ( tmp ) ) { tmp = 0.0 ; }
else { tmp = muDoubleScalarRem ( tmp , 4.294967296E+9 ) ; } tseed = tmp < 0.0
? ( uint32_T ) - ( int32_T ) ( uint32_T ) - tmp : ( uint32_T ) tmp ; r = (
int32_T ) ( tseed >> 16U ) ; t = ( int32_T ) ( tseed & 32768U ) ; tseed = ( (
( ( tseed - ( ( uint32_T ) r << 16U ) ) + t ) << 16U ) + t ) + r ; if ( tseed
< 1U ) { tseed = 1144108930U ; } else if ( tseed > 2147483646U ) { tseed =
2147483646U ; } rtDW . erwbdzj1pg = tseed ; rtDW . kgbgtmirms =
rt_nrand_Upu32_Yd_f_pw_snf ( & rtDW . erwbdzj1pg ) * rtP . WhiteNoise_StdDev
+ rtP . WhiteNoise_Mean ; } void MdlStart ( void ) { { bool
externalInputIsInDatasetFormat = false ; void * pISigstreamManager =
rt_GetISigstreamManager ( rtS ) ;
rtwISigstreamManagerGetInputIsInDatasetFormat ( pISigstreamManager , &
externalInputIsInDatasetFormat ) ; if ( externalInputIsInDatasetFormat ) { }
} { { { bool isStreamoutAlreadyRegistered = false ; { sdiSignalSourceInfoU
srcInfo ; sdiLabelU loggedName = sdiGetLabelFromChars ( "Subsystem6" ) ;
sdiLabelU origSigName = sdiGetLabelFromChars ( "" ) ; sdiLabelU propName =
sdiGetLabelFromChars ( "Subsystem6" ) ; sdiLabelU blockPath =
sdiGetLabelFromChars ( "test_behaviour_auto/To Workspace" ) ; sdiLabelU
blockSID = sdiGetLabelFromChars ( "" ) ; sdiLabelU subPath =
sdiGetLabelFromChars ( "" ) ; sdiDims sigDims ; sdiLabelU sigName =
sdiGetLabelFromChars ( "Subsystem6" ) ; sdiAsyncRepoDataTypeHandle hDT =
sdiAsyncRepoGetBuiltInDataTypeHandle ( DATA_TYPE_DOUBLE ) ; { sdiComplexity
sigComplexity = REAL ; sdiSampleTimeContinuity stCont =
SAMPLE_TIME_CONTINUOUS ; int_T sigDimsArray [ 1 ] = { 1 } ; sigDims . nDims =
1 ; sigDims . dimensions = sigDimsArray ; srcInfo . numBlockPathElems = 1 ;
srcInfo . fullBlockPath = ( sdiFullBlkPathU ) & blockPath ; srcInfo . SID = (
sdiSignalIDU ) & blockSID ; srcInfo . subPath = subPath ; srcInfo . portIndex
= 0 + 1 ; srcInfo . signalName = sigName ; srcInfo . sigSourceUUID = 0 ; rtDW
. itgl5c4wg2 . AQHandles = sdiStartAsyncioQueueCreation ( hDT , & srcInfo ,
rt_dataMapInfo . mmi . InstanceMap . fullPath ,
"035460ec-dc8f-4bce-8af5-86e02d40be5c" , sigComplexity , & sigDims ,
DIMENSIONS_MODE_FIXED , stCont , "" ) ; sdiCompleteAsyncioQueueCreation (
rtDW . itgl5c4wg2 . AQHandles , hDT , & srcInfo ) ; if ( rtDW . itgl5c4wg2 .
AQHandles ) { sdiSetSignalSampleTimeString ( rtDW . itgl5c4wg2 . AQHandles ,
"Continuous" , 0.0 , ssGetTFinal ( rtS ) ) ; sdiSetSignalRefRate ( rtDW .
itgl5c4wg2 . AQHandles , 0.0 ) ; sdiSetRunStartTime ( rtDW . itgl5c4wg2 .
AQHandles , ssGetTaskTime ( rtS , 0 ) ) ; sdiAsyncRepoSetSignalExportSettings
( rtDW . itgl5c4wg2 . AQHandles , 1 , 0 ) ; sdiAsyncRepoSetSignalExportName (
rtDW . itgl5c4wg2 . AQHandles , loggedName , origSigName , propName ) ;
sdiAsyncRepoSetBlockPathDomain ( rtDW . itgl5c4wg2 . AQHandles ) ; }
sdiFreeLabel ( sigName ) ; sdiFreeLabel ( loggedName ) ; sdiFreeLabel (
origSigName ) ; sdiFreeLabel ( propName ) ; sdiFreeLabel ( blockPath ) ;
sdiFreeLabel ( blockSID ) ; sdiFreeLabel ( subPath ) ; } } if ( !
isStreamoutAlreadyRegistered ) { { sdiLabelU varName = sdiGetLabelFromChars (
"V" ) ; sdiRegisterWksVariable ( rtDW . itgl5c4wg2 . AQHandles , varName ,
"structwithtime" ) ; sdiFreeLabel ( varName ) ; } } } } } { FWksInfo *
fromwksInfo ; if ( ( fromwksInfo = ( FWksInfo * ) calloc ( 1 , sizeof (
FWksInfo ) ) ) == ( NULL ) ) { ssSetErrorStatus ( rtS ,
"from workspace STRING(Name) memory allocation error" ) ; } else {
fromwksInfo -> origWorkspaceVarName = "Iapp" ; fromwksInfo -> origDataTypeId
= 0 ; fromwksInfo -> origIsComplex = 0 ; fromwksInfo -> origWidth = 1 ;
fromwksInfo -> origElSize = sizeof ( real_T ) ; fromwksInfo -> data = ( void
* ) rtP . FromWorkspace_Data0 ; fromwksInfo -> nDataPoints = 200001 ;
fromwksInfo -> time = ( double * ) rtP . FromWorkspace_Time0 ; rtDW .
nok2sngcus . TimePtr = fromwksInfo -> time ; rtDW . nok2sngcus . DataPtr =
fromwksInfo -> data ; rtDW . nok2sngcus . RSimInfoPtr = fromwksInfo ; } rtDW
. d1lcj0fq2i . PrevIndex = 0 ; } MdlInitialize ( ) ; } void MdlOutputs (
int_T tid ) { real_T e35qcaeeqn ; rtB . jnehpucmbe = 0.0 ; rtB . jnehpucmbe
+= rtP . TransferFcn_C * rtX . adxkeevqsi ; { if ( rtDW . itgl5c4wg2 .
AQHandles && ssGetLogOutput ( rtS ) ) { sdiWriteSignal ( rtDW . itgl5c4wg2 .
AQHandles , ssGetTaskTime ( rtS , 0 ) , ( char * ) & rtB . jnehpucmbe + 0 ) ;
} } { real_T * pDataValues = ( real_T * ) rtDW . nok2sngcus . DataPtr ;
real_T * pTimeValues = ( real_T * ) rtDW . nok2sngcus . TimePtr ; int_T
currTimeIndex = rtDW . d1lcj0fq2i . PrevIndex ; real_T t = ssGetTaskTime (
rtS , 0 ) ; int numPoints , lastPoint ; FWksInfo * fromwksInfo = ( FWksInfo *
) rtDW . nok2sngcus . RSimInfoPtr ; numPoints = fromwksInfo -> nDataPoints ;
lastPoint = numPoints - 1 ; if ( t <= pTimeValues [ 0 ] ) { currTimeIndex = 0
; } else if ( t >= pTimeValues [ lastPoint ] ) { currTimeIndex = lastPoint -
1 ; } else { if ( t < pTimeValues [ currTimeIndex ] ) { while ( t <
pTimeValues [ currTimeIndex ] ) { currTimeIndex -- ; } } else { while ( t >=
pTimeValues [ currTimeIndex + 1 ] ) { currTimeIndex ++ ; } } } rtDW .
d1lcj0fq2i . PrevIndex = currTimeIndex ; { real_T t1 = pTimeValues [
currTimeIndex ] ; real_T t2 = pTimeValues [ currTimeIndex + 1 ] ; if ( t1 ==
t2 ) { if ( t < t1 ) { e35qcaeeqn = pDataValues [ currTimeIndex ] ; } else {
e35qcaeeqn = pDataValues [ currTimeIndex + 1 ] ; } } else { real_T f1 = ( t2
- t ) / ( t2 - t1 ) ; real_T f2 = 1.0 - f1 ; real_T d1 ; real_T d2 ; int_T
TimeIndex = currTimeIndex ; d1 = pDataValues [ TimeIndex ] ; d2 = pDataValues
[ TimeIndex + 1 ] ; e35qcaeeqn = ( real_T ) rtInterpolate ( d1 , d2 , f1 , f2
) ; pDataValues += numPoints ; } } } rtB . h1hu5u53jm = rtP . FastDynamics_C
* rtX . bgqaqdoh3u ; d1w1oyto0m ( rtB . h1hu5u53jm , rtP . gfm , rtP . dfm ,
rtP . V0_Value , & rtB . hhh23u0b0m ) ; rtB . pn0bubfv0t = rtP .
SlowDynamics1_C * rtX . oirhxuicxl ; d1w1oyto0m ( rtB . pn0bubfv0t , rtP .
gsp , rtP . dsp , rtP . V0_Value , & rtB . nzfnvsmgq0 ) ; rtB . nvckcggmt3 =
rtP . SlowDynamics2_C * rtX . m5wfoczshr ; d1w1oyto0m ( rtB . nvckcggmt3 ,
rtP . gsm , rtP . dsm , rtP . V0_Value , & rtB . lakqxvp1cn ) ; rtB .
k1k5a4skah = rtP . UslowDynam_C * rtX . o3r3d2s2ow ; d1w1oyto0m ( rtB .
k1k5a4skah , rtP . gup , rtP . dup , rtP . V0_Value , & rtB . o2bggu0mp5 ) ;
if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { rtB . gduqwdbhw1 = rtP . Output_Gain *
rtDW . kgbgtmirms ; } rtB . bsh5ral4if = ( ( ( ( ( rtP . V0_Value +
e35qcaeeqn ) - rtB . hhh23u0b0m . f3hsp4toa4 ) - rtB . nzfnvsmgq0 .
f3hsp4toa4 ) - rtB . lakqxvp1cn . f3hsp4toa4 ) - rtB . o2bggu0mp5 .
f3hsp4toa4 ) + rtB . gduqwdbhw1 ; UNUSED_PARAMETER ( tid ) ; } void
MdlOutputsTID2 ( int_T tid ) { UNUSED_PARAMETER ( tid ) ; } void MdlUpdate (
int_T tid ) { if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { rtDW . kgbgtmirms =
rt_nrand_Upu32_Yd_f_pw_snf ( & rtDW . erwbdzj1pg ) * rtP . WhiteNoise_StdDev
+ rtP . WhiteNoise_Mean ; } UNUSED_PARAMETER ( tid ) ; } void MdlUpdateTID2 (
int_T tid ) { UNUSED_PARAMETER ( tid ) ; } void MdlDerivatives ( void ) {
XDot * _rtXdot ; _rtXdot = ( ( XDot * ) ssGetdX ( rtS ) ) ; _rtXdot ->
adxkeevqsi = rtP . TransferFcn_A * rtX . adxkeevqsi ; _rtXdot -> adxkeevqsi
+= rtB . bsh5ral4if ; _rtXdot -> bgqaqdoh3u = rtP . FastDynamics_A * rtX .
bgqaqdoh3u ; _rtXdot -> bgqaqdoh3u += rtB . jnehpucmbe ; _rtXdot ->
oirhxuicxl = rtP . SlowDynamics1_A * rtX . oirhxuicxl ; _rtXdot -> oirhxuicxl
+= rtB . jnehpucmbe ; _rtXdot -> m5wfoczshr = rtP . SlowDynamics2_A * rtX .
m5wfoczshr ; _rtXdot -> m5wfoczshr += rtB . jnehpucmbe ; _rtXdot ->
o3r3d2s2ow = rtP . UslowDynam_A * rtX . o3r3d2s2ow ; _rtXdot -> o3r3d2s2ow +=
rtB . jnehpucmbe ; } void MdlProjection ( void ) { } void MdlTerminate ( void
) { rt_FREE ( rtDW . nok2sngcus . RSimInfoPtr ) ; { if ( rtDW . itgl5c4wg2 .
AQHandles ) { sdiTerminateStreaming ( & rtDW . itgl5c4wg2 . AQHandles ) ; } }
} static void mr_test_behaviour_auto_cacheDataAsMxArray ( mxArray * destArray
, mwIndex i , int j , const void * srcData , size_t numBytes ) ; static void
mr_test_behaviour_auto_cacheDataAsMxArray ( mxArray * destArray , mwIndex i ,
int j , const void * srcData , size_t numBytes ) { mxArray * newArray =
mxCreateUninitNumericMatrix ( ( size_t ) 1 , numBytes , mxUINT8_CLASS ,
mxREAL ) ; memcpy ( ( uint8_T * ) mxGetData ( newArray ) , ( const uint8_T *
) srcData , numBytes ) ; mxSetFieldByNumber ( destArray , i , j , newArray )
; } static void mr_test_behaviour_auto_restoreDataFromMxArray ( void *
destData , const mxArray * srcArray , mwIndex i , int j , size_t numBytes ) ;
static void mr_test_behaviour_auto_restoreDataFromMxArray ( void * destData ,
const mxArray * srcArray , mwIndex i , int j , size_t numBytes ) { memcpy ( (
uint8_T * ) destData , ( const uint8_T * ) mxGetData ( mxGetFieldByNumber (
srcArray , i , j ) ) , numBytes ) ; } static void
mr_test_behaviour_auto_cacheBitFieldToMxArray ( mxArray * destArray , mwIndex
i , int j , uint_T bitVal ) ; static void
mr_test_behaviour_auto_cacheBitFieldToMxArray ( mxArray * destArray , mwIndex
i , int j , uint_T bitVal ) { mxSetFieldByNumber ( destArray , i , j ,
mxCreateDoubleScalar ( ( double ) bitVal ) ) ; } static uint_T
mr_test_behaviour_auto_extractBitFieldFromMxArray ( const mxArray * srcArray
, mwIndex i , int j , uint_T numBits ) ; static uint_T
mr_test_behaviour_auto_extractBitFieldFromMxArray ( const mxArray * srcArray
, mwIndex i , int j , uint_T numBits ) { const uint_T varVal = ( uint_T )
mxGetScalar ( mxGetFieldByNumber ( srcArray , i , j ) ) ; return varVal & ( (
1u << numBits ) - 1u ) ; } static void
mr_test_behaviour_auto_cacheDataToMxArrayWithOffset ( mxArray * destArray ,
mwIndex i , int j , mwIndex offset , const void * srcData , size_t numBytes )
; static void mr_test_behaviour_auto_cacheDataToMxArrayWithOffset ( mxArray *
destArray , mwIndex i , int j , mwIndex offset , const void * srcData ,
size_t numBytes ) { uint8_T * varData = ( uint8_T * ) mxGetData (
mxGetFieldByNumber ( destArray , i , j ) ) ; memcpy ( ( uint8_T * ) & varData
[ offset * numBytes ] , ( const uint8_T * ) srcData , numBytes ) ; } static
void mr_test_behaviour_auto_restoreDataFromMxArrayWithOffset ( void *
destData , const mxArray * srcArray , mwIndex i , int j , mwIndex offset ,
size_t numBytes ) ; static void
mr_test_behaviour_auto_restoreDataFromMxArrayWithOffset ( void * destData ,
const mxArray * srcArray , mwIndex i , int j , mwIndex offset , size_t
numBytes ) { const uint8_T * varData = ( const uint8_T * ) mxGetData (
mxGetFieldByNumber ( srcArray , i , j ) ) ; memcpy ( ( uint8_T * ) destData ,
( const uint8_T * ) & varData [ offset * numBytes ] , numBytes ) ; } static
void mr_test_behaviour_auto_cacheBitFieldToCellArrayWithOffset ( mxArray *
destArray , mwIndex i , int j , mwIndex offset , uint_T fieldVal ) ; static
void mr_test_behaviour_auto_cacheBitFieldToCellArrayWithOffset ( mxArray *
destArray , mwIndex i , int j , mwIndex offset , uint_T fieldVal ) {
mxSetCell ( mxGetFieldByNumber ( destArray , i , j ) , offset ,
mxCreateDoubleScalar ( ( double ) fieldVal ) ) ; } static uint_T
mr_test_behaviour_auto_extractBitFieldFromCellArrayWithOffset ( const mxArray
* srcArray , mwIndex i , int j , mwIndex offset , uint_T numBits ) ; static
uint_T mr_test_behaviour_auto_extractBitFieldFromCellArrayWithOffset ( const
mxArray * srcArray , mwIndex i , int j , mwIndex offset , uint_T numBits ) {
const uint_T fieldVal = ( uint_T ) mxGetScalar ( mxGetCell (
mxGetFieldByNumber ( srcArray , i , j ) , offset ) ) ; return fieldVal & ( (
1u << numBits ) - 1u ) ; } mxArray * mr_test_behaviour_auto_GetDWork ( ) {
static const char * ssDWFieldNames [ 3 ] = { "rtB" , "rtDW" , "NULL_PrevZCX"
, } ; mxArray * ssDW = mxCreateStructMatrix ( 1 , 1 , 3 , ssDWFieldNames ) ;
mr_test_behaviour_auto_cacheDataAsMxArray ( ssDW , 0 , 0 , ( const void * ) &
( rtB ) , sizeof ( rtB ) ) ; { static const char * rtdwDataFieldNames [ 3 ] =
{ "rtDW.kgbgtmirms" , "rtDW.erwbdzj1pg" , "rtDW.d1lcj0fq2i" , } ; mxArray *
rtdwData = mxCreateStructMatrix ( 1 , 1 , 3 , rtdwDataFieldNames ) ;
mr_test_behaviour_auto_cacheDataAsMxArray ( rtdwData , 0 , 0 , ( const void *
) & ( rtDW . kgbgtmirms ) , sizeof ( rtDW . kgbgtmirms ) ) ;
mr_test_behaviour_auto_cacheDataAsMxArray ( rtdwData , 0 , 1 , ( const void *
) & ( rtDW . erwbdzj1pg ) , sizeof ( rtDW . erwbdzj1pg ) ) ;
mr_test_behaviour_auto_cacheDataAsMxArray ( rtdwData , 0 , 2 , ( const void *
) & ( rtDW . d1lcj0fq2i ) , sizeof ( rtDW . d1lcj0fq2i ) ) ;
mxSetFieldByNumber ( ssDW , 0 , 1 , rtdwData ) ; } return ssDW ; } void
mr_test_behaviour_auto_SetDWork ( const mxArray * ssDW ) { ( void ) ssDW ;
mr_test_behaviour_auto_restoreDataFromMxArray ( ( void * ) & ( rtB ) , ssDW ,
0 , 0 , sizeof ( rtB ) ) ; { const mxArray * rtdwData = mxGetFieldByNumber (
ssDW , 0 , 1 ) ; mr_test_behaviour_auto_restoreDataFromMxArray ( ( void * ) &
( rtDW . kgbgtmirms ) , rtdwData , 0 , 0 , sizeof ( rtDW . kgbgtmirms ) ) ;
mr_test_behaviour_auto_restoreDataFromMxArray ( ( void * ) & ( rtDW .
erwbdzj1pg ) , rtdwData , 0 , 1 , sizeof ( rtDW . erwbdzj1pg ) ) ;
mr_test_behaviour_auto_restoreDataFromMxArray ( ( void * ) & ( rtDW .
d1lcj0fq2i ) , rtdwData , 0 , 2 , sizeof ( rtDW . d1lcj0fq2i ) ) ; } }
mxArray * mr_test_behaviour_auto_GetSimStateDisallowedBlocks ( ) { return (
NULL ) ; } void MdlInitializeSizes ( void ) { ssSetNumContStates ( rtS , 5 )
; ssSetNumPeriodicContStates ( rtS , 0 ) ; ssSetNumY ( rtS , 0 ) ; ssSetNumU
( rtS , 0 ) ; ssSetDirectFeedThrough ( rtS , 0 ) ; ssSetNumSampleTimes ( rtS
, 2 ) ; ssSetNumBlocks ( rtS , 24 ) ; ssSetNumBlockIO ( rtS , 11 ) ;
ssSetNumBlockParams ( rtS , 400025 ) ; } void MdlInitializeSampleTimes ( void
) { ssSetSampleTime ( rtS , 0 , 0.0 ) ; ssSetSampleTime ( rtS , 1 , 0.001 ) ;
ssSetOffsetTime ( rtS , 0 , 0.0 ) ; ssSetOffsetTime ( rtS , 1 , 0.0 ) ; }
void raccel_set_checksum ( ) { ssSetChecksumVal ( rtS , 0 , 2798811921U ) ;
ssSetChecksumVal ( rtS , 1 , 3920636257U ) ; ssSetChecksumVal ( rtS , 2 ,
2415101473U ) ; ssSetChecksumVal ( rtS , 3 , 141902847U ) ; }
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
test_behaviour_auto_InitializeDataMapInfo ( ) ; ssSetIsRapidAcceleratorActive
( rtS , true ) ; ssSetRootSS ( rtS , rtS ) ; ssSetVersion ( rtS ,
SIMSTRUCT_VERSION_LEVEL2 ) ; ssSetModelName ( rtS , "test_behaviour_auto" ) ;
ssSetPath ( rtS , "test_behaviour_auto" ) ; ssSetTStart ( rtS , 0.0 ) ;
ssSetTFinal ( rtS , 20.0 ) ; { static RTWLogInfo rt_DataLoggingInfo ;
rt_DataLoggingInfo . loggingInterval = ( NULL ) ; ssSetRTWLogInfo ( rtS , &
rt_DataLoggingInfo ) ; } { { static int_T rt_LoggedStateWidths [ ] = { 1 , 1
, 1 , 1 , 1 } ; static int_T rt_LoggedStateNumDimensions [ ] = { 1 , 1 , 1 ,
1 , 1 } ; static int_T rt_LoggedStateDimensions [ ] = { 1 , 1 , 1 , 1 , 1 } ;
static boolean_T rt_LoggedStateIsVarDims [ ] = { 0 , 0 , 0 , 0 , 0 } ; static
BuiltInDTypeId rt_LoggedStateDataTypeIds [ ] = { SS_DOUBLE , SS_DOUBLE ,
SS_DOUBLE , SS_DOUBLE , SS_DOUBLE } ; static int_T
rt_LoggedStateComplexSignals [ ] = { 0 , 0 , 0 , 0 , 0 } ; static
RTWPreprocessingFcnPtr rt_LoggingStatePreprocessingFcnPtrs [ ] = { ( NULL ) ,
( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) } ; static const char_T *
rt_LoggedStateLabels [ ] = { "CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" ,
"CSTATE" } ; static const char_T * rt_LoggedStateBlockNames [ ] = {
"test_behaviour_auto/Subsystem6/Transfer Fcn" ,
"test_behaviour_auto/Subsystem6/Fast Dynamics" ,
"test_behaviour_auto/Subsystem6/Slow Dynamics1" ,
"test_behaviour_auto/Subsystem6/Slow Dynamics2" ,
"test_behaviour_auto/Subsystem6/Uslow Dynam" } ; static const char_T *
rt_LoggedStateNames [ ] = { "" , "" , "" , "" , "" } ; static boolean_T
rt_LoggedStateCrossMdlRef [ ] = { 0 , 0 , 0 , 0 , 0 } ; static
RTWLogDataTypeConvert rt_RTWLogDataTypeConvert [ ] = { { 0 , SS_DOUBLE ,
SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0
, 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 ,
0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 ,
SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } } ; static int_T
rt_LoggedStateIdxList [ ] = { 0 , 1 , 2 , 3 , 4 } ; static RTWLogSignalInfo
rt_LoggedStateSignalInfo = { 5 , rt_LoggedStateWidths ,
rt_LoggedStateNumDimensions , rt_LoggedStateDimensions ,
rt_LoggedStateIsVarDims , ( NULL ) , ( NULL ) , rt_LoggedStateDataTypeIds ,
rt_LoggedStateComplexSignals , ( NULL ) , rt_LoggingStatePreprocessingFcnPtrs
, { rt_LoggedStateLabels } , ( NULL ) , ( NULL ) , ( NULL ) , {
rt_LoggedStateBlockNames } , { rt_LoggedStateNames } ,
rt_LoggedStateCrossMdlRef , rt_RTWLogDataTypeConvert , rt_LoggedStateIdxList
} ; static void * rt_LoggedStateSignalPtrs [ 5 ] ; rtliSetLogXSignalPtrs (
ssGetRTWLogInfo ( rtS ) , ( LogSignalPtrsType ) rt_LoggedStateSignalPtrs ) ;
rtliSetLogXSignalInfo ( ssGetRTWLogInfo ( rtS ) , & rt_LoggedStateSignalInfo
) ; rt_LoggedStateSignalPtrs [ 0 ] = ( void * ) & rtX . adxkeevqsi ;
rt_LoggedStateSignalPtrs [ 1 ] = ( void * ) & rtX . bgqaqdoh3u ;
rt_LoggedStateSignalPtrs [ 2 ] = ( void * ) & rtX . oirhxuicxl ;
rt_LoggedStateSignalPtrs [ 3 ] = ( void * ) & rtX . m5wfoczshr ;
rt_LoggedStateSignalPtrs [ 4 ] = ( void * ) & rtX . o3r3d2s2ow ; }
rtliSetLogT ( ssGetRTWLogInfo ( rtS ) , "tout" ) ; rtliSetLogX (
ssGetRTWLogInfo ( rtS ) , "" ) ; rtliSetLogXFinal ( ssGetRTWLogInfo ( rtS ) ,
"xFinal" ) ; rtliSetLogVarNameModifier ( ssGetRTWLogInfo ( rtS ) , "none" ) ;
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
static ssSolverInfo slvrInfo ; static boolean_T contStatesDisabled [ 5 ] ;
static real_T absTol [ 5 ] = { 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 } ;
static uint8_T absTolControl [ 5 ] = { 0U , 0U , 0U , 0U , 0U } ; static
real_T contStateJacPerturbBoundMinVec [ 5 ] ; static real_T
contStateJacPerturbBoundMaxVec [ 5 ] ; static ssNonContDerivSigInfo
nonContDerivSigInfo [ 1 ] = { { 1 * sizeof ( real_T ) , ( char * ) ( & rtB .
gduqwdbhw1 ) , ( NULL ) } } ; { int i ; for ( i = 0 ; i < 5 ; ++ i ) {
contStateJacPerturbBoundMinVec [ i ] = 0 ; contStateJacPerturbBoundMaxVec [ i
] = rtGetInf ( ) ; } } ssSetSolverRelTol ( rtS , 0.001 ) ; ssSetStepSize (
rtS , 0.0 ) ; ssSetMinStepSize ( rtS , 0.0 ) ; ssSetMaxNumMinSteps ( rtS , -
1 ) ; ssSetMinStepViolatedError ( rtS , 0 ) ; ssSetMaxStepSize ( rtS , 0.001
) ; ssSetSolverMaxOrder ( rtS , - 1 ) ; ssSetSolverRefineFactor ( rtS , 1 ) ;
ssSetOutputTimes ( rtS , ( NULL ) ) ; ssSetNumOutputTimes ( rtS , 0 ) ;
ssSetOutputTimesOnly ( rtS , 0 ) ; ssSetOutputTimesIndex ( rtS , 0 ) ;
ssSetZCCacheNeedsReset ( rtS , 0 ) ; ssSetDerivCacheNeedsReset ( rtS , 0 ) ;
ssSetNumNonContDerivSigInfos ( rtS , 1 ) ; ssSetNonContDerivSigInfos ( rtS ,
nonContDerivSigInfo ) ; ssSetSolverInfo ( rtS , & slvrInfo ) ;
ssSetSolverName ( rtS , "VariableStepAuto" ) ; ssSetVariableStepSolver ( rtS
, 1 ) ; ssSetSolverConsistencyChecking ( rtS , 0 ) ;
ssSetSolverAdaptiveZcDetection ( rtS , 0 ) ; ssSetSolverRobustResetMethod (
rtS , 0 ) ; ssSetAbsTolVector ( rtS , absTol ) ; ssSetAbsTolControlVector (
rtS , absTolControl ) ; ssSetSolverAbsTol_Obsolete ( rtS , absTol ) ;
ssSetSolverAbsTolControl_Obsolete ( rtS , absTolControl ) ;
ssSetJacobianPerturbationBoundsMinVec ( rtS , contStateJacPerturbBoundMinVec
) ; ssSetJacobianPerturbationBoundsMaxVec ( rtS ,
contStateJacPerturbBoundMaxVec ) ; ssSetSolverStateProjection ( rtS , 0 ) ;
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
ssSetChecksumVal ( rtS , 0 , 2798811921U ) ; ssSetChecksumVal ( rtS , 1 ,
3920636257U ) ; ssSetChecksumVal ( rtS , 2 , 2415101473U ) ; ssSetChecksumVal
( rtS , 3 , 141902847U ) ; { static const sysRanDType rtAlwaysEnabled =
SUBSYS_RAN_BC_ENABLE ; static RTWExtModeInfo rt_ExtModeInfo ; static const
sysRanDType * systemRan [ 5 ] ; gblRTWExtModeInfo = & rt_ExtModeInfo ;
ssSetRTWExtModeInfo ( rtS , & rt_ExtModeInfo ) ;
rteiSetSubSystemActiveVectorAddresses ( & rt_ExtModeInfo , systemRan ) ;
systemRan [ 0 ] = & rtAlwaysEnabled ; systemRan [ 1 ] = & rtAlwaysEnabled ;
systemRan [ 2 ] = & rtAlwaysEnabled ; systemRan [ 3 ] = & rtAlwaysEnabled ;
systemRan [ 4 ] = & rtAlwaysEnabled ; rteiSetModelMappingInfoPtr (
ssGetRTWExtModeInfo ( rtS ) , & ssGetModelMappingInfo ( rtS ) ) ;
rteiSetChecksumsPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetChecksums ( rtS ) )
; rteiSetTPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetTPtr ( rtS ) ) ; }
slsaDisallowedBlocksForSimTargetOP ( rtS ,
mr_test_behaviour_auto_GetSimStateDisallowedBlocks ) ;
slsaGetWorkFcnForSimTargetOP ( rtS , mr_test_behaviour_auto_GetDWork ) ;
slsaSetWorkFcnForSimTargetOP ( rtS , mr_test_behaviour_auto_SetDWork ) ;
rt_RapidReadMatFileAndUpdateParams ( rtS ) ; if ( ssGetErrorStatus ( rtS ) )
{ return rtS ; } return rtS ; }
#if defined(_MSC_VER)
#pragma optimize( "", on )
#endif
const int_T gblParameterTuningTid = 2 ; void MdlOutputsParameterSampleTime (
int_T tid ) { MdlOutputsTID2 ( tid ) ; }
