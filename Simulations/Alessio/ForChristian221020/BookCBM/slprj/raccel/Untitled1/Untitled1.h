#ifndef RTW_HEADER_Untitled1_h_
#define RTW_HEADER_Untitled1_h_
#ifndef Untitled1_COMMON_INCLUDES_
#define Untitled1_COMMON_INCLUDES_
#include <stdlib.h>
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
#include "nesl_rtw_rtp.h"
#include "Untitled1_da03314a_1_gateway.h"
#include "nesl_rtw.h"
#endif
#include "Untitled1_types.h"
#include <stddef.h>
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#define MODEL_NAME Untitled1
#define NSAMPLE_TIMES (3) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (18) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (30)   
#elif NCSTATES != 30
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
typedef struct { real_T krfr5v4lja ; } ccy2mtqfog ; typedef struct { real_T
bcbbityvgg [ 13 ] ; } pr1lgur2yp ; typedef struct { real_T nlkstedhnb [ 13 ]
; } eqqcjgcd3s ; typedef struct { real_T bp3pppoyvc [ 13 ] ; real_T
al4dlzzee3 [ 13 ] ; real_T bxrj01vgkv ; real_T m05vyxtmat [ 4 ] ; real_T
kgzqkrdohc [ 2 ] ; real_T osrdp3vcae ; real_T oj23ghszu3 ; real_T ohhlnpvtnb
; real_T etpouhlg5j ; real_T o4mvedy5x2 ; real_T dqx50lsmsy ; real_T
o0x1n3piu3 [ 4 ] ; eqqcjgcd3s csiqn5xj0p ; pr1lgur2yp plbg54lico ; eqqcjgcd3s
cqigm5udrw ; pr1lgur2yp oo3ambzquj ; ccy2mtqfog kx2u2otjiy ; ccy2mtqfog
ha2dloucon ; } B ; typedef struct { real_T i5gqks14de [ 2 ] ; real_T
fom02y4gvs ; real_T gjy15tdmce ; struct { void * LoggedData ; } d2hnjrl1o4 ;
void * bbpuvhaqb1 ; void * ntaizccyaf ; void * am0ltiyuj4 ; void * llvyklp4og
; void * pcox02acsz ; void * ph5j124dx2 ; void * c4m2irodvz ; void *
lrhuya04aq ; void * pf2k450y4x ; void * hjaupytzr5 ; void * fvjjkkzxed ;
struct { void * LoggedData ; } esj1tra544 ; struct { void * LoggedData ; }
gm04pf5aht ; void * pqkzuikhvq ; void * ecbolhy3dm ; void * jmlnaok3wg ;
int_T psybpwndnj ; int_T lg1ypko4k2 ; int_T jepf1iw4x1 ; int_T jw3jeluxdh ;
boolean_T jqp0un0nfr ; boolean_T di50jkv023 ; boolean_T gd2flceb3v ; } DW ;
typedef struct { real_T g0mc3r5gzj [ 13 ] ; real_T lzbko4ydo0 [ 13 ] ; real_T
fv1jm0s3ra [ 4 ] ; } X ; typedef struct { real_T g0mc3r5gzj [ 13 ] ; real_T
lzbko4ydo0 [ 13 ] ; real_T fv1jm0s3ra [ 4 ] ; } XDot ; typedef struct {
boolean_T g0mc3r5gzj [ 13 ] ; boolean_T lzbko4ydo0 [ 13 ] ; boolean_T
fv1jm0s3ra [ 4 ] ; } XDis ; typedef struct { real_T g0mc3r5gzj [ 13 ] ;
real_T lzbko4ydo0 [ 13 ] ; real_T fv1jm0s3ra [ 4 ] ; } CStateAbsTol ; typedef
struct { real_T g0mc3r5gzj [ 13 ] ; real_T lzbko4ydo0 [ 13 ] ; real_T
fv1jm0s3ra [ 4 ] ; } CXPtMin ; typedef struct { real_T g0mc3r5gzj [ 13 ] ;
real_T lzbko4ydo0 [ 13 ] ; real_T fv1jm0s3ra [ 4 ] ; } CXPtMax ; typedef
struct { rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T
SineWave_Amp ; real_T SineWave_Bias ; real_T SineWave_Freq ; real_T
SineWave_Phase ; real_T SineWave_Amp_gtkrkjckvw ; real_T
SineWave_Bias_lm2amzzq1o ; real_T SineWave_Freq_lwz20jzl5j ; real_T
SineWave_Phase_kq4yrsmvx1 ; real_T Constant_Value ; real_T Constant1_Value ;
real_T Constant2_Value ; real_T Constant3_Value ; real_T Constant4_Value ;
real_T Constant5_Value ; real_T V0_Value ; real_T V0_Value_ijxamwyxru ;
real_T RTP_027A0CB6_GravityVector_Value [ 3 ] ; } ; extern const char *
RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern X rtX ; extern DW rtDW ;
extern P rtP ; extern mxArray * mr_Untitled1_GetDWork ( ) ; extern void
mr_Untitled1_SetDWork ( const mxArray * ssDW ) ; extern mxArray *
mr_Untitled1_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * Untitled1_GetCAPIStaticMap ( void ) ; extern
SimStruct * const rtS ; extern const int_T gblNumToFiles ; extern const int_T
gblNumFrFiles ; extern const int_T gblNumFrWksBlocks ; extern rtInportTUtable
* gblInportTUtables ; extern const char * gblInportFileName ; extern const
int_T gblNumRootInportBlks ; extern const int_T gblNumModelInputs ; extern
const int_T gblInportDataTypeIdx [ ] ; extern const int_T gblInportDims [ ] ;
extern const int_T gblInportComplex [ ] ; extern const int_T
gblInportInterpoFlag [ ] ; extern const int_T gblInportContinuous [ ] ;
extern const int_T gblParameterTuningTid ; extern DataMapInfo *
rt_dataMapInfoPtr ; extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ;
void MdlOutputs ( int_T tid ) ; void MdlOutputsParameterSampleTime ( int_T
tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void
MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ;
SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
