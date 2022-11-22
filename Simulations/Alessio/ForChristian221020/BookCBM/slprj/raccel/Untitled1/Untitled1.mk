# Copyright 1994-2021 The MathWorks, Inc.
#
# File    : ert_unix.tmf   
#
# Abstract:
#       Template makefile for building a UNIX-based stand-alone embedded 
#       real-time version of Simulink model using generated C code.
#
#       This makefile attempts to conform to the guidelines specified in the
#       IEEE Std 1003.2-1992 (POSIX) standard. It is designed to be used
#       with GNU Make which is located in matlabroot/rtw/bin.
#
#       Note that this template is automatically customized by the build 
#       procedure to create "<model>.mk"
#
#       The following defines can be used to modify the behavior of the
#       build:
#         OPT_OPTS       - Optimization options. Default is -O.
#         CPP_OPTS       - C++ compiler options.	
#         OPTS           - User specific compile options.
#         USER_SRCS      - Additional user sources, such as files needed by
#                          S-functions.
#         USER_INCLUDES  - Additional include paths
#                          (i.e. USER_INCLUDES="-Iwhere-ever -Iwhere-ever2")
#
#       To enable debugging:
#         set DEBUG_BUILD = 1 below, which will trigger OPTS=-g and
#          LDFLAGS += -g (may vary with compiler version, see compiler doc) 
#
#       This template makefile is designed to be used with a system target
#       file that contains 'rtwgensettings.BuildDirSuffix' see ert.tlc


#------------------------ Macros read by make_rtw ------------------------------
#
# The following macros are read by the build procedure:
#
#  MAKECMD         - This is the command used to invoke the make utility
#  HOST            - What platform this template makefile is targeted for
#                    (i.e. PC or UNIX)
#  BUILD           - Invoke make from the build procedure (yes/no)?
#  SYS_TARGET_FILE - Name of system target file.

MAKECMD         = /Applications/MATLAB_R2022a.app/bin/maci64/gmake
HOST            = UNIX
BUILD           = yes
SYS_TARGET_FILE = any

# Opt in to simplified format by specifying compatible Toolchain
TOOLCHAIN_NAME = ["Clang v3.1 | gmake (64-bit Mac)", \
             "GNU gcc/g++ | gmake (64-bit Linux)"]

#---------------------- Tokens expanded by make_rtw ----------------------------
#
# The following tokens, when wrapped with "|>" and "<|" are expanded by the
# build procedure.
#
#  MODEL_NAME          - Name of the Simulink block diagram
#  MODEL_MODULES       - Any additional generated source modules
#  MAKEFILE_NAME       - Name of makefile created from template makefile <model>.mk
#  MATLAB_ROOT         - Path to where MATLAB is installed.
#  S_FUNCTIONS_LIB     - List of S-functions libraries to link. 
#  NUMST               - Number of sample times
#  NCSTATES            - Number of continuous states
#  COMPUTER            - Computer type. See the MATLAB computer command.
#  BUILDARGS           - Options passed in at the command line.
#  MULTITASKING        - yes (1) or no (0): Is solver mode multitasking
#  INTEGER_CODE        - yes (1) or no (0): Is generated code purely integer
#  MAT_FILE            - yes (1) or no (0): Should mat file logging be done,
#                        if 0, the generated code runs indefinitely
#  MULTI_INSTANCE_CODE - Is the generated code multi instantiable (1/0)?
#  MODELREFS           - List of referenced models
#  SHRLIBTARGET        - Is this build intended for generation of a shared library instead 
#                        of executable (1/0)?
#  MAKEFILEBUILDER_TGT - Is this build performed by the MakefileBuilder class
#                        e.g. to create a PIL executable?
#  STANDALONE_SUPPRESS_EXE - Build the standalone target but only create object code modules 
#                            and do not build an executable

MODEL                   = Untitled1
MODULES                 = pm_printf.c Untitled1_da03314a_1.c Untitled1_da03314a_1_create.c Untitled1_da03314a_1_setParameters.c Untitled1_da03314a_1_asserts.c Untitled1_da03314a_1_deriv.c Untitled1_da03314a_1_checkDynamics.c Untitled1_da03314a_1_compOutputs.c Untitled1_da03314a_1_asm_delegate.c Untitled1_da03314a_1_sim_delegate.c Untitled1_da03314a_1_mode_zero_crossings.c Untitled1_da03314a_1_logging.c Untitled1_da03314a_1_geometries.c Untitled1_da03314a_1_gateway.c rt_logging_simtarget.c rt_backsubrr_dbl.c rt_forwardsubrr_dbl.c rt_lu_real.c rt_matrixlib_dbl.c Untitled1.c Untitled1_capi.c Untitled1_data.c Untitled1_tgtconn.c rtGetInf.c rtGetNaN.c rt_nonfinite.c rt_logging_mmi_simtarget.c rtw_modelmap_utils_simtarget.c raccel_main.c raccel_sup.c raccel_mat.c simulink_solver_api.c raccel_utils.c common_utils.c ext_svr.c updown.c ext_work.c rtiostream_interface.c rtiostream_tcpip.c rtiostream_utils.c
PRODUCT                 = Untitled1
MAKEFILE                = Untitled1.mk
MATLAB_ROOT             = /Applications/MATLAB_R2022a.app
ALT_MATLAB_ROOT         = /Applications/MATLAB_R2022a.app
START_DIR               = /Users/alessiofranci/Documents/MATLAB/BookCBM
S_FUNCTIONS_LIB         = 
NUMST                   = 2
NCSTATES                = 30
COMPUTER                = MACI64
BUILDARGS               =  RSIM_SOLVER_SELECTION=2 PCMATLABROOT="/Applications/MATLAB_R2022a.app" EXTMODE_STATIC_ALLOC=0 EXTMODE_STATIC_ALLOC_SIZE=1000000 EXTMODE_TRANSPORT=0 TMW_EXTMODE_TESTING=0 RSIM_PARAMETER_LOADING=1 OPTS="-DTGTCONN -DIS_SIM_TARGET -DNRT -DRSIM_PARAMETER_LOADING -DRSIM_WITH_SL_SOLVER -DENABLE_SLEXEC_SSBRIDGE=1 -DMODEL_HAS_DYNAMICALLY_LOADED_SFCNS=0 -DON_TARGET_WAIT_FOR_START=0 -DTID01EQ=0" MACOSX_VERSION_MIN_FLAG="-mmacosx-version-min=10.15"
MULTITASKING            = 0
INTEGER_CODE            = 0
MAT_FILE                = 1
ALLOCATIONFCN           = 0
ONESTEPFCN              = 0
TERMFCN                 = 1
ENABLE_SLEXEC_SSBRIDGE  = 1
MULTI_INSTANCE_CODE     = 0
CLASSIC_INTERFACE       = 1
MODELREFS               = 
GEN_SAMPLE_MAIN         = 0
TARGET_LANG_EXT         = c
SHRLIBTARGET            = 0
MAKEFILEBUILDER_TGT     = 0
STANDALONE_SUPPRESS_EXE = 0
OPTIMIZATION_FLAGS      = -O0
ADDITIONAL_LDFLAGS      =  -Wl,-rpath,/Applications/MATLAB_R2022a.app/bin/maci64 -Wl,-rpath,/Applications/MATLAB_R2022a.app/sys/os/maci64 -Wl,-rpath,@executable_path -Wl,-rpath,@executable_path/../../.. -L/Applications/MATLAB_R2022a.app/sys/os/maci64
INTERLEAVED_COMPLEX_FLAGS = -R2018a
DEFINES_CUSTOM          = -DEXT_MODE -DIS_RAPID_ACCEL -DisSimStruct64FeatureOn=1 
DEFINES_OTHER           = -DHAVESTDIO
COMPILE_FLAGS_OTHER     = -msse2
SYSTEM_LIBS             = -L"/Applications/MATLAB_R2022a.app/bin/maci64" -lmwipp -lut -lmx -lmex -lmat -lmwmathutil -lmwslsa_sim -lmwslexec_simbridge -lmwsl_fileio -lmwsigstream -lmwsl_AsyncioQueue -lmwsl_services -lmwsdi_raccel -lmwi18n -lmwcoder_target_services -lmwcoder_ParamTuningTgtAppSvc -lmwslpointerutil -lmwsl_simtarget_instrumentation -lfixedpoint -lmwslexec_simlog -lmwstringutil -lm -lpthread -ldl
MODEL_HAS_DYNAMICALLY_LOADED_SFCNS = 0

# To enable debugging:
# set DEBUG_BUILD = 1
DEBUG_BUILD             = 0

#--------------------------- Model and reference models -----------------------
MODELLIB                  = 
MODELREF_LINK_LIBS        = 
RELATIVE_PATH_TO_ANCHOR   = ../../..
# NONE: standalone, SIM: modelref sim, RTW: modelref coder target
MODELREF_TARGET_TYPE       = NONE


#-- For gcc, link model reference libraries as a group to resolve circular references ---
#   (NOTE: Clang does not recognize these switches but it already resolves circular references)
MODELREF_LINK_LIBS_GROUP = 
ifeq ($(COMPUTER),GLNXA64)
  MODELREF_LINK_LIBS_GROUP = -Wl,--start-group  -Wl,--end-group
endif

#-- In the case when directory name contains space ---
ifneq ($(MATLAB_ROOT),$(ALT_MATLAB_ROOT))
MATLAB_ROOT := $(ALT_MATLAB_ROOT)
endif

#--------------------------- Tool Specifications -------------------------------

include $(MATLAB_ROOT)/rtw/c/tools/unixtools.mk

#------------------------------ Include Path -----------------------------------

# Additional includes 
ADD_INCLUDES = \
	-I$(START_DIR) \
	-I$(START_DIR)/slprj/raccel/Untitled1 \
	-I$(MATLAB_ROOT)/rtw/c/src/rapid \
	-I$(MATLAB_ROOT)/rtw/c/raccel \
	-I$(MATLAB_ROOT)/rtw/c/src/ext_mode/common \
	-I$(MATLAB_ROOT)/toolbox/coder/rtiostream/src \
	-I$(MATLAB_ROOT)/extern/include \
	-I$(MATLAB_ROOT)/simulink/include \
	-I$(MATLAB_ROOT)/rtw/c/src \
	-I$(MATLAB_ROOT)/toolbox/coder/rtiostream/src/rtiostreamtcpip \
	-I$(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils \
	-I$(MATLAB_ROOT)/toolbox/physmod/sm/ssci/c/maci64 \
	-I$(MATLAB_ROOT)/toolbox/physmod/sm/core/c/maci64 \
	-I$(MATLAB_ROOT)/toolbox/physmod/sm/math/c/maci64 \
	-I$(MATLAB_ROOT)/toolbox/physmod/simscape/engine/sli/c/maci64 \
	-I$(MATLAB_ROOT)/toolbox/physmod/simscape/engine/core/c/maci64 \
	-I$(MATLAB_ROOT)/toolbox/physmod/simscape/compiler/core/c/maci64 \
	-I$(MATLAB_ROOT)/toolbox/physmod/simscape/ds/core/c/maci64 \
	-I$(MATLAB_ROOT)/toolbox/physmod/simscape/simtypes/core/c/maci64 \
	-I$(MATLAB_ROOT)/toolbox/physmod/common/math/core/c/maci64 \
	-I$(MATLAB_ROOT)/toolbox/physmod/common/logging/core/c/maci64 \
	-I$(MATLAB_ROOT)/toolbox/physmod/common/lang/core/c/maci64 \
	-I$(MATLAB_ROOT)/toolbox/physmod/common/external/library/c/maci64 \
	-I$(MATLAB_ROOT)/toolbox/physmod/common/foundation/core/c/maci64 \


INCLUDES = -I. -I$(RELATIVE_PATH_TO_ANCHOR) $(USER_INCLUDES) \
	$(INSTRUMENT_INCLUDES) $(ADD_INCLUDES)

#-------------------------------- C Flags --------------------------------------

# Optimization Options
ifndef OPT_OPTS
OPT_OPTS = $(DEFAULT_OPT_OPTS)
endif

# General User Options
ifeq ($(DEBUG_BUILD),0)
DBG_FLAG =
else
#   Set OPTS=-g and any additional flags for debugging
DBG_FLAG = -g
LDFLAGS += -g
endif

# Defines
CPP_REQ_DEFINES = -DMODEL=$(MODEL) -DNUMST=$(NUMST) -DNCSTATES=$(NCSTATES) \
		  -DUNIX \
                  -DMAT_FILE=$(MAT_FILE) -DINTEGER_CODE=$(INTEGER_CODE) \
		  -DONESTEPFCN=$(ONESTEPFCN) -DTERMFCN=$(TERMFCN) \
		  -DHAVESTDIO -DMULTI_INSTANCE_CODE=$(MULTI_INSTANCE_CODE) \
		  -DCLASSIC_INTERFACE=$(CLASSIC_INTERFACE) \
		  -DALLOCATIONFCN=$(ALLOCATIONFCN)

ifeq ($(MODELREF_TARGET_TYPE),SIM)
ifneq ($(ENABLE_SLEXEC_SSBRIDGE), 0)
CPP_REQ_DEFINES += -DENABLE_SLEXEC_SSBRIDGE=$(ENABLE_SLEXEC_SSBRIDGE)
endif
else
CPP_REQ_DEFINES += -DMT=$(MULTITASKING)
endif

CPP_REQ_DEFINES += -DMODEL_HAS_DYNAMICALLY_LOADED_SFCNS=$(MODEL_HAS_DYNAMICALLY_LOADED_SFCNS)

ifneq ($(OPTIMIZATION_FLAGS),)
CC_OPTS = $(OPTS) $(COMPILE_FLAGS_OTHER) $(OPTIMIZATION_FLAGS)
else
CC_OPTS = $(OPTS) $(COMPILE_FLAGS_OTHER) $(OPT_OPTS)
endif

DEFINES = $(DEFINES_CUSTOM) $(CPP_REQ_DEFINES) $(DEFINES_OTHER)
CFLAGS = $(ANSI_OPTS) $(DBG_FLAG) $(CC_OPTS) $(DEFINES) $(INCLUDES)
CPPFLAGS = $(CPP_ANSI_OPTS) $(DBG_FLAG) $(CPP_OPTS) $(CC_OPTS) $(DEFINES) $(INCLUDES)

#-------------------------- Additional Libraries ------------------------------

SYSTEM_LIBS += -lm

LIBS =

ifeq ($(OPT_OPTS),$(DEFAULT_OPT_OPTS))
ifeq ($(INTEGER_CODE),0)
ifeq ($(MODELREF_TARGET_TYPE),SIM)
LIBS += $(MATLAB_ROOT)/toolbox/physmod/sm/ssci/lib/maci64/sm_ssci_rtwsfcn.a
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/sm/ssci/lib/maci64/sm_ssci_ert.a
endif
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/sm/ssci/lib/maci64/sm_ssci_int_ert.a
endif
else
LIBS += sm_ssci.a
endif

ifeq ($(OPT_OPTS),$(DEFAULT_OPT_OPTS))
ifeq ($(INTEGER_CODE),0)
ifeq ($(MODELREF_TARGET_TYPE),SIM)
LIBS += $(MATLAB_ROOT)/toolbox/physmod/sm/core/lib/maci64/sm_rtwsfcn.a
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/sm/core/lib/maci64/sm_ert.a
endif
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/sm/core/lib/maci64/sm_int_ert.a
endif
else
LIBS += sm.a
endif

ifeq ($(OPT_OPTS),$(DEFAULT_OPT_OPTS))
ifeq ($(INTEGER_CODE),0)
ifeq ($(MODELREF_TARGET_TYPE),SIM)
LIBS += $(MATLAB_ROOT)/toolbox/physmod/sm/math/lib/maci64/pm_math_rtwsfcn.a
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/sm/math/lib/maci64/pm_math_ert.a
endif
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/sm/math/lib/maci64/pm_math_int_ert.a
endif
else
LIBS += pm_math.a
endif

ifeq ($(OPT_OPTS),$(DEFAULT_OPT_OPTS))
ifeq ($(INTEGER_CODE),0)
ifeq ($(MODELREF_TARGET_TYPE),SIM)
LIBS += $(MATLAB_ROOT)/toolbox/physmod/simscape/engine/sli/lib/maci64/ssc_sli_rtwsfcn.a
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/simscape/engine/sli/lib/maci64/ssc_sli_ert.a
endif
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/simscape/engine/sli/lib/maci64/ssc_sli_int_ert.a
endif
else
LIBS += ssc_sli.a
endif

ifeq ($(OPT_OPTS),$(DEFAULT_OPT_OPTS))
ifeq ($(INTEGER_CODE),0)
ifeq ($(MODELREF_TARGET_TYPE),SIM)
LIBS += $(MATLAB_ROOT)/toolbox/physmod/simscape/engine/core/lib/maci64/ssc_core_rtwsfcn.a
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/simscape/engine/core/lib/maci64/ssc_core_ert.a
endif
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/simscape/engine/core/lib/maci64/ssc_core_int_ert.a
endif
else
LIBS += ssc_core.a
endif

ifeq ($(OPT_OPTS),$(DEFAULT_OPT_OPTS))
ifeq ($(INTEGER_CODE),0)
ifeq ($(MODELREF_TARGET_TYPE),SIM)
LIBS += $(MATLAB_ROOT)/toolbox/physmod/simscape/simtypes/core/lib/maci64/ssc_st_rtwsfcn.a
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/simscape/simtypes/core/lib/maci64/ssc_st_ert.a
endif
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/simscape/simtypes/core/lib/maci64/ssc_st_int_ert.a
endif
else
LIBS += ssc_st.a
endif

ifeq ($(OPT_OPTS),$(DEFAULT_OPT_OPTS))
ifeq ($(INTEGER_CODE),0)
ifeq ($(MODELREF_TARGET_TYPE),SIM)
LIBS += $(MATLAB_ROOT)/toolbox/physmod/common/math/core/lib/maci64/mc_rtwsfcn.a
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/common/math/core/lib/maci64/mc_ert.a
endif
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/common/math/core/lib/maci64/mc_int_ert.a
endif
else
LIBS += mc.a
endif

ifeq ($(OPT_OPTS),$(DEFAULT_OPT_OPTS))
ifeq ($(INTEGER_CODE),0)
ifeq ($(MODELREF_TARGET_TYPE),SIM)
LIBS += $(MATLAB_ROOT)/toolbox/physmod/common/external/library/lib/maci64/ex_rtwsfcn.a
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/common/external/library/lib/maci64/ex_ert.a
endif
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/common/external/library/lib/maci64/ex_int_ert.a
endif
else
LIBS += ex.a
endif

ifeq ($(OPT_OPTS),$(DEFAULT_OPT_OPTS))
ifeq ($(INTEGER_CODE),0)
ifeq ($(MODELREF_TARGET_TYPE),SIM)
LIBS += $(MATLAB_ROOT)/toolbox/physmod/common/foundation/core/lib/maci64/pm_rtwsfcn.a
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/common/foundation/core/lib/maci64/pm_ert.a
endif
else
LIBS += $(MATLAB_ROOT)/toolbox/physmod/common/foundation/core/lib/maci64/pm_int_ert.a
endif
else
LIBS += pm.a
endif
 
LIBS += $(S_FUNCTIONS_LIB) $(INSTRUMENT_LIBS)

#----------------------------- Source Files ------------------------------------
ADD_SRCS =

SRCS = $(ADD_SRCS) $(MODULES)

USER_SRCS =

USER_OBJS       = $(addsuffix .o, $(basename $(USER_SRCS)))
LOCAL_USER_OBJS = $(notdir $(USER_OBJS))

OBJS      = $(addsuffix .o, $(basename $(SRCS))) $(USER_OBJS)
LINK_OBJS = $(addsuffix .o, $(basename $(SRCS))) $(LOCAL_USER_OBJS)

ADDITIONAL_LDFLAGS += $(ARCH_SPECIFIC_LDFLAGS)

#--------------------------------- Rules ---------------------------------------
BIN_SETTING        = $(LD) $(LDFLAGS) $(ADDITIONAL_LDFLAGS) -o $(PRODUCT)
BUILD_PRODUCT_TYPE = "executable"
ifeq ($(MODELREF_TARGET_TYPE),NONE)
  ifeq ($(SHRLIBTARGET), 1)
    BIN_SETTING        = $(LD) $(ADDITIONAL_LDFLAGS) $(SHRLIBLDFLAGS)$(MODEL).def -o $(PRODUCT)
    BUILD_PRODUCT_TYPE = "shared object"	
    ifeq ($(GEN_SAMPLE_MAIN), 1)
      PRODUCT := $(notdir $(PRODUCT))
$(MODEL) : $(PRODUCT) ert_main.o
	$(LD) $(LDFLAGS) $(ADDITIONAL_LDFLAGS) -o $(MODEL) ert_main.o $(PRODUCT) $(SYSTEM_LIBS)
	@mv $(PRODUCT) $(RELATIVE_PATH_TO_ANCHOR)/
	@mv $(MODEL) $(RELATIVE_PATH_TO_ANCHOR)/
	@echo "### Created executable: $@"
    endif
  endif
  ifeq ($(MAKEFILEBUILDER_TGT), 1)
$(PRODUCT) : $(OBJS) $(LIBS) $(MODELLIB) $(MODELREF_LINK_LIBS)
	$(BIN_SETTING) $(LINK_OBJS) $(MODELLIB) $(MODELREF_LINK_LIBS_GROUP) $(LIBS)  $(SYSTEM_LIBS)
	@echo "### Created executable: $@"
  else
    ifeq ($(STANDALONE_SUPPRESS_EXE), 1)
.PHONY: $(PRODUCT)
$(PRODUCT) : $(OBJS) $(LIBS)
	@echo "### Created object modules: $@"
    else
$(PRODUCT) : $(OBJS) $(LIBS) $(MODELREF_LINK_LIBS)
	$(BIN_SETTING) $(LINK_OBJS) $(MODELREF_LINK_LIBS_GROUP) $(LIBS)  $(SYSTEM_LIBS)
	@echo "### Created $(BUILD_PRODUCT_TYPE): $@"
    endif
  endif
else
  $(PRODUCT) : $(OBJS)
	@rm -f $(MODELLIB)
	$(AR) ruvs $(MODELLIB) $(LINK_OBJS)
	@echo "### Created $(MODELLIB)"
	@echo "### Created library: $@"
endif

#-------------------------- Support for building modules ----------------------

%.o : %.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG) "$<"

%.o : %.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG) "$<"

%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG) "$<"

%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/sm/ssci/c/maci64/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/sm/core/c/maci64/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/sm/math/c/maci64/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/simscape/engine/sli/c/maci64/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/simscape/engine/core/c/maci64/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/simscape/compiler/core/c/maci64/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/simscape/ds/core/c/maci64/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/simscape/simtypes/core/c/maci64/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/common/math/core/c/maci64/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/common/logging/core/c/maci64/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/common/lang/core/c/maci64/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/common/external/library/c/maci64/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/common/foundation/core/c/maci64/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/simulink/src/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/rtiostreamtcpip/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

rt_logging_simtarget.o : $(MATLAB_ROOT)/rtw/c/src/rt_logging_simtarget.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) $(MATLAB_ROOT)/rtw/c/src/rt_logging_simtarget.c

raccel_main.o : $(MATLAB_ROOT)/rtw/c/raccel/raccel_main.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) $(MATLAB_ROOT)/rtw/c/raccel/raccel_main.c

raccel_sup.o : $(MATLAB_ROOT)/rtw/c/raccel/raccel_sup.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) $(MATLAB_ROOT)/rtw/c/raccel/raccel_sup.c

raccel_mat.o : $(MATLAB_ROOT)/rtw/c/raccel/raccel_mat.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) $(MATLAB_ROOT)/rtw/c/raccel/raccel_mat.c

simulink_solver_api.o : $(MATLAB_ROOT)/simulink/include/simulink_solver_api.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) $(MATLAB_ROOT)/simulink/include/simulink_solver_api.c

raccel_utils.o : $(MATLAB_ROOT)/rtw/c/src/rapid/raccel_utils.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) $(MATLAB_ROOT)/rtw/c/src/rapid/raccel_utils.c

common_utils.o : $(MATLAB_ROOT)/rtw/c/src/rapid/common_utils.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) $(MATLAB_ROOT)/rtw/c/src/rapid/common_utils.c

ext_svr.o : $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/ext_svr.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/ext_svr.c

updown.o : $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/updown.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/updown.c

ext_work.o : $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/ext_work.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/ext_work.c

rtiostream_interface.o : $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/rtiostream_interface.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/rtiostream_interface.c

rtiostream_tcpip.o : $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/rtiostreamtcpip/rtiostream_tcpip.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/rtiostreamtcpip/rtiostream_tcpip.c

rtiostream_utils.o : $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils/rtiostream_utils.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils/rtiostream_utils.c



%.o : $(MATLAB_ROOT)/toolbox/physmod/sm/ssci/c/maci64/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/sm/core/c/maci64/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/sm/math/c/maci64/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/simscape/engine/sli/c/maci64/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/simscape/engine/core/c/maci64/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/simscape/compiler/core/c/maci64/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/simscape/ds/core/c/maci64/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/simscape/simtypes/core/c/maci64/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/common/math/core/c/maci64/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/common/logging/core/c/maci64/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/common/lang/core/c/maci64/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/common/external/library/c/maci64/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/physmod/common/foundation/core/c/maci64/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/simulink/src/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/rtiostreamtcpip/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"



#------------------------------- Libraries -------------------------------------



MODULES_sm_ssci = \
    sm_ssci_3dd14f0a.o \
    sm_ssci_646478c5.o \
    sm_ssci_b2b6b422.o \
    sm_ssci_c16a187b.o \


sm_ssci.a : $(MAKEFILE) rtw_proj.tmw $(MODULES_sm_ssci)
	@echo "### Creating $@ "
	$(AR) rs $@ $(MODULES_sm_ssci)
	@echo "### $@ Created "

MODULES_sm = \
    sm_01d3ac26.o \
    sm_04d045b9.o \
    sm_09b59221.o \
    sm_0cb6a5fa.o \
    sm_1dba7276.o \
    sm_26df822b.o \
    sm_38d4abbe.o \
    sm_43618472.o \
    sm_440126a7.o \
    sm_45dc522c.o \
    sm_466cdd79.o \
    sm_4b066b5a.o \
    sm_4c61739a.o \
    sm_5763bdb7.o \
    sm_6166f1eb.o \
    sm_62d41fb5.o \
    sm_67d72683.o \
    sm_6fbd150d.o \
    sm_73d210b9.o \
    sm_73dfadcf.o \
    sm_7a6fe4d7.o \
    sm_916806b3.o \
    sm_95b82517.o \
    sm_9abcb56e.o \
    sm_a0028316.o \
    sm_a1d32671.o \
    sm_a264a430.o \
    sm_a3ba6de7.o \
    sm_a50cd7b1.o \
    sm_aa059a3a.o \
    sm_acba2496.o \
    sm_b40db855.o \
    sm_b66990f5.o \
    sm_badd8656.o \
    sm_bc63e36c.o \
    sm_bfda6e42.o \
    sm_c0ba649d.o \
    sm_c60cd1fd.o \
    sm_c7d3720c.o \
    sm_cabca465.o \
    sm_d3d79f0f.o \
    sm_d3d946fd.o \
    sm_d4bb3938.o \
    sm_d6dc1822.o \
    sm_da690167.o \
    sm_df66e89b.o \
    sm_e8bab6d7.o \
    sm_ec6029c9.o \
    sm_efdfa66e.o \
    sm_f3b314ce.o \


sm.a : $(MAKEFILE) rtw_proj.tmw $(MODULES_sm)
	@echo "### Creating $@ "
	$(AR) rs $@ $(MODULES_sm)
	@echo "### $@ Created "

MODULES_pm_math = \
    pm_math_01dec08e.o \
    pm_math_04d19358.o \
    pm_math_050e87e9.o \
    pm_math_1966ea7d.o \
    pm_math_1ad202b7.o \
    pm_math_1c69d5b2.o \
    pm_math_1c6b6a1b.o \
    pm_math_29dc7f63.o \
    pm_math_2a66252c.o \
    pm_math_32d9636d.o \
    pm_math_3309726a.o \
    pm_math_3463da5d.o \
    pm_math_360e4b46.o \
    pm_math_3fbf046b.o \
    pm_math_48b75553.o \
    pm_math_48bd51fb.o \
    pm_math_5a01dda4.o \
    pm_math_646fa971.o \
    pm_math_6b69e06e.o \
    pm_math_7565727c.o \
    pm_math_7cd5543c.o \
    pm_math_89df260e.o \
    pm_math_8cd61cd6.o \
    pm_math_8d05b7c0.o \
    pm_math_93014cb0.o \
    pm_math_a001e9ec.o \
    pm_math_b7b980b1.o \
    pm_math_bad43c87.o \
    pm_math_c7d2cd09.o \
    pm_math_d1be0f30.o \
    pm_math_d80b9e3b.o \
    pm_math_da630bd2.o \
    pm_math_e8b06b42.o \
    pm_math_ee02b2b3.o \
    pm_math_f760e8f6.o \
    pm_math_f866cdd2.o \
    pm_math_fd679a52.o \


pm_math.a : $(MAKEFILE) rtw_proj.tmw $(MODULES_pm_math)
	@echo "### Creating $@ "
	$(AR) rs $@ $(MODULES_pm_math)
	@echo "### $@ Created "

MODULES_ssc_sli = \
    ssc_sli_0267402d.o \
    ssc_sli_0763c151.o \
    ssc_sli_0bd269e6.o \
    ssc_sli_0d6d0780.o \
    ssc_sli_136b443c.o \
    ssc_sli_136f97a1.o \
    ssc_sli_140b3534.o \
    ssc_sli_15d5f6ce.o \
    ssc_sli_1c690f90.o \
    ssc_sli_1db813e8.o \
    ssc_sli_256cd4b6.o \
    ssc_sli_2bbd58a4.o \
    ssc_sli_2f6ea1cd.o \
    ssc_sli_360cfd63.o \
    ssc_sli_3fb4607e.o \
    ssc_sli_40d56d93.o \
    ssc_sli_42b14021.o \
    ssc_sli_43618287.o \
    ssc_sli_466b08dd.o \
    ssc_sli_496799bd.o \
    ssc_sli_4e028390.o \
    ssc_sli_51dbd3b5.o \
    ssc_sli_550a4805.o \
    ssc_sli_5a0cb974.o \
    ssc_sli_5d63aeeb.o \
    ssc_sli_62d81790.o \
    ssc_sli_77063d8b.o \
    ssc_sli_7a618260.o \
    ssc_sli_7f65db03.o \
    ssc_sli_880e593a.o \
    ssc_sli_89d0f30a.o \
    ssc_sli_8a64c4e2.o \
    ssc_sli_93019ea6.o \
    ssc_sli_9abcdb7f.o \
    ssc_sli_9b67747c.o \
    ssc_sli_9c030181.o \
    ssc_sli_c7dda239.o \
    ssc_sli_d064c978.o \
    ssc_sli_d80c44d2.o \
    ssc_sli_dcd66f69.o \
    ssc_sli_e66fe6d5.o \
    ssc_sli_e7b327bb.o \
    ssc_sli_eb0a5702.o \
    ssc_sli_edbee55c.o \
    ssc_sli_f6bd9cc8.o \
    ssc_sli_f9b5dbc5.o \
    ssc_sli_fa0ce53e.o \
    ssc_sli_fbdf29da.o \


ssc_sli.a : $(MAKEFILE) rtw_proj.tmw $(MODULES_ssc_sli)
	@echo "### Creating $@ "
	$(AR) rs $@ $(MODULES_ssc_sli)
	@echo "### $@ Created "

MODULES_ssc_core = \
    ssc_core_01dcc633.o \
    ssc_core_04da2c69.o \
    ssc_core_05058dd9.o \
    ssc_core_06ba68a6.o \
    ssc_core_09b5fa6e.o \
    ssc_core_0bd666aa.o \
    ssc_core_0d65be6c.o \
    ssc_core_0f019bd9.o \
    ssc_core_0f0420a6.o \
    ssc_core_18bf4d77.o \
    ssc_core_1b0cafd5.o \
    ssc_core_1c6b0332.o \
    ssc_core_1fd25120.o \
    ssc_core_24b4cdee.o \
    ssc_core_2568b075.o \
    ssc_core_280c0222.o \
    ssc_core_2cd54448.o \
    ssc_core_3169e4b7.o \
    ssc_core_32d8b307.o \
    ssc_core_3306c008.o \
    ssc_core_360a4baf.o \
    ssc_core_37d4ea84.o \
    ssc_core_40db642d.o \
    ssc_core_40dfdbdc.o \
    ssc_core_41017299.o \
    ssc_core_4666b45b.o \
    ssc_core_48b08af1.o \
    ssc_core_48b1386a.o \
    ssc_core_4965213d.o \
    ssc_core_4ad9135b.o \
    ssc_core_4db6bd68.o \
    ssc_core_4db86fcc.o \
    ssc_core_4e03e39d.o \
    ssc_core_4e04eecd.o \
    ssc_core_4e06e3bd.o \
    ssc_core_54d55ae9.o \
    ssc_core_5505224d.o \
    ssc_core_550b4c41.o \
    ssc_core_56b1a2bf.o \
    ssc_core_576cd129.o \
    ssc_core_59b034b8.o \
    ssc_core_5a046b27.o \
    ssc_core_5d6ba758.o \
    ssc_core_67d1f118.o \
    ssc_core_68da074b.o \
    ssc_core_6b663a17.o \
    ssc_core_6b6b89d2.o \
    ssc_core_6dd833f3.o \
    ssc_core_7209d3a5.o \
    ssc_core_73d9c2b7.o \
    ssc_core_76d825be.o \
    ssc_core_770cead7.o \
    ssc_core_79dd08ab.o \
    ssc_core_7a613edb.o \
    ssc_core_83db8762.o \
    ssc_core_856738f2.o \
    ssc_core_8569edc5.o \
    ssc_core_89d7fa79.o \
    ssc_core_8a6471dc.o \
    ssc_core_8cd9cb37.o \
    ssc_core_8d0064b8.o \
    ssc_core_96061071.o \
    ssc_core_97d767fe.o \
    ssc_core_990fe1a4.o \
    ssc_core_9b607b15.o \
    ssc_core_9b671e57.o \
    ssc_core_9c016445.o \
    ssc_core_9c01d168.o \
    ssc_core_9dd110ad.o \
    ssc_core_9fb0e229.o \
    ssc_core_9fb25b4f.o \
    ssc_core_9fb2e56c.o \
    ssc_core_a1d393be.o \
    ssc_core_a269ab09.o \
    ssc_core_a4d4c45e.o \
    ssc_core_a4da1d0a.o \
    ssc_core_a6b78ccc.o \
    ssc_core_a76299bc.o \
    ssc_core_a867d880.o \
    ssc_core_a9bbaecc.o \
    ssc_core_a9bf1ff2.o \
    ssc_core_aa09f23c.o \
    ssc_core_abd05c18.o \
    ssc_core_abd5e7b4.o \
    ssc_core_acb64294.o \
    ssc_core_acb6462e.o \
    ssc_core_b1038cbb.o \
    ssc_core_b10e34f4.o \
    ssc_core_b2b3b239.o \
    ssc_core_b369cd13.o \
    ssc_core_b402b40d.o \
    ssc_core_b7b88213.o \
    ssc_core_b96ebc21.o \
    ssc_core_bad68669.o \
    ssc_core_bc648043.o \
    ssc_core_bfdb08db.o \
    ssc_core_c3003040.o \
    ssc_core_c5b050d7.o \
    ssc_core_c5b63cb2.o \
    ssc_core_c607b660.o \
    ssc_core_c8d83e88.o \
    ssc_core_cab615c8.o \
    ssc_core_cabdc251.o \
    ssc_core_cc067f58.o \
    ssc_core_cc0bcab0.o \
    ssc_core_ce6a84bb.o \
    ssc_core_d06d763c.o \
    ssc_core_d3d34d7c.o \
    ssc_core_d4b9397b.o \
    ssc_core_d70a6a09.o \
    ssc_core_d807fa59.o \
    ssc_core_dcda6edd.o \
    ssc_core_deb7fd8d.o \
    ssc_core_e0d0866d.o \
    ssc_core_e2b61d72.o \
    ssc_core_e400c1c2.o \
    ssc_core_ead8f455.o \
    ssc_core_edb836de.o \
    ssc_core_ee000fbe.o \
    ssc_core_ee01086d.o \
    ssc_core_ee0f0141.o \
    ssc_core_f9b6dbed.o \
    ssc_core_fa09e9e6.o \
    ssc_core_fbd34e62.o \
    ssc_core_ff06d9a4.o \


ssc_core.a : $(MAKEFILE) rtw_proj.tmw $(MODULES_ssc_core)
	@echo "### Creating $@ "
	$(AR) rs $@ $(MODULES_ssc_core)
	@echo "### $@ Created "

MODULES_ssc_st = \
    ssc_st_7cd93bb6.o \
    ssc_st_da6cd8f8.o \


ssc_st.a : $(MAKEFILE) rtw_proj.tmw $(MODULES_ssc_st)
	@echo "### Creating $@ "
	$(AR) rs $@ $(MODULES_ssc_st)
	@echo "### $@ Created "

MODULES_mc = \
    mc_026e4f4b.o \
    mc_03b98f6f.o \
    mc_0764157d.o \
    mc_0bd30dee.o \
    mc_0d6fd085.o \
    mc_0ed73c49.o \
    mc_0edc34e3.o \
    mc_10d4ab75.o \
    mc_11086079.o \
    mc_110e6c6c.o \
    mc_1407e917.o \
    mc_140e3c4c.o \
    mc_15d12d95.o \
    mc_15d828ca.o \
    mc_220ba961.o \
    mc_2565d6e0.o \
    mc_2a642f54.o \
    mc_2a6a9b24.o \
    mc_2a6b417d.o \
    mc_2bbf87e3.o \
    mc_2cdc96b4.o \
    mc_32d501e3.o \
    mc_32dc008a.o \
    mc_3b6a945d.o \
    mc_3e66abdf.o \
    mc_4105189f.o \
    mc_47b8cebe.o \
    mc_47b91db1.o \
    mc_4b0301c6.o \
    mc_4c6117e3.o \
    mc_51d4094e.o \
    mc_52623861.o \
    mc_52688a58.o \
    mc_53b1fc84.o \
    mc_53b6fcf3.o \
    mc_550847c3.o \
    mc_5766048f.o \
    mc_59b6e413.o \
    mc_5bd2c9c1.o \
    mc_5d65cd86.o \
    mc_5edd42ef.o \
    mc_630208f8.o \
    mc_630dda0e.o \
    mc_67da200d.o \
    mc_67da4f41.o \
    mc_6b6d311a.o \
    mc_6e61d16c.o \
    mc_6fb1c336.o \
    mc_7207b6f4.o \
    mc_7809a65c.o \
    mc_7a613aec.o \
    mc_7bbf41f0.o \
    mc_7cd58f0b.o \
    mc_7cdbe436.o \
    mc_7d0547c8.o \
    mc_7d099de7.o \
    mc_7eb21b39.o \
    mc_81b0ada5.o \
    mc_81b5717e.o \
    mc_81bc7943.o \
    mc_870ec75e.o \
    mc_89d597cf.o \
    mc_90b6aa0a.o \
    mc_95b62b73.o \
    mc_9ab7d9b0.o \
    mc_9b6376d1.o \
    mc_9b6c1529.o \
    mc_a2647600.o \
    mc_a26bab1a.o \
    mc_a3b90582.o \
    mc_a6b5ed24.o \
    mc_a7684938.o \
    mc_a865d1dd.o \
    mc_acb3fad7.o \
    mc_af0bc203.o \
    mc_af0cc4c9.o \
    mc_b0de9cbc.o \
    mc_b2b86ae3.o \
    mc_b362c5eb.o \
    mc_b7b03d44.o \
    mc_b96a0bad.o \
    mc_bb0520ee.o \
    mc_bdbb9b78.o \
    mc_c2dbf4b2.o \
    mc_c8d25d23.o \
    mc_cab8a1f9.o \
    mc_ce6656ce.o \
    mc_d20085b7.o \
    mc_d9d38185.o \
    mc_dbbb14d2.o \
    mc_dcdddfae.o \
    mc_debb448f.o \
    mc_e7b99cf6.o \
    mc_e7bc2f1a.o \
    mc_e9661c4a.o \
    mc_e969ae87.o \
    mc_edbf543c.o \
    mc_ee000fbe.o \
    mc_efdea3a7.o \
    mc_f0012953.o \
    mc_f00d2f9b.o \
    mc_f3be157c.o \
    mc_fbd54145.o \
    mc_fcb15a9b.o \
    mc_fd619d14.o \
    mc_fd6341bb.o \


mc.a : $(MAKEFILE) rtw_proj.tmw $(MODULES_mc)
	@echo "### Creating $@ "
	$(AR) rs $@ $(MODULES_mc)
	@echo "### $@ Created "

MODULES_ex = \
    ex_04d5441d.o \
    ex_0d6d0784.o \
    ex_136645f8.o \
    ex_17bc61ac.o \
    ex_18b4440a.o \
    ex_1b03ca17.o \
    ex_2ebcd5b2.o \
    ex_316a81de.o \
    ex_36012fa7.o \
    ex_40d5be33.o \
    ex_47b11894.o \
    ex_57660158.o \
    ex_690b7cd0.o \
    ex_6dd8e72d.o \
    ex_770385e6.o \
    ex_79d100f1.o \
    ex_8a6fc761.o \
    ex_98d223a6.o \
    ex_aed5de1e.o \
    ex_b2b40ad5.o \
    ex_bb0efd4b.o \
    ex_bfdb009c.o \
    ex_c9069dae.o \
    ex_d9d686a8.o \
    ex_debffef2.o \
    ex_e40d74b8.o \
    ex_eb0d559b.o \
    ex_f6bb4c2d.o \
    ex_f866102d.o \
    slu_stubbed_definitions.o \


ex.a : $(MAKEFILE) rtw_proj.tmw $(MODULES_ex)
	@echo "### Creating $@ "
	$(AR) rs $@ $(MODULES_ex)
	@echo "### $@ Created "

MODULES_pm = \
    pm_09bc42e2.o \
    pm_14098e54.o \
    pm_26dc3230.o \
    pm_4fd5f5b9.o \
    pm_fed8c2c9.o \


pm.a : $(MAKEFILE) rtw_proj.tmw $(MODULES_pm)
	@echo "### Creating $@ "
	$(AR) rs $@ $(MODULES_pm)
	@echo "### $@ Created "



#----------------------------- Dependencies ------------------------------------

$(OBJS) : $(MAKEFILE) rtw_proj.tmw

