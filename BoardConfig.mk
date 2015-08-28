USE_CAMERA_STUB := true

# inherit from the proprietary version
include device/xiaomi/mocha/BoardConfigCommon.mk

DEVICE_RESOLUTION := 1536x2048

# Arch
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := tegra
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := mocha

# CMD Lines
BOARD_KERNEL_CMDLINE := "androidboot.selinux=permissive"
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520 
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 671088640
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13742637056
BOARD_FLASH_BLOCK_SIZE := 131072

# Kernel
TARGET_PREBUILT_KERNEL := device/xiaomi/mocha/kernel
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --dt device/xiaomi/mocha/dt.img --tags_offset 0x00000100
BOARD_KERNEL_SEPARATED_DT := true

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true

# Selinux
BOARD_SEPOLICY_DIRS += device/xiaomi/mocha/sepolicy
BOARD_SEPOLICY_UNION += \
	te_macros \
	agpsd.te \
	app.te \
	bluetooth.te \
	bootanim.te \
	cvc.te \
	device.te \
	domain.te \
	drmserver.te \
	fild.te \
	file_contexts \
	file.te \
	genfs_contexts \
	gpload.te \
	gpsd.te \
	healthd.te\
	hostapd.te \
	icera-crashlogs.te \
	icera-feedback.te \
	icera-loader.te \
	icera-switcherd.te \
	init.te \
	installd.te \
	mediaserver.te \
	mock_modem.te \
	netd.te \
	platform_app.te \
	property_contexts \
	property.te \
	raydium.te \
	recovery.te \
	service.te \
	service_contexts \
	set_hwui.te \
	shell.te \
	surfaceflinger.te \
	system_app.te \
	system_server.te \
	tee.te \
	ueventd.te \
	untrusted_app.te \
	usb.te \
	ussrd.te \
	ussr_setup.te \
	vold.te \
	wifi_loader.te \
	wpa.te \
	zygote.te