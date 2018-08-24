LOCAL_PATH := $(call my-dir)

# --- bugly: 引用 libBugly.so ---
include $(CLEAR_VARS)
LOCAL_MODULE := bugly_native_prebuilt
LOCAL_SRC_FILES := prebuilt/$(TARGET_ARCH_ABI)/libBugly.so
include $(PREBUILT_SHARED_LIBRARY)
# --- bugly: end ---

LOCAL_MODULE := cocos2djs_shared

LOCAL_MODULE_FILENAME := libcocos2djs

ifeq ($(USE_ARM_MODE),1)
LOCAL_ARM_MODE := arm
endif

# --- bugly: 增加cpp扩展名mm
LOCAL_CPP_EXTENSION := .mm .cpp .cc
LOCAL_CFLAGS += -x c++

LOCAL_SRC_FILES := \
../../Classes/AppDelegate.cpp \
../../Classes/jsb_module_register.cpp \
hellojavascript/main.cpp \
../../Classes/bugly/CrashReport.mm \

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Classes

ifeq ($(USE_ANY_SDK),1)
LOCAL_SRC_FILES += ../../Classes/anysdk/SDKManager.cpp \
	../../Classes/anysdk/jsb_anysdk_basic_conversions.cpp \
	../../Classes/anysdk/manualanysdkbindings.cpp \
	../../Classes/anysdk/jsb_anysdk_protocols_auto.cpp

LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Classes/anysdk

LOCAL_WHOLE_STATIC_LIBRARIES := PluginProtocolStatic
endif


LOCAL_STATIC_LIBRARIES := cocos2d_js_static

include $(BUILD_SHARED_LIBRARY)


$(call import-module,scripting/js-bindings/proj.android/prebuilt-mk)
