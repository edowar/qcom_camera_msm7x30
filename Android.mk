ifeq ($(BOARD_USES_QCOM_HARDWARE),true)

LOCAL_PATH := $(call my-dir)
MY_PATH := $(LOCAL_PATH)
include $(call all-subdir-makefiles)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS := -g -fPIC
LOCAL_PATH := $(MY_PATH)
LOCAL_LDLIBS := -llog -ldl
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE    := camera.$(TARGET_BOARD_PLATFORM)
LOCAL_SRC_FILES := QualcommCameraHardware.cpp
LOCAL_PRELINK_MODULE := false
LOCAL_SHARED_LIBRARIES:= libutils libui libcamera_client liblog libcutils libmmjpeg
LOCAL_SHARED_LIBRARIES+= libgenlock libbinder
LOCAL_SHARED_LIBRARIES+= liboemcamera
LOCAL_SHARED_LIBRARIES+= libdl

LOCAL_CFLAGS+= -DNUM_PREVIEW_BUFFERS=4 -D_ANDROID_

LOCAL_C_INCLUDES += frameworks/base/services/camera/libcameraservice
LOCAL_C_INCLUDES += hardware/qcom/display/libgralloc
LOCAL_C_INCLUDES += hardware/qcom/display/libgenlock
LOCAL_C_INCLUDES += hardware/qcom/media/libstagefrighthw

include $(BUILD_SHARED_LIBRARY)

endif
