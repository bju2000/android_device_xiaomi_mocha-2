$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

#$(call inherit-product-if-exists, vendor/xiaomi/mocha/mocha-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/xiaomi/mocha/overlay

#LOCAL_PATH := device/xiaomi/mocha
#ifeq ($(TARGET_PREBUILT_KERNEL),)
#	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
#else
#	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
#endif

#PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel

$(call inherit-product,  $(SRC_TARGET_DIR)/product/full_base.mk)

# Ramdisk
PRODUCT_PACKAGES += \
    init.none.rc \
    fstab.mocha \
    init.mocha.rc \
    init.t124_emmc.rc \
    init.t124_sata.rc \
    init.cal.rc \
    init.hdcp.rc \
    init.t124.rc \
    init.tlk.rc \
    init.nv_dev_board.usb.rc \
    power.mocha.rc \
    ueventd.mocha.rc

PRODUCT_COPY_FILES += \
    device/xiaomi/mocha/rootdir/etc/init:root/init \
    device/xiaomi/mocha/rootdir/etc/init.rc:root/init.rc \
    device/xiaomi/mocha/rootdir/sbin/healthd:root/sbin/healthd \
    device/xiaomi/mocha/rootdir/sbin/chargeonlymode:root/sbin/chargeonlymode \
    device/xiaomi/mocha/rootdir/sbin/mdbd:root/sbin/mdbd	

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=1417730315
PRODUCT_NAME := full_mocha
PRODUCT_DEVICE := mocha

$(call inherit-product, device/xiaomi/mocha/device.mk)
