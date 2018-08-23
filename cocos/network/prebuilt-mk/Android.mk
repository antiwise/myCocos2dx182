LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := cocos_network_static

LOCAL_MODULE_FILENAME := libnetwork

LOCAL_ARM_MODE := arm

LOCAL_SRC_FILES := ../../../prebuilt/android/$(TARGET_ARCH_ABI)/libnetwork.a

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/.. \
$(LOCAL_PATH)/../.. \
$(LOCAL_PATH)/../../../external/sources


LOCAL_WHOLE_STATIC_LIBRARIES += libwebsockets_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocos_ssl_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocos_crypto_static

include $(PREBUILT_STATIC_LIBRARY)
