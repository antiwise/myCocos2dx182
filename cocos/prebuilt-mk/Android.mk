LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# cis is short name for cocos2dx_internal_static
# Shorter name could avoid compilation errors on Windows system which has a limitation of 260 bytes for build path.
LOCAL_MODULE := cis
LOCAL_MODULE_FILENAME := libcocos2dxinternal

LOCAL_ARM_MODE := arm

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
MATHNEONFILE := math/MathUtil.cpp.neon
else
MATHNEONFILE := math/MathUtil.cpp
endif

LOCAL_SRC_FILES := ../../prebuilt/android/$(TARGET_ARCH_ABI)/libcocos2dxinternal.a

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/.. \
$(LOCAL_PATH)/../.. \
$(LOCAL_PATH)/../platform \
$(LOCAL_PATH)/../base \
$(LOCAL_PATH)/../../external/android/$(TARGET_ARCH_ABI)/include \
$(LOCAL_PATH)/../../external/sources

LOCAL_EXPORT_LDLIBS := -lGLESv2 \
                       -llog \
                       -landroid

LOCAL_WHOLE_STATIC_LIBRARIES := cocos_freetype2_static
LOCAL_WHOLE_STATIC_LIBRARIES += spine_static
LOCAL_WHOLE_STATIC_LIBRARIES += creator_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocos_png_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocos_jpeg_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocos_tiff_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocos_webp_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocos_chipmunk_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocos_zlib_static

LOCAL_WHOLE_STATIC_LIBRARIES += cocos2dxandroid_static
LOCAL_WHOLE_STATIC_LIBRARIES += cpufeatures

# define the macro to compile through support/zip_support/ioapi.c
LOCAL_CFLAGS := -DUSE_FILE32API -fexceptions

# Issues #9968
#ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
#    LOCAL_CFLAGS += -DHAVE_NEON=1
#endif

LOCAL_CPPFLAGS := -Wno-deprecated-declarations
LOCAL_EXPORT_CFLAGS   := -DUSE_FILE32API
LOCAL_EXPORT_CPPFLAGS := -Wno-deprecated-declarations

include $(PREBUILT_STATIC_LIBRARY)

#==============================================================
include $(CLEAR_VARS)

LOCAL_MODULE := cocos2dx_static
LOCAL_MODULE_FILENAME := libcocos2d
LOCAL_SRC_FILES := ../../prebuilt/android/$(TARGET_ARCH_ABI)/libcocos2d.a

LOCAL_WHOLE_STATIC_LIBRARIES := audioengine_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocos_network_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocos_ui_static
LOCAL_WHOLE_STATIC_LIBRARIES += spine_static
LOCAL_WHOLE_STATIC_LIBRARIES += dragonbones_static
LOCAL_WHOLE_STATIC_LIBRARIES += creator_static
LOCAL_WHOLE_STATIC_LIBRARIES += cis

include $(PREBUILT_STATIC_LIBRARY)

#==============================================================
#$(call import-module,.)
$(call import-module,android)
# $(call import-module,editor-support/cocostudio)
# $(call import-module,editor-support/cocosbuilder)
$(call import-module, editor-support/dragonbones/proj.android/prebuilt-mk)
$(call import-module, editor-support/spine/prebuilt-mk)
$(call import-module, editor-support/creator/prebuilt-mk)
$(call import-module, platform/android/prebuilt-mk)
$(call import-module, audio/android/prebuilt-mk)
$(call import-module, network/prebuilt-mk)
$(call import-module, ui/prebuilt-mk)
$(call import-module, extensions/prebuilt-mk)
$(call import-module,android/cpufeatures)
