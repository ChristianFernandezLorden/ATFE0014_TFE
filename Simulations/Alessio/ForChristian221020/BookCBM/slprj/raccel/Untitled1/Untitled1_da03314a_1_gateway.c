#ifdef MATLAB_MEX_FILE
#include "tmwtypes.h"
#else
#include "rtwtypes.h"
#endif
#include "nesl_rtw.h"
#include "Untitled1_da03314a_1.h"
#include "Untitled1_da03314a_1_gateway.h"
void Untitled1_da03314a_1_gateway ( void ) { NeModelParameters modelparams =
{ ( NeSolverType ) 0 , 0.001 , 0.001 , 0.001 , 1 , 0 , ( NeModifyAbsTol ) 2 ,
0.001 , 0 , 0 , 0 , 0 , ( SscLoggingSetting ) 0 , 575506940 , 0 , } ;
NeSolverParameters solverparams = { 0 , 0 , 1 , 0 , 0 , 0.001 , 0.001 , 1e-09
, 0 , 0 , 100 , 0 , 1 , ( NeIndexReductionMethod ) 1 , 0 , 1e-09 , 0 , (
NeLocalSolverChoice ) 0 , 0.001 , 0 , 3 , 2 , 0 , 2 , ( NeLinearAlgebraChoice
) 0 , 0 , ( NeEquationFormulationChoice ) 0 , 1024 , 1 , 0.001 , (
NePartitionStorageMethod ) 0 , 1024 , ( NePartitionMethod ) 0 , } ; const
NeOutputParameters * outputparameters = NULL ; NeDae * dae ; size_t
numOutputs = 0 ; int rtpDaes [ 1 ] = { 0 } ; int rtwLogDaes [ 1 ] = { 0 } ; {
static const NeOutputParameters outputparameters_init [ ] = { { 0 , 0 , } , }
; outputparameters = outputparameters_init ; numOutputs = sizeof (
outputparameters_init ) / sizeof ( outputparameters_init [ 0 ] ) ; }
Untitled1_da03314a_1_dae ( & dae , & modelparams , & solverparams ) ;
nesl_register_simulator_group ( "Untitled1/Solver Configuration_1" , 1 , &
dae , & solverparams , & modelparams , numOutputs , outputparameters , 1 ,
rtpDaes , 1 , rtwLogDaes ) ; }
