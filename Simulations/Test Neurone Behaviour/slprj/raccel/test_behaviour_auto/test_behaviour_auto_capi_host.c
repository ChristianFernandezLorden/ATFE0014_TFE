#include "test_behaviour_auto_capi_host.h"
static test_behaviour_auto_host_DataMapInfo_T root;
static int initialized = 0;
__declspec( dllexport ) rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        test_behaviour_auto_host_InitializeDataMapInfo(&(root), "test_behaviour_auto");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction() {return(getRootMappingInfo());}
