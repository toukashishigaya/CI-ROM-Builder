# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/LineageOS/android.git -b lineage-17.1 -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
git clone --depth=1 https://github.com/LineageOS/android_device_xiaomi_whyred -b lineage-17.1 device/xiaomi/whyred
git clone --depth=1 https://github.com/LineageOS/android_device_xiaomi_sdm660-common -b lineage-17.1 device/xiaomi/sdm660-common
git clone --depth=1 https://github.com/LineageOS/android_kernel_xiaomi_sdm660 -b lineage-17.1 kernel/xiaomi/sdm660
git clone --depth=1 https://gitlab.com/the-muppets/proprietary_vendor_xiaomi -b lineage-17.1 vendor/xiaomi

# build rom
source $CIRRUS_WORKING_DIR/script/config
timeStart

. build/envsetup.sh
lunch lineage_whyred-userdebug
mkfifo reading
tee "${BUILDLOG}" < reading &
build_message "Building Started"
progress &
mka bacon -j16  > reading & sleep 95m

retVal=$?
timeEnd
statusBuild
# end
