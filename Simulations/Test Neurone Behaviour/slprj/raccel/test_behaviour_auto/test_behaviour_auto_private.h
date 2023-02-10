#ifndef RTW_HEADER_test_behaviour_auto_private_h_
#define RTW_HEADER_test_behaviour_auto_private_h_
#include "rtwtypes.h"
#include "builtin_typeid_types.h"
#include "multiword_types.h"
#include "test_behaviour_auto.h"
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
#ifndef rtInterpolate
#define rtInterpolate(v1,v2,f1,f2)     (((v1)==(v2))?((double)(v1)):    (((f1)*((double)(v1)))+((f2)*((double)(v2)))))
#endif
#ifndef rtRound
#define rtRound(v) ( ((v) >= 0) ?     muDoubleScalarFloor((v) + 0.5) :     muDoubleScalarCeil((v) - 0.5) )
#endif
extern real_T rt_urand_Upu32_Yd_f_pw_snf ( uint32_T * u ) ; extern real_T
rt_nrand_Upu32_Yd_f_pw_snf ( uint32_T * u ) ; extern void d1w1oyto0m ( real_T
pjvmursm2j , real_T pxkko0al3a , real_T eh3xl2o5mg , real_T fj5kokri0u ,
fzo3wmzixp * localB ) ;
#if defined(MULTITASKING)
#error Models using the variable step solvers cannot define MULTITASKING
#endif
#endif
