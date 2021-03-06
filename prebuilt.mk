add-prebuilt-app: $(ZIP_DIR)/system/xbin/busybox
	@echo To add prebuilt apps
	$(hide) cp -f $(SYSOUT_DIR)/xbin/invoke-as $(ZIP_DIR)/system/xbin/

$(ZIP_DIR)/system/xbin/busybox:
	$(hide) cp -f $(SYSOUT_DIR)/xbin/busybox $(ZIP_DIR)/system/xbin/

add-prebuilt-libraries:
	@echo To add prebuilt libraries
	$(hide) cp -f $(SYSOUT_DIR)/lib/content-types.properties $(ZIP_DIR)/system/lib/
	$(hide) cp -f $(SYSOUT_DIR)/lib/libffmpeg.so $(ZIP_DIR)/system/lib/
	$(hide) cp -f $(SYSOUT_DIR)/lib/libffplayer_jni.so $(ZIP_DIR)/system/lib/
	$(hide) cp -f $(SYSOUT_DIR)/framework/miui-framework.jar $(ZIP_DIR)/system/framework/

add-prebuilt-media:
	@echo To add prebuilt media files
	$(hide) cp -rf $(SYSOUT_DIR)/media $(ZIP_DIR)/system

add-prebuilt-etc-files:
	@echo To add prebuilt files under etc
	$(hide) cp -f $(SYSOUT_DIR)/etc/apns-conf.xml $(ZIP_DIR)/system/etc/
	$(hide) cp -rf $(SYSOUT_DIR)/etc/license/ $(ZIP_DIR)/system/etc/
	$(hide) cp -f $(SYSOUT_DIR)/etc/telocation.db $(ZIP_DIR)/system/etc/
	$(hide) cp -f $(SYSOUT_DIR)/etc/yellowpage.db $(ZIP_DIR)/system/etc/
	$(hide) cp -f $(SYSOUT_DIR)/etc/permissions/miui-framework.xml $(ZIP_DIR)/system/etc/permissions/

add-lbesec-miui:
	@echo To add LBESEC_MIUI
	$(hide) cp -f $(SYSOUT_DIR)/lib/liblbesec.so $(ZIP_DIR)/system/lib/
	$(hide) cp -f $(SYSOUT_DIR)/bin/installd $(ZIP_DIR)/system/bin
	$(hide) cp -f $(SYSOUT_DIR)/app/LBESEC_MIUI.apk $(ZIP_DIR)/system/app
	$(hide) cp -f $(SYSOUT_DIR)/xbin/su $(ZIP_DIR)/system/xbin/

add-skia-emoji:
	@echo To add Skia Emoji support
	$(hide) cp -f $(SYSOUT_DIR)/lib/libskia.so $(ZIP_DIR)/sysem/lib
	$(hide) cp -f $(SYSOUT_DIR)/lib/libhwui.so $(ZIP_DIR)/system/lib

release-prebuilt-app:
	@echo Release prebuilt apps
	$(hide) mkdir -p $(RELEASE_PATH)/system/xbin
	$(hide) cp $(SYSOUT_DIR)/xbin/invoke-as $(RELEASE_PATH)/system/xbin/
	$(hide) cp $(SYSOUT_DIR)/xbin/busybox $(RELEASE_PATH)/system/xbin/
	$(hide) mkdir -p $(RELEASE_PATH)/system/bin
	$(hide) cp $(SYSOUT_DIR)/bin/installd $(RELEASE_PATH)/system/bin/
	$(hide) cp -f $(SYSOUT_DIR)/app/LBESEC_MIUI.apk $(RELEASE_PATH)/system/app
	$(hide) cp -f $(SYSOUT_DIR)/xbin/su $(RELEASE_PATH)/system/xbin/

release-prebuilt-libraries:
	@echo Release prebuilt libraries
	$(hide) mkdir -p $(RELEASE_PATH)/system/lib
	$(hide) cp -f $(SYSOUT_DIR)/lib/liblbesec.so $(RELEASE_PATH)/system/lib/
	$(hide) cp -f $(SYSOUT_DIR)/lib/libskia.so $(RELEASE_PATH)/system/lib/
	$(hide) cp -f $(SYSOUT_DIR)/lib/libhwui.so $(RELEASE_PATH)/system/lib/
	$(hide) cp -f $(SYSOUT_DIR)/lib/content-types.properties $(RELEASE_PATH)/system/lib/
	$(hide) cp -f $(SYSOUT_DIR)/lib/libffmpeg.so $(RELEASE_PATH)/system/lib/
	$(hide) cp -f $(SYSOUT_DIR)/lib/libffplayer_jni.so $(RELEASE_PATH)/system/lib/
	$(hide) cp -f $(SYSOUT_DIR)/framework/miui-framework.jar $(RELEASE_PATH)/system/framework/

release-prebuilt-media:
	@echo Release prebuilt media files
	$(hide) mkdir -p $(RELEASE_PATH)/system/media
	$(hide) cp -rf $(SYSOUT_DIR)/media $(RELEASE_PATH)/system

release-prebuilt-etc-files:
	@echo Release prebuilt etc-files
	$(hide) mkdir -p $(RELEASE_PATH)/system/etc
	$(hide) cp -rf $(SYSOUT_DIR)/etc/apns-conf.xml $(RELEASE_PATH)/system/etc/
	$(hide) cp -rf $(SYSOUT_DIR)/etc/license/ $(RELEASE_PATH)/system/etc/
	$(hide) cp -rf $(SYSOUT_DIR)/etc/telocation.db $(RELEASE_PATH)/system/etc/
	$(hide) cp -rf $(SYSOUT_DIR)/etc/yellowpage.db $(RELEASE_PATH)/system/etc/
	$(hide) cp -rf $(SYSOUT_DIR)/etc/permissions/miui-framework.xml $(RELEASE_PATH)/system/etc/permissions/

release-miui-resources:
	@echo release miui resources
	$(hide) mkdir -p $(RELEASE_PATH)/src/frameworks/miui
	$(hide) cp -r $(ANDROID_TOP)/frameworks/miui/overlay $(RELEASE_PATH)/src/frameworks/miui
	$(hide) mkdir -p $(RELEASE_PATH)/src/frameworks/miui/core/res
	$(hide) cp -r $(ANDROID_TOP)/frameworks/miui/core/res/res $(RELEASE_PATH)/src/frameworks/miui/core/res
	$(hide) cd $(ANDROID_TOP); tar -cf $(RELEASE_PATH)/src/res.tar packages/apps/*/res
	$(hide) cd $(RELEASE_PATH)/src;tar -xf res.tar;rm res.tar

add-miui-prebuilt: add-prebuilt-app add-prebuilt-libraries add-prebuilt-media add-prebuilt-etc-files add-lbesec-miui
	@echo Add miui prebuilt completed!

release-miui-prebuilt: release-prebuilt-app release-prebuilt-libraries release-prebuilt-media release-prebuilt-etc-files release-miui-resources
	@echo Release MIUI prebuilt completed!
