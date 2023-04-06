# sync rom
repo init --depth=1 --no-repo-verify -u  https://github.com/BiancaProject/android.git -b 13 -g default,-mips,-darwin,-notdefault
rm -rf lm
rm -rf .repo/local_manifests
git clone git@github.com:Mocaness/local_manifests.git -b bianca-t-44 lm
cp -r lm/local_manifests .repo/
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16

# build rom
curl -Lo barom.sh https://raw.githubusercontent.com/toukashishigaya/barom/main/barom.sh
chmod +x barom.sh
./barom.sh -t ${TG_CHAT_ID} ${TG_TOKEN}
./barom.sh --ccache-dir "${WORKDIR}/ccache" --ccache-size 15G
./barom.sh --device whyred --lunch whyred-user
./barom.sh -b -j 8 -u gof --timer 95m -- m dudu

# end
