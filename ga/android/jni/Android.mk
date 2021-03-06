
LOCAL_PATH := $(call my-dir)

TARGET_PLATFORM := android-14
TARGET_ARCH_ABI := armeabi-v7a

include jni/Android.prebuilt

include $(CLEAR_VARS)
LOCAL_MODULE := gaclient
LOCAL_ARM_MODE := arm
LOCAL_ARM_NEON := true
LOCAL_CFLAGS := -Wno-psabi -DANDROID -D__STDC_CONSTANT_MACROS -DGL_GLEXT_PROTOTYPES #-DANDROID_NO_FFMPEG
#-D__STDINT_LIMITS
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include $(LOCAL_PATH)/include/live555
LOCAL_SRC_FILES := src/ga-common.cpp src/ga-conf.cpp src/ga-confvar.cpp \
		   src/ga-avcodec.cpp src/pipeline.cpp \
		   src/rtspconf.cpp src/controller.cpp src/ctrl-sdl.cpp \
		   src/libgaclient.cpp src/rtspclient.cpp \
		   src/minih264.cpp src/minivp8.cpp \
		   src/android-decoders.cpp
# The order matters ...
LOCAL_STATIC_LIBRARIES := \
		liveMedia BasicUsageEnvironment UsageEnvironment groupsock \
		swscale swresample postproc avdevice avfilter avformat avcodec avutil \
		theora theoradec theoraenc vpx
LOCAL_SHARED_LIBRARIES := mp3lame opus ogg vorbis vorbisenc vorbisfile x264
LOCAL_LDLIBS := -llog -lz -lGLESv1_CM 
include $(BUILD_SHARED_LIBRARY)
