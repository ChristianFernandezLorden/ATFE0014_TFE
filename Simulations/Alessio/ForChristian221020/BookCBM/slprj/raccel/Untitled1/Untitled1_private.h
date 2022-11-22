#ifndef RTW_HEADER_Untitled1_private_h_
#define RTW_HEADER_Untitled1_private_h_
#include "rtwtypes.h"
#include "builtin_typeid_types.h"
#include "multiword_types.h"
#include "Untitled1.h"
#if !defined(rt_VALIDATE_MEMORY)
#define rt_VALIDATE_MEMORY(S, ptr)     if(!(ptr)) {\
    ssSetErrorStatus(rtS, RT_MEMORY_ALLOCATION_ERROR);\
    }
#endif
#if !defined(rt_FREE)
#if !defined(_WIN32)
#define rt_FREE(ptr)     if((ptr) != (NULL)) {\
    free((ptr));\
    (ptr) = (NULL);\
    }
#else
#define rt_FREE(ptr)     if((ptr) != (NULL)) {\
    free((void *)(ptr));\
    (ptr) = (NULL);\
    }
#endif
#endif
extern void fjgxmk3spi ( real_T h1um02h5ma , real_T ofs15kamds , ccy2mtqfog *
localB ) ; extern void dfbsjhxmp2 ( real_T e30rwwkvvi , pr1lgur2yp * localB )
; extern void mzbrkph513 ( const real_T cgawyanv0k [ 13 ] , real_T gljqwzldei
, real_T lznwyvbqk0 , eqqcjgcd3s * localB ) ;
#if defined(MULTITASKING)
#error Models using the variable step solvers cannot define MULTITASKING
#endif
#endif
