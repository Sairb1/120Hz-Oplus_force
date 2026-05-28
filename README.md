# Display 120Hz Launcher Fix for OPLUS (Android 15 / 16 Ports)
> A lightweight, system-less root module to force a butter-smooth 120Hz refresh rate in the system launcher and app drawer on OnePlus, OPPO, and Realme devices.

---

## 📱 What it Does
On custom ported ROMs or specific stock ROM updates of Android 15 and Android 16 on OPLUS (OnePlus/OPPO/Realme) devices, the **system launcher and app drawer** often get stuck scrolling at 60Hz. Even if the screen refresh rate is globally set to 120Hz, the DisplayManager or SurfaceFlinger framework ignores normal settings and drops down to 60Hz during home-screen interactions, resulting in visible scrolling stutter and lag.

This module resolves this issue system-lessly by:
1. **Dynamic Bind Mounting**: Seamlessly mounts customized OPLUS VRR (Variable Refresh Rate) files (`refresh_rate_config.xml`, `oplus_vrr_config.json`, `report_rate_config.xml`) onto the `/my_product/etc/` partition during boot (`post-fs-data.sh`), bypassing standard Magic Mount limitations on OEM partitions.
2. **Settings Database Injection**: Forcefully sets the `min_refresh_rate`, `peak_refresh_rate`, and `user_refresh_rate` properties inside Android's settings database immediately upon boot completion.
3. **SurfaceFlinger Lock**: Uses advanced `resetprop` injections to overwrite read-only system properties, ensuring the SurfaceFlinger timing thresholds and OPLUS display refresh rate threads remain consistently locked to 120Hz.
4. **Boot-persistent Guard**: Executes a recurring background loop for 5 iterations post-boot to prevent aggressive third-party thermal/battery managers (like YAKT or Uperf) from resetting your display settings.

---

## 🛠️ Supported Environments
* **Devices**: Rooted OnePlus, OPPO, and Realme (OPLUS) smartphones.
* **Operating Systems**: Android 15 & Android 16 (Stock, Ported ROMs, and GSIs).
* **Root Frameworks**: 
  - ✅ **Magisk** (v24.0+)
  - ✅ **KernelSU** (v0.5.0+)
  - ✅ **APatch** (v0.10+)

---

## 📦 Package Contents
* `module.prop` - Module metadata and automatic updates tracking.
* `customize.sh` - Interactive premium installer script with slow progress updates.
* `post-fs-data.sh` - Pre-boot systemless partition bind-mounter.
* `service.sh` - Post-boot boot-completed settings database guard.
* `system.prop` - Boot-time system properties injector.
* `my_product/etc/` - Modified high-performance VRR XML & JSON configuration files.
* `update.json` - Remote repository updater endpoint.

---

## 🚀 Installation Steps

1. **Download**: Obtain the latest flashable ZIP (`120Hz-Oplus_force.zip`).
2. **Flash**:
   - **Magisk**: Open the Magisk app -> Go to **Modules** tab -> Select **Install from storage** -> Select the `.zip` file.
   - **KernelSU**: Open the KernelSU app -> Go to **Modules** tab -> Tap **Install** -> Select the `.zip` file.
   - **APatch**: Open the APatch app -> Go to **Modules** tab -> Tap **Install** -> Select the `.zip` file.
3. **Wait for Install**: Enjoy the premium slow-flashing installer that sets up your configs safely step-by-step.
4. **Reboot**: Restart your device to fully bind-mount `/my_product` configurations and trigger boot-time SurfaceFlinger properties.

---

## ⚠️ Important Warnings & Disclaimers

> [!WARNING]
> This module is strictly designed for **OnePlus, OPPO, and Realme** devices. Do not flash it on other brands (e.g., Xiaomi, Samsung, Google) as it relies on specific OPLUS display rendering features and `/my_product` partitions.

> [!IMPORTANT]
> - Always make sure you have a way to disable root modules in recovery (e.g., safe mode boot, custom recovery, or KernelSU/APatch WebUI) in the rare event of a bootloop caused by other conflicting modules.
> - This module is lightweight and highly optimized; it does not cause battery drain and operates strictly when the display needs to draw at high refresh rates.

---

## 💬 Community & Support
* **Developer**: Ayan (@imnotaino)
* **Telegram Channel**: [t.me/colorosmodules](https://t.me/colorosmodules)
