LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := spine_static

LOCAL_MODULE_FILENAME := libspine

LOCAL_ARM_MODE := arm

LOCAL_SRC_FILES := ../../../../prebuilt/android/$(TARGET_ARCH_ABI)/libspine.a

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../.. \
$(LOCAL_PATH)/../../..


include $(PREBUILT_STATIC_LIBRARY)
