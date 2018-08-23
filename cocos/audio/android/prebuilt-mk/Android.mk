LOCAL_PATH := $(call my-dir)

#New AudioEngine
include $(CLEAR_VARS)

LOCAL_MODULE := audioengine_static

LOCAL_MODULE_FILENAME := libaudioengine

LOCAL_SRC_FILES := ../../../../prebuilt/android/$(TARGET_ARCH_ABI)/libaudioengine.a


LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../include

LOCAL_EXPORT_LDLIBS := -lOpenSLES


LOCAL_WHOLE_STATIC_LIBRARIES += libvorbisidec libpvmp3dec
include $(PREBUILT_STATIC_LIBRARY)

$(call import-module,sources/tremolo)
$(call import-module,sources/pvmp3dec)
