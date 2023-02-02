# sync rom
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 13 -g default,-mips,-darwin,-notdefault
git clone git@github.com:Mocaness/local_manifests.git -b 4.4-13 lm
rm -rf .repo/local_manifests
cp -r lm/local_manifests .repo/
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
bash $CIRRUS_WORKING_DIR/script/pickme.sh

# build rom
source $CIRRUS_WORKING_DIR/script/config
timeStart

. build/envsetup.sh
lunch derp_whyred-userdebug
mkfifo reading
tee "${BUILDLOG}" < reading &
build_message "Building Started"
progress &
mka derp -j16  > reading & sleep 95m

retVal=$?
timeEnd
statusBuild
# end
