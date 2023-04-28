curl https://github.com/DF-Whyred/system_core/commit/67debe39d8c985e8d4bae4b83b18e8d74e3081a6.patch | git -C "system/core" am
curl https://github.com/DF-Whyred/system_core/commit/73967771041a215880ea78fec5f2deefae378bf1.patch | git -C "system/core" am
git -C "vendor/derp" fetch https://github.com/DF-Whyred/vendor_derp 12.1 --depth=5
git -C "vendor/derp" cherry-pick 827d9c7690dd3cc08b9262470940afb9867c3e68^..3bc869f6f236cb62e2cc89632aaa643d900050d3
