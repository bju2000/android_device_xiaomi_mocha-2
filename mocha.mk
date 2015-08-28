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

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true	
	
# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# NVIDIA
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.nvidia.graphics.xml:system/etc/permissions/com.nvidia.graphics.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.nvsi.xml:system/etc/permissions/com.nvidia.nvsi.xml \
    $(LOCAL_PATH)/permissions/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    $(LOCAL_PATH)/permissions/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.miracast.xml:system/etc/permissions/com.nvidia.miracast.xml

# idc
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/idc/touch.idc:system/usr/idc/touch.idc \
  $(LOCAL_PATH)/idc/touch_fusion.idc:system/usr/idc/touch_fusion.idc \
  $(LOCAL_PATH)/idc/sensor00fn11.idc:system/usr/idc/sensor00fn11.idc


# keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/keylayout/tegra-rt5671_headphone_detect.kl:system/usr/keylayout/tegra-rt5671_headphone_detect.kl \
    $(LOCAL_PATH)/keylayout/atmel-maxtouch.kl:system/usr/keylayout/atmel-maxtouch.kl \
    $(LOCAL_PATH)/keylayout/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/Vendor_0955_Product_7210.kl:system/usr/keylayout/Vendor_0955_Product_7210.kl

# Media config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audioConfig_qvoice_icera_pc400.xml:system/etc/audioConfig_qvoice_icera_pc400.xml \
    $(LOCAL_PATH)/audio/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    $(LOCAL_PATH)/audio/nvaudio_fx.xml:system/etc/nvaudio_fx.xml

ifeq ($(BOARD_USES_STOCK_POLICY),)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_stock.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/audio_policy.tegra.so:system/lib/hw/audio_policy.tegra.so
else
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf
endif

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    libaudio-resampler \
    tinycap \
    tinymix \
    tinyplay \
    xaplay	

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=1417730315
PRODUCT_NAME := full_mocha
PRODUCT_DEVICE := mocha

$(call inherit-product, device/xiaomi/mocha/device.mk)
