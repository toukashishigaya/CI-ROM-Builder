cd system/core
git fetch https://github.com/DF-Whyred/system_core b4809a1f9a89816675e3f1e9135748459d6fc05a
git cherry-pick FETCH_HEAD
cd ../../
cd kernel/xiaomi/whyred
git fetch https://github.com/Mocaness/WhyredKernel dedd0eac6f7baf7923ec3b987d922e23a21d11ed
git cherry-pick FETCH_HEAD
cd ../../../
