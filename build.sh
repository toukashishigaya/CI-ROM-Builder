# sync rom
repo init --depth=1 --no-repo-verify -u ssh://git@github.com/keepQASSA/manifest -b Q -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
git clone --depth=1 ssh://git@github.com/Mocaness/device_xiaomi_mido -b qassa-4.9 device/xiaomi/mido
git clone --depth=1 ssh://git@github.com/Mocaness/device_xiaomi_mido-kernel -b 10 device/xiaomi/mido-kernel
git clone --depth=1 ssh://git@github.com/Mocaness/MidoKernel -b kizuna-17.1-C17 kernel/xiaomi/mido
git clone --depth=1 ssh://git@github.com/Mocaness/vendor_xiaomi_mido -b qassa-4.9 vendor/xiaomi

# build rom
source $CIRRUS_WORKING_DIR/script/config
timeStart

. build/envsetup.sh
lunch mido-userdebug
mkfifo reading
tee "${BUILDLOG}" < reading &
build_message "Building Started"
progress &
mka qassa -j16  > reading & sleep 95m

retVal=$?
timeEnd
statusBuild
# end
