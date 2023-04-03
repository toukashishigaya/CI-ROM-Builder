# sync rom
repo init -u ssh://git@github.com/keepQASSA/manifest -b Q -g default,-mips,-darwin,-notdefault
rm -rf lm
git clone git@github.com:Mocaness/local_manifests.git -b qassa-whyred lm
rm -rf .repo/local_manifests
cp -r lm/local_manifests .repo/
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16

# build rom
curl -Lo barom.sh https://raw.githubusercontent.com/toukashishigaya/barom/main/barom.sh
chmod +x barom.sh
./barom.sh -t ${TG_CHAT_ID} ${TG_TOKEN}
./barom.sh --ccache-dir "${WORKDIR}/ccache" --ccache-size 15G
./barom.sh --device whyred --lunch qassa_whyred-userdebug
./barom.sh -b -j 2 -u gof --timer 82m -- m qassa

# end
