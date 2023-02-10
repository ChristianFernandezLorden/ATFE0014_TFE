#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "test_behaviour_auto_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)
#ifndef SS_UINT64
#define SS_UINT64 17
#endif
#ifndef SS_INT64
#define SS_INT64 18
#endif
#else
#include "builtin_typeid_types.h"
#include "test_behaviour_auto.h"
#include "test_behaviour_auto_capi.h"
#include "test_behaviour_auto_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST
#define TARGET_STRING(s)               ((NULL))
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 1 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/I FAST -" ) , TARGET_STRING ( "" ) , 0 , 0 ,
0 , 0 , 0 } , { 1 , 2 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/I SLOW +" ) , TARGET_STRING ( "" ) , 0 , 0 ,
0 , 0 , 0 } , { 2 , 3 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/I SLOW -" ) , TARGET_STRING ( "" ) , 0 , 0 ,
0 , 0 , 0 } , { 3 , 4 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/I USLOW +" ) , TARGET_STRING ( "" ) , 0 , 0 ,
0 , 0 , 0 } , { 4 , 0 , TARGET_STRING ( "test_behaviour_auto/Subsystem6/Add"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 5 , 0 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Fast Dynamics" ) , TARGET_STRING ( "" ) , 0 ,
0 , 0 , 0 , 0 } , { 6 , 0 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Slow Dynamics1" ) , TARGET_STRING ( "" ) , 0
, 0 , 0 , 0 , 0 } , { 7 , 0 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Slow Dynamics2" ) , TARGET_STRING ( "" ) , 0
, 0 , 0 , 0 , 0 } , { 8 , 0 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Transfer Fcn" ) , TARGET_STRING ( "" ) , 0 ,
0 , 0 , 0 , 0 } , { 9 , 0 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Uslow Dynam" ) , TARGET_STRING ( "" ) , 0 , 0
, 0 , 0 , 0 } , { 10 , 0 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Band-Limited White Noise/Output" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 1 } , { 0 , 0 , ( NULL ) , ( NULL ) ,
0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_BlockParameters
rtBlockParameters [ ] = { { 11 , TARGET_STRING (
"test_behaviour_auto/From Workspace" ) , TARGET_STRING ( "Time0" ) , 0 , 1 ,
0 } , { 12 , TARGET_STRING ( "test_behaviour_auto/From Workspace" ) ,
TARGET_STRING ( "Data0" ) , 0 , 1 , 0 } , { 13 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Band-Limited White Noise" ) , TARGET_STRING (
"seed" ) , 0 , 0 , 0 } , { 14 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/V0" ) , TARGET_STRING ( "Value" ) , 0 , 0 , 0
} , { 15 , TARGET_STRING ( "test_behaviour_auto/Subsystem6/Fast Dynamics" ) ,
TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 16 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Fast Dynamics" ) , TARGET_STRING ( "C" ) , 0
, 0 , 0 } , { 17 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Slow Dynamics1" ) , TARGET_STRING ( "A" ) , 0
, 0 , 0 } , { 18 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Slow Dynamics1" ) , TARGET_STRING ( "C" ) , 0
, 0 , 0 } , { 19 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Slow Dynamics2" ) , TARGET_STRING ( "A" ) , 0
, 0 , 0 } , { 20 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Slow Dynamics2" ) , TARGET_STRING ( "C" ) , 0
, 0 , 0 } , { 21 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Transfer Fcn" ) , TARGET_STRING ( "A" ) , 0 ,
0 , 0 } , { 22 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Transfer Fcn" ) , TARGET_STRING ( "C" ) , 0 ,
0 , 0 } , { 23 , TARGET_STRING ( "test_behaviour_auto/Subsystem6/Uslow Dynam"
) , TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 24 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Uslow Dynam" ) , TARGET_STRING ( "C" ) , 0 ,
0 , 0 } , { 25 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Band-Limited White Noise/Output" ) ,
TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 26 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Band-Limited White Noise/White Noise" ) ,
TARGET_STRING ( "Mean" ) , 0 , 0 , 0 } , { 27 , TARGET_STRING (
"test_behaviour_auto/Subsystem6/Band-Limited White Noise/White Noise" ) ,
TARGET_STRING ( "StdDev" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 , 0
, 0 } } ; static int_T rt_LoggedStateIdxList [ ] = { - 1 } ; static const
rtwCAPI_Signals rtRootInputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 ,
0 , 0 , 0 } } ; static const rtwCAPI_Signals rtRootOutputs [ ] = { { 0 , 0 ,
( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const
rtwCAPI_ModelParameters rtModelParameters [ ] = { { 28 , TARGET_STRING (
"dfm" ) , 0 , 0 , 0 } , { 29 , TARGET_STRING ( "dsm" ) , 0 , 0 , 0 } , { 30 ,
TARGET_STRING ( "dsp" ) , 0 , 0 , 0 } , { 31 , TARGET_STRING ( "dup" ) , 0 ,
0 , 0 } , { 32 , TARGET_STRING ( "gfm" ) , 0 , 0 , 0 } , { 33 , TARGET_STRING
( "gsm" ) , 0 , 0 , 0 } , { 34 , TARGET_STRING ( "gsp" ) , 0 , 0 , 0 } , { 35
, TARGET_STRING ( "gup" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , 0 , 0 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . hhh23u0b0m . f3hsp4toa4 , & rtB .
nzfnvsmgq0 . f3hsp4toa4 , & rtB . lakqxvp1cn . f3hsp4toa4 , & rtB .
o2bggu0mp5 . f3hsp4toa4 , & rtB . bsh5ral4if , & rtB . h1hu5u53jm , & rtB .
pn0bubfv0t , & rtB . nvckcggmt3 , & rtB . jnehpucmbe , & rtB . k1k5a4skah , &
rtB . gduqwdbhw1 , & rtP . FromWorkspace_Time0 [ 0 ] , & rtP .
FromWorkspace_Data0 [ 0 ] , & rtP . BandLimitedWhiteNoise_seed , & rtP .
V0_Value , & rtP . FastDynamics_A , & rtP . FastDynamics_C , & rtP .
SlowDynamics1_A , & rtP . SlowDynamics1_C , & rtP . SlowDynamics2_A , & rtP .
SlowDynamics2_C , & rtP . TransferFcn_A , & rtP . TransferFcn_C , & rtP .
UslowDynam_A , & rtP . UslowDynam_C , & rtP . Output_Gain , & rtP .
WhiteNoise_Mean , & rtP . WhiteNoise_StdDev , & rtP . dfm , & rtP . dsm , &
rtP . dsp , & rtP . dup , & rtP . gfm , & rtP . gsm , & rtP . gsp , & rtP .
gup , } ; static int32_T * rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , ( uint8_T ) SS_DOUBLE , 0 , 0 , 0 } }
;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } , { rtwCAPI_VECTOR , 2 , 2 , 0 } } ; static
const uint_T rtDimensionArray [ ] = { 1 , 1 , 200001 , 1 } ; static const
real_T rtcapiStoredFloats [ ] = { 0.0 , 0.001 } ; static const
rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) ,
rtwCAPI_FIX_RESERVED , 0 , 0 , ( boolean_T ) 0 } , } ; static const
rtwCAPI_SampleTimeMap rtSampleTimeMap [ ] = { { ( const void * ) &
rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [ 0 ] , (
int8_T ) 0 , ( uint8_T ) 0 } , { ( const void * ) & rtcapiStoredFloats [ 1 ]
, ( const void * ) & rtcapiStoredFloats [ 0 ] , ( int8_T ) 1 , ( uint8_T ) 0
} } ; static rtwCAPI_ModelMappingStaticInfo mmiStatic = { { rtBlockSignals ,
11 , rtRootInputs , 0 , rtRootOutputs , 0 } , { rtBlockParameters , 17 ,
rtModelParameters , 8 } , { ( NULL ) , 0 } , { rtDataTypeMap , rtDimensionMap
, rtFixPtMap , rtElementMap , rtSampleTimeMap , rtDimensionArray } , "float"
, { 2798811921U , 3920636257U , 2415101473U , 141902847U } , ( NULL ) , 0 , (
boolean_T ) 0 , rt_LoggedStateIdxList } ; const
rtwCAPI_ModelMappingStaticInfo * test_behaviour_auto_GetCAPIStaticMap ( void
) { return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void test_behaviour_auto_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion
( ( * rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void test_behaviour_auto_host_InitializeDataMapInfo (
test_behaviour_auto_host_DataMapInfo_T * dataMap , const char * path ) {
rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ; rtwCAPI_SetStaticMap ( dataMap ->
mmi , & mmiStatic ) ; rtwCAPI_SetDataAddressMap ( dataMap -> mmi , ( NULL ) )
; rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetPath ( dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap ->
mmi , ( NULL ) ) ; rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
