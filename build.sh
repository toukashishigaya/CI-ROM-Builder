# sync rom
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 13 -g default,-mips,-darwin,-notdefault
rm -rf lm
git clone git@github.com:Mocaness/local_manifests.git -b 4.4-13 lm
rm -rf .repo/local_manifests
cp -r lm/local_manifests .repo/
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
bash $CIRRUS_WORKING_DIR/script/pickme.sh

# build rom
curl -Lo barom.sh https://raw.githubusercontent.com/alanndz/barom/main/barom.sh
chmod +x barom.sh
./barom.sh -t ${TG_CHAT_ID} ${TG_TOKEN}
./barom.sh --ccache-dir "${WORKDIR}/ccache" --ccache-size 15G
export Iyakah=ya
./barom.sh --device whyred --lunch derp_whyred-userdebug
./barom.sh -b -j 8 -u gof --timer 95m -- m derp

# end
