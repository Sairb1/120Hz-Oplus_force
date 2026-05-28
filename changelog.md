# Display 120Hz Launcher Fix Oplus

## Changelog v1.3
- **Stock Reno 11 Pro Configurations**: Integrated pure stock UI and refresh rate configuration XMLs from the Reno 11 Pro (`multimedia_display_feature_config.xml`, `multimedia_display_perf_list.xml`, `refresh_rate_config.xml`, `oplus_vrr_config.json`, `report_rate_config.xml`).
- **Enhanced Boot Scripts**: Upgraded `post-fs-data.sh` to fully support dynamic recursive bind mounting of `/my_product/vendor/etc` and `/my_product/etc` directly from the stock ROM files.
- **Fixed SystemUI/Launcher Throttle**: Bypasses the 60Hz and 30Hz lock thresholds automatically triggered by port ROM mismatches during UI scrolling.
- **Persistent Display Guard**: Enforces `min_refresh_rate=120.0` multiple times upon boot to prevent aggressive ROM optimizers from wiping out your smooth scrolling.

## Changelog v1.2
- **System-less Partition Mounting**: Added full support for bind-mounting modified OPLUS display configuration files (`refresh_rate_config.xml`, `oplus_vrr_config.json`, `report_rate_config.xml`) on the `/my_product` partition.
- **Robust Boot Services**: Rebuilt `service.sh` to dynamically wait for `sys.boot_completed=1` instead of arbitrary sleeps.
- **Enhanced Reliability**: Implemented a recurring settings locking loop and added support for `resetprop` to forcefully lock display settings database values and overwrite read-only SurfaceFlinger properties system-lessly.
- **Premium Installer Experience**: Completely redesigned `customize.sh` with elegant terminal progress indicators and deluxe deliberate delays, making the flashing process feel highly professional.
- **Cross-Manager Compatibility**: Added full, tested compatibility with Magisk, KernelSU, and APatch.
- **Upgrades**: Support for Android 15 & Android 16 ported/stock ROMs on OPLUS (OnePlus/OPPO/Realme) devices.
