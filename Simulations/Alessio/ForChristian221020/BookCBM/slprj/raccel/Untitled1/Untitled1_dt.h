#include "ext_types.h"
static DataTypeInfo rtDataTypeInfoTable [ ] = { { "real_T" , 0 , 8 } , {
"real32_T" , 1 , 4 } , { "int8_T" , 2 , 1 } , { "uint8_T" , 3 , 1 } , {
"int16_T" , 4 , 2 } , { "uint16_T" , 5 , 2 } , { "int32_T" , 6 , 4 } , {
"uint32_T" , 7 , 4 } , { "boolean_T" , 8 , 1 } , { "fcn_call_T" , 9 , 0 } , {
"int_T" , 10 , 4 } , { "pointer_T" , 11 , 8 } , { "action_T" , 12 , 8 } , {
"timer_uint32_pair_T" , 13 , 8 } , { "physical_connection" , 14 , 8 } , {
"int64_T" , 15 , 8 } , { "uint64_T" , 16 , 8 } , { "uint64_T" , 17 , 8 } , {
"int64_T" , 18 , 8 } , { "char_T" , 19 , 8 } , { "uchar_T" , 20 , 8 } , {
"time_T" , 21 , 8 } } ; static uint_T rtDataTypeSizes [ ] = { sizeof ( real_T
) , sizeof ( real32_T ) , sizeof ( int8_T ) , sizeof ( uint8_T ) , sizeof (
int16_T ) , sizeof ( uint16_T ) , sizeof ( int32_T ) , sizeof ( uint32_T ) ,
sizeof ( boolean_T ) , sizeof ( fcn_call_T ) , sizeof ( int_T ) , sizeof (
pointer_T ) , sizeof ( action_T ) , 2 * sizeof ( uint32_T ) , sizeof (
int32_T ) , sizeof ( int64_T ) , sizeof ( uint64_T ) , sizeof ( uint64_T ) ,
sizeof ( int64_T ) , sizeof ( char_T ) , sizeof ( uchar_T ) , sizeof ( time_T
) } ; static const char_T * rtDataTypeNames [ ] = { "real_T" , "real32_T" ,
"int8_T" , "uint8_T" , "int16_T" , "uint16_T" , "int32_T" , "uint32_T" ,
"boolean_T" , "fcn_call_T" , "int_T" , "pointer_T" , "action_T" ,
"timer_uint32_pair_T" , "physical_connection" , "int64_T" , "uint64_T" ,
"uint64_T" , "int64_T" , "char_T" , "uchar_T" , "time_T" } ; static
DataTypeTransition rtBTransitions [ ] = { { ( char_T * ) ( & rtB . bp3pppoyvc
[ 0 ] ) , 0 , 0 , 43 } , { ( char_T * ) ( & rtB . csiqn5xj0p . nlkstedhnb [ 0
] ) , 0 , 0 , 13 } , { ( char_T * ) ( & rtB . plbg54lico . bcbbityvgg [ 0 ] )
, 0 , 0 , 13 } , { ( char_T * ) ( & rtB . cqigm5udrw . nlkstedhnb [ 0 ] ) , 0
, 0 , 13 } , { ( char_T * ) ( & rtB . oo3ambzquj . bcbbityvgg [ 0 ] ) , 0 , 0
, 13 } , { ( char_T * ) ( & rtB . kx2u2otjiy . krfr5v4lja ) , 0 , 0 , 1 } , {
( char_T * ) ( & rtB . ha2dloucon . krfr5v4lja ) , 0 , 0 , 1 } , { ( char_T *
) ( & rtDW . i5gqks14de [ 0 ] ) , 0 , 0 , 4 } , { ( char_T * ) ( & rtDW .
d2hnjrl1o4 . LoggedData ) , 11 , 0 , 17 } , { ( char_T * ) ( & rtDW .
psybpwndnj ) , 10 , 0 , 4 } , { ( char_T * ) ( & rtDW . jqp0un0nfr ) , 8 , 0
, 3 } } ; static DataTypeTransitionTable rtBTransTable = { 11U ,
rtBTransitions } ; static DataTypeTransition rtPTransitions [ ] = { { (
char_T * ) ( & rtP . SineWave_Amp ) , 0 , 0 , 19 } } ; static
DataTypeTransitionTable rtPTransTable = { 1U , rtPTransitions } ;
