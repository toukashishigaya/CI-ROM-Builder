# sync rom
repo init --depth=1 --no-repo-verify -u  https://github.com/BiancaProject/android.git -b 13-rebase-android-13.0.0_r38 -g default,-mips,-darwin,-notdefault
rm -rf lm
rm -rf .repo/local_manifests
git clone git@github.com:Mocaness/local_manifests.git -b  bianca-t-dynamic lm
cp -r lm/local_manifests .repo/
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16

# build rom
curl -Lo barom.sh https://github.com/alanndz/barom/raw/5828209f862ce2648c54ec3c7c5ba4fed11024cb/barom.sh
chmod +x barom.sh
./barom.sh -t ${TG_CHAT_ID} ${TG_TOKEN}
./barom.sh --ccache-dir "${WORKDIR}/ccache" --ccache-size 15G
./barom.sh --device whyred --lunch whyred-user
export VANILLA_BUILD=true
./barom.sh -b -j 8 -u gof --timer 92m -- m dudu

# end
