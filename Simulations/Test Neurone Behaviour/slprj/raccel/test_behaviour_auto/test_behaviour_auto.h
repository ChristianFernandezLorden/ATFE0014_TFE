#ifndef RTW_HEADER_test_behaviour_auto_h_
#define RTW_HEADER_test_behaviour_auto_h_
#ifndef test_behaviour_auto_COMMON_INCLUDES_
#define test_behaviour_auto_COMMON_INCLUDES_
#include <stdlib.h>
#include "sl_AsyncioQueue/AsyncioQueueCAPI.h"
#include "rtwtypes.h"
#include "sigstream_rtw.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging_simtarget.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "test_behaviour_auto_types.h"
#include "mwmathutil.h"
#include <stddef.h>
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#define MODEL_NAME test_behaviour_auto
#define NSAMPLE_TIMES (3) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (11) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (5)   
#elif NCSTATES != 5
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T f3hsp4toa4 ; } fzo3wmzixp ; typedef struct { real_T
jnehpucmbe ; real_T h1hu5u53jm ; real_T pn0bubfv0t ; real_T nvckcggmt3 ;
real_T k1k5a4skah ; real_T gduqwdbhw1 ; real_T bsh5ral4if ; fzo3wmzixp
o2bggu0mp5 ; fzo3wmzixp lakqxvp1cn ; fzo3wmzixp nzfnvsmgq0 ; fzo3wmzixp
hhh23u0b0m ; } B ; typedef struct { real_T kgbgtmirms ; struct { void *
AQHandles ; } itgl5c4wg2 ; struct { void * TimePtr ; void * DataPtr ; void *
RSimInfoPtr ; } nok2sngcus ; uint32_T erwbdzj1pg ; struct { int_T PrevIndex ;
} d1lcj0fq2i ; } DW ; typedef struct { real_T adxkeevqsi ; real_T bgqaqdoh3u
; real_T oirhxuicxl ; real_T m5wfoczshr ; real_T o3r3d2s2ow ; } X ; typedef
struct { real_T adxkeevqsi ; real_T bgqaqdoh3u ; real_T oirhxuicxl ; real_T
m5wfoczshr ; real_T o3r3d2s2ow ; } XDot ; typedef struct { boolean_T
adxkeevqsi ; boolean_T bgqaqdoh3u ; boolean_T oirhxuicxl ; boolean_T
m5wfoczshr ; boolean_T o3r3d2s2ow ; } XDis ; typedef struct { real_T
adxkeevqsi ; real_T bgqaqdoh3u ; real_T oirhxuicxl ; real_T m5wfoczshr ;
real_T o3r3d2s2ow ; } CStateAbsTol ; typedef struct { real_T adxkeevqsi ;
real_T bgqaqdoh3u ; real_T oirhxuicxl ; real_T m5wfoczshr ; real_T o3r3d2s2ow
; } CXPtMin ; typedef struct { real_T adxkeevqsi ; real_T bgqaqdoh3u ; real_T
oirhxuicxl ; real_T m5wfoczshr ; real_T o3r3d2s2ow ; } CXPtMax ; typedef
struct { rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T
dfm ; real_T dsm ; real_T dsp ; real_T dup ; real_T gfm ; real_T gsm ; real_T
gsp ; real_T gup ; real_T BandLimitedWhiteNoise_seed ; real_T TransferFcn_A ;
real_T TransferFcn_C ; real_T FromWorkspace_Time0 [ 200001 ] ; real_T
FromWorkspace_Data0 [ 200001 ] ; real_T FastDynamics_A ; real_T
FastDynamics_C ; real_T SlowDynamics1_A ; real_T SlowDynamics1_C ; real_T
SlowDynamics2_A ; real_T SlowDynamics2_C ; real_T UslowDynam_A ; real_T
UslowDynam_C ; real_T WhiteNoise_Mean ; real_T WhiteNoise_StdDev ; real_T
Output_Gain ; real_T V0_Value ; } ; extern const char *
RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern X rtX ; extern DW rtDW ;
extern P rtP ; extern mxArray * mr_test_behaviour_auto_GetDWork ( ) ; extern
void mr_test_behaviour_auto_SetDWork ( const mxArray * ssDW ) ; extern
mxArray * mr_test_behaviour_auto_GetSimStateDisallowedBlocks ( ) ; extern
const rtwCAPI_ModelMappingStaticInfo * test_behaviour_auto_GetCAPIStaticMap (
void ) ; extern SimStruct * const rtS ; extern const int_T gblNumToFiles ;
extern const int_T gblNumFrFiles ; extern const int_T gblNumFrWksBlocks ;
extern rtInportTUtable * gblInportTUtables ; extern const char *
gblInportFileName ; extern const int_T gblNumRootInportBlks ; extern const
int_T gblNumModelInputs ; extern const int_T gblInportDataTypeIdx [ ] ;
extern const int_T gblInportDims [ ] ; extern const int_T gblInportComplex [
] ; extern const int_T gblInportInterpoFlag [ ] ; extern const int_T
gblInportContinuous [ ] ; extern const int_T gblParameterTuningTid ; extern
DataMapInfo * rt_dataMapInfoPtr ; extern rtwCAPI_ModelMappingInfo *
rt_modelMapInfoPtr ; void MdlOutputs ( int_T tid ) ; void
MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T tid ) ;
void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void
MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model (
ssExecutionInfo * executionInfo ) ;
#endif
