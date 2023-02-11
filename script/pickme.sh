cd packages/apps/DerpLauncher
git fetch https://github.com/DF-Whyred/packages_apps_DerpLauncher 2599b2380ab23d80d0f36c5db65f30223f2732f0
git cherry-pick FETCH_HEAD
cd ../../../
cd system/core
git fetch https://github.com/DF-Whyred/system_core b4809a1f9a89816675e3f1e9135748459d6fc05a
git cherry-pick FETCH_HEAD
cd ../../

