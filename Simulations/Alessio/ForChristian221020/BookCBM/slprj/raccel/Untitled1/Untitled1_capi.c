#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "Untitled1_capi_host.h"
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
#include "Untitled1.h"
#include "Untitled1_capi.h"
#include "Untitled1_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST
#define TARGET_STRING(s)               ((NULL))
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 2 , TARGET_STRING (
"Untitled1/MATLAB Function1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } ,
{ 1 , 3 , TARGET_STRING ( "Untitled1/MATLAB Function2" ) , TARGET_STRING ( ""
) , 0 , 0 , 0 , 0 , 0 } , { 2 , 0 , TARGET_STRING ( "Untitled1/Sum" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 3 , 5 , TARGET_STRING (
"Untitled1/Neuron 1/Initial Conditions" ) , TARGET_STRING ( "" ) , 0 , 0 , 1
, 0 , 1 } , { 4 , 6 , TARGET_STRING ( "Untitled1/Neuron 1/Vector Field" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 0 } , { 5 , 0 , TARGET_STRING (
"Untitled1/Neuron 1/Integrator" ) , TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 0
} , { 6 , 0 , TARGET_STRING ( "Untitled1/Neuron 1/Sum" ) , TARGET_STRING ( ""
) , 0 , 0 , 0 , 0 , 0 } , { 7 , 0 , TARGET_STRING ( "Untitled1/Neuron 1/Sum1"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 8 , 7 , TARGET_STRING (
"Untitled1/Neuron 2/Initial Conditions" ) , TARGET_STRING ( "" ) , 0 , 0 , 1
, 0 , 1 } , { 9 , 8 , TARGET_STRING ( "Untitled1/Neuron 2/Vector Field" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 0 } , { 10 , 0 , TARGET_STRING (
"Untitled1/Neuron 2/Integrator" ) , TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 0
} , { 11 , 0 , TARGET_STRING ( "Untitled1/Neuron 2/Sum" ) , TARGET_STRING (
"" ) , 0 , 0 , 0 , 0 , 0 } , { 12 , 0 , TARGET_STRING (
"Untitled1/Neuron 2/Sum1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , {
13 , 0 , TARGET_STRING ( "Untitled1/Solver Configuration/RTP_1" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 1 } , { 14 , 0 , TARGET_STRING (
"Untitled1/Solver Configuration/EVAL_KEY/INPUT_1_1_1" ) , TARGET_STRING ( ""
) , 0 , 0 , 2 , 0 , 0 } , { 15 , 0 , TARGET_STRING (
"Untitled1/Solver Configuration/EVAL_KEY/OUTPUT_1_0" ) , TARGET_STRING ( "" )
, 0 , 0 , 3 , 0 , 0 } , { 16 , 0 , TARGET_STRING (
"Untitled1/Solver Configuration/EVAL_KEY/STATE_1" ) , TARGET_STRING ( "" ) ,
0 , 0 , 2 , 0 , 0 } , { 17 , 0 , TARGET_STRING (
"Untitled1/Theta 1/EVAL_KEY/RESHAPE" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0
, 0 } , { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const
rtwCAPI_BlockParameters rtBlockParameters [ ] = { { 18 , TARGET_STRING (
"Untitled1/Constant" ) , TARGET_STRING ( "Value" ) , 0 , 0 , 0 } , { 19 ,
TARGET_STRING ( "Untitled1/Constant1" ) , TARGET_STRING ( "Value" ) , 0 , 0 ,
0 } , { 20 , TARGET_STRING ( "Untitled1/Constant2" ) , TARGET_STRING (
"Value" ) , 0 , 0 , 0 } , { 21 , TARGET_STRING ( "Untitled1/Constant3" ) ,
TARGET_STRING ( "Value" ) , 0 , 0 , 0 } , { 22 , TARGET_STRING (
"Untitled1/Constant4" ) , TARGET_STRING ( "Value" ) , 0 , 0 , 0 } , { 23 ,
TARGET_STRING ( "Untitled1/Constant5" ) , TARGET_STRING ( "Value" ) , 0 , 0 ,
0 } , { 24 , TARGET_STRING ( "Untitled1/Neuron 1/V0" ) , TARGET_STRING (
"Value" ) , 0 , 0 , 0 } , { 25 , TARGET_STRING (
"Untitled1/Neuron 1/Sine Wave" ) , TARGET_STRING ( "Amplitude" ) , 0 , 0 , 0
} , { 26 , TARGET_STRING ( "Untitled1/Neuron 1/Sine Wave" ) , TARGET_STRING (
"Bias" ) , 0 , 0 , 0 } , { 27 , TARGET_STRING (
"Untitled1/Neuron 1/Sine Wave" ) , TARGET_STRING ( "Frequency" ) , 0 , 0 , 0
} , { 28 , TARGET_STRING ( "Untitled1/Neuron 1/Sine Wave" ) , TARGET_STRING (
"Phase" ) , 0 , 0 , 0 } , { 29 , TARGET_STRING ( "Untitled1/Neuron 2/V0" ) ,
TARGET_STRING ( "Value" ) , 0 , 0 , 0 } , { 30 , TARGET_STRING (
"Untitled1/Neuron 2/Sine Wave" ) , TARGET_STRING ( "Amplitude" ) , 0 , 0 , 0
} , { 31 , TARGET_STRING ( "Untitled1/Neuron 2/Sine Wave" ) , TARGET_STRING (
"Bias" ) , 0 , 0 , 0 } , { 32 , TARGET_STRING (
"Untitled1/Neuron 2/Sine Wave" ) , TARGET_STRING ( "Frequency" ) , 0 , 0 , 0
} , { 33 , TARGET_STRING ( "Untitled1/Neuron 2/Sine Wave" ) , TARGET_STRING (
"Phase" ) , 0 , 0 , 0 } , { 34 , TARGET_STRING (
 "Untitled1/Subsystem_around_RTP_027A0CB6_GravityVector/Subsystem_around_RTP_027A0CB6_GravityVector"
) , TARGET_STRING ( "Value" ) , 0 , 4 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 ,
0 , 0 } } ; static int_T rt_LoggedStateIdxList [ ] = { - 1 } ; static const
rtwCAPI_Signals rtRootInputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 ,
0 , 0 , 0 } } ; static const rtwCAPI_Signals rtRootOutputs [ ] = { { 0 , 0 ,
( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const
rtwCAPI_ModelParameters rtModelParameters [ ] = { { 0 , ( NULL ) , 0 , 0 , 0
} } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . ha2dloucon . krfr5v4lja , & rtB .
kx2u2otjiy . krfr5v4lja , & rtB . oj23ghszu3 , & rtB . oo3ambzquj .
bcbbityvgg [ 0 ] , & rtB . cqigm5udrw . nlkstedhnb [ 0 ] , & rtB . bp3pppoyvc
[ 0 ] , & rtB . etpouhlg5j , & rtB . ohhlnpvtnb , & rtB . plbg54lico .
bcbbityvgg [ 0 ] , & rtB . csiqn5xj0p . nlkstedhnb [ 0 ] , & rtB . al4dlzzee3
[ 0 ] , & rtB . dqx50lsmsy , & rtB . o4mvedy5x2 , & rtB . bxrj01vgkv , & rtB
. o0x1n3piu3 [ 0 ] , & rtB . kgzqkrdohc [ 0 ] , & rtB . m05vyxtmat [ 0 ] , &
rtB . osrdp3vcae , & rtP . Constant_Value , & rtP . Constant1_Value , & rtP .
Constant2_Value , & rtP . Constant3_Value , & rtP . Constant4_Value , & rtP .
Constant5_Value , & rtP . V0_Value , & rtP . SineWave_Amp , & rtP .
SineWave_Bias , & rtP . SineWave_Freq , & rtP . SineWave_Phase , & rtP .
V0_Value_ijxamwyxru , & rtP . SineWave_Amp_gtkrkjckvw , & rtP .
SineWave_Bias_lm2amzzq1o , & rtP . SineWave_Freq_lwz20jzl5j , & rtP .
SineWave_Phase_kq4yrsmvx1 , & rtP . RTP_027A0CB6_GravityVector_Value [ 0 ] ,
} ; static int32_T * rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , ( uint8_T ) SS_DOUBLE , 0 , 0 , 0 } }
;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } , { rtwCAPI_MATRIX_COL_MAJOR , 2 , 2 , 0 } , {
rtwCAPI_VECTOR , 4 , 2 , 0 } , { rtwCAPI_VECTOR , 6 , 2 , 0 } , {
rtwCAPI_VECTOR , 8 , 2 , 0 } } ; static const uint_T rtDimensionArray [ ] = {
1 , 1 , 13 , 1 , 4 , 1 , 2 , 1 , 1 , 3 } ; static const real_T
rtcapiStoredFloats [ ] = { 0.0 , 1.0 } ; static const rtwCAPI_FixPtMap
rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) , rtwCAPI_FIX_RESERVED , 0 , 0 , (
boolean_T ) 0 } , } ; static const rtwCAPI_SampleTimeMap rtSampleTimeMap [ ]
= { { ( const void * ) & rtcapiStoredFloats [ 0 ] , ( const void * ) &
rtcapiStoredFloats [ 0 ] , ( int8_T ) 0 , ( uint8_T ) 0 } , { ( const void *
) & rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [ 1 ] ,
( int8_T ) 1 , ( uint8_T ) 0 } } ; static rtwCAPI_ModelMappingStaticInfo
mmiStatic = { { rtBlockSignals , 18 , rtRootInputs , 0 , rtRootOutputs , 0 }
, { rtBlockParameters , 17 , rtModelParameters , 0 } , { ( NULL ) , 0 } , {
rtDataTypeMap , rtDimensionMap , rtFixPtMap , rtElementMap , rtSampleTimeMap
, rtDimensionArray } , "float" , { 3660660612U , 34751504U , 1021262967U ,
2058824963U } , ( NULL ) , 0 , ( boolean_T ) 0 , rt_LoggedStateIdxList } ;
const rtwCAPI_ModelMappingStaticInfo * Untitled1_GetCAPIStaticMap ( void ) {
return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void Untitled1_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( ( *
rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
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
void Untitled1_host_InitializeDataMapInfo ( Untitled1_host_DataMapInfo_T *
dataMap , const char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ;
rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ;
rtwCAPI_SetDataAddressMap ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetPath
( dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , ( NULL ) )
; rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
