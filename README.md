# Display 120Hz Launcher Fix (A15 / A16)

<img width="1774" height="887" alt="120" src="https://github.com/user-attachments/assets/314ae963-2da8-4362-b1d2-2a69e63e2968" />


A specialized Magisk/APatch/KernelSU module designed for **OnePlus, OPPO, and Realme (OPLUS)** devices running Android 15 / 16 ported ROMs. This module resolves the common issue where the system launcher is stuck at 60Hz scrolling despite high refresh rate settings.

## 🚀 The Problem
On many ported ROMs, the Android `DisplayManager` ignores the standard `persist.sys.min_refresh_rate` property in `build.prop`. This causes the system to categorize the Launcher as a "Normal" UI tier, capping it at 60Hz to save power, resulting in a laggy feel during app drawer navigation.

## 🛠️ The Solution
This module employs a dual-action fix:
1. **Settings Injection:** Uses a `service.sh` boot script to force `min_refresh_rate=120` directly into the Android Settings database. This is the only way to ensure the `DisplayManager` enforces a 120Hz floor for the launcher.
2. **Property Reinforcement:** Implements `system.prop` overrides to sync OPLUS VRR daemon hints and SurfaceFlinger timers.

## ✨ Features
- **Locked 120Hz Scrolling:** Consistent high refresh rate in System Launcher and App Drawer.
- **Fixed Animation Jank:** Improves frame pacing by adjusting SurfaceFlinger power timers.
- **Universal Support:** Compatible with Magisk, APatch, and KernelSU.
- **OPLUS Optimized:** Specifically tuned for OnePlus/OPPO/Realme frame rate categories.

## 📥 Installation
1. Download the latest `Display_120Hz_Launcher_Fix.zip`.
2. Open your Root Manager (Magisk/APatch/KSU).
3. Navigate to the Modules section and select **Install from storage**.
4. Select the ZIP file and reboot your device.
5. Wait ~15 seconds after boot for the `service.sh` to apply the final values.

## 👤 Credits
- **Developer:** Ayan ([@imnotaino](https://t.me/imnotaino))
- **Target OS:** Android 15 and Android 16
- **Devices:** OPLUS Family (OnePlus / OPPO / Realme)

