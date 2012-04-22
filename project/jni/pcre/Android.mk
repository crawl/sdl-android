#
#  Android makefile for libpcre
#
#  This makefile generates libpcre.so, pcregrep and pcre.h ONLY.
#  It should be amended to build libpcreposix.so, libpcrecpp.so
#  and tests.


LOCAL_PATH := $(call my-dir)

###
### Build libpcre.so and pcre.h
###

include $(CLEAR_VARS)

LOCAL_MODULE := libpcre
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PRELINK_MODULE := false

#intermediates := $(call local-intermediates-dir)

LOCAL_SRC_FILES:= \
	pcre_byte_order.c pcre_compile.c \
	pcre_config.c pcre_dfa_exec.c pcre_exec.c pcre_fullinfo.c \
	pcre_get.c pcre_globals.c pcre_jit_compile.c \
	pcre_maketables.c pcre_newline.c pcre_ord2utf8.c \
	pcre_refcount.c pcre_string_utils.c pcre_study.c pcre_tables.c \
	pcre_ucd.c pcre_valid_utf8.c pcre_version.c pcre_xclass.c \
	pcre_chartables.c

LOCAL_CFLAGS += -O3 -I. -DHAVE_CONFIG_H
LOCAL_CPP_EXTENSION := .cc

LOCAL_COPY_HEADERS := pcre.h

include $(BUILD_SHARED_LIBRARY)

###
### Build pcregrep
###

include $(CLEAR_VARS)

LOCAL_MODULE := pcregrep
LOCAL_SRC_FILES := pcregrep.c
LOCAL_CFLAGS += -O3 -I. -DHAVE_CONFIG_H
LOCAL_SHARED_LIBRARIES := libpcre

include $(BUILD_EXECUTABLE)
