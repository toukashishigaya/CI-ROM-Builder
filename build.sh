# sync rom
repo init  --depth=1 --no-repo-verify -u https://github.com/DerpFest-AOSP/manifest.git -b 13 -g default,-mips,-darwin,-notdefault
rm -rf lm
git clone git@github.com:Mocaness/local_manifests.git -b 4.19-13 lm
rm -rf .repo/local_manifests
cp -r lm/local_manifests .repo/
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16

# build rom
curl -Lo barom.sh https://github.com/alanndz/barom/raw/5828209f862ce2648c54ec3c7c5ba4fed11024cb/barom.sh
chmod +x barom.sh
./barom.sh -t ${TG_CHAT_ID} ${TG_TOKEN}
./barom.sh --ccache-dir "${WORKDIR}/ccache" --ccache-size 15G
./barom.sh -n DerpFest --device whyred --lunch derp_whyred-userdebug
#./barom.sh -b -j 8 -u gof --timer 95m -- m derp
./barom.sh -b -j 8 --timer 95m -- m recoveryimage
./barom.sh --sft out/target/product/whyred/recovery.img

# end
