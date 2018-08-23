LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := creator_static

LOCAL_MODULE_FILENAME := libcreator

LOCAL_SRC_FILES := ../../../../prebuilt/android/$(TARGET_ARCH_ABI)/libcreator.a

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../.. \
$(LOCAL_PATH)/../../.. \
$(LOCAL_PATH)/../../../../external/sources


include $(PREBUILT_STATIC_LIBRARY)
