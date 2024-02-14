#
# Copyright (C) 2024 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/nokia/BGT

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Board Info
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := lito

# Display
TARGET_SCREEN_DENSITY := 400
TARGET_NO_RAW10_CUSTOM_FORMAT := true

# DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Kernel
BOARD_KERNEL_CMDLINE := \
    console=ttyMSM0,115200,n8 \
    androidboot.hardware=qcom \
    androidboot.fstab_suffix=qcom \
    androidboot.console=ttyMSM0 \
    androidboot.memcg=1 \
    lpm_levels.sleep_disabled=1 \
    video=vfb:640x400,bpp=32,memsize=3072000 \
    msm_rtb.filter=0x237 \
    service_locator.enable=1 \
    androidboot.usbcontroller=a600000.dwc3 \
    swiotlb=2048 \
    cgroup.memory=nokmem,nosocket \
    loop.max_part=7

# TODO: Temp set, remove when complete selinux.
BOARD_KERNEL_CMDLINE += \
    androidboot.init_fatal_reboot_target=recovery \
    androidboot.selinux=permissive

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_RAMDISK_USE_LZ4 := true

# Kernel build
KERNEL_DEFCONFIG := groot_defconfig
TARGET_KERNEL_VERSION := 4.19
TARGET_USES_UNCOMPRESSED_KERNEL := true

# Hacks
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_ENFORCE_SYSPROP_OWNER := true

# Partitions
# Dynamic
BOARD_SUPER_PARTITION_SIZE := 12884901888
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product odm vendor
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 6438256640

# Filesystems
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Paths
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# Size
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_USERDATAIMAGE_PARTITION_SIZE := 41856847872

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 110
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch level
VENDOR_SECURITY_PATCH := 2023-11-01

# Vendor
include vendor/nokia/BGT/BoardConfigVendor.mk

# Vintf
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/configs/vintf/nokia_vendor_framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/configs/vintf/manifest.xml \
    $(DEVICE_PATH)/configs/vintf/manifest-generic.xml \
    $(DEVICE_PATH)/configs/vintf/manifest-qva.xml \
    $(DEVICE_PATH)/configs/vintf/nokia_manifest.xml

# Prebuilt-Kernel
include device/nokia/BGT-kernel/BoardConfigKernel.mk
