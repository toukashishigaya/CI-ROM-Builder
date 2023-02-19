# sync rom
repo init --depth=1 --no-repo-verify -u ssh://git@github.com/keepQASSA/manifest -b Q -g default,-mips,-darwin,-notdefault
rm -rf lm
git clone git@github.com:Mocaness/local_manifests.git -b qassa-mido-318 lm
rm -rf .repo/local_manifests
cp -r lm/local_manifests .repo/
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16

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
