<div align="center">

<img width="1774" height="887" alt="image" src="https://github.com/user-attachments/assets/97f2b2e3-8c0e-4ae6-9717-9c89cc40b723" />

<img width="1774" height="887" alt="120Hz Launcher Fix" src="https://github.com/user-attachments/assets/314ae963-2da8-4362-b1d2-2a69e63e2968" />

<img src="https://img.shields.io/badge/Display120HzFix-v3.2-blueviolet?style=for-the-badge&logo=android" alt="120HzFix"/>
<br/>
<img src="https://img.shields.io/badge/Android-A15%20%7C%20A16-brightgreen?style=for-the-badge"/>
<img src="https://img.shields.io/badge/Root-Magisk%20%7C%20KernelSU%20%7C%20APatch-orange?style=for-the-badge"/>
<img src="https://img.shields.io/badge/Telegram-imnotaino-blue?style=for-the-badge&logo=telegram"/>

# ⚡ Display120HzFix

**Force true 120Hz scrolling & smooth launcher animations on OPLUS Android 15 / 16 ports**

Made with ♥ by **[Ayan (@imnotaino)](https://t.me/imnotaino)**  
Updates & Support → **[t.me/colorosmodules](https://t.me/colorosmodules)**

</div>

---

## 📖 What is this?

**Display120HzFix** is a Magisk / KernelSU / APatch module designed for **OnePlus, OPPO, and Realme** devices running Android 15 / 16 port ROMs.

A lot of OPLUS ports suffer from a stupid issue:
even if the refresh rate is set to **120Hz**, the launcher and app drawer still render at **60Hz** because the framework classifies them under low-priority refresh tiers.

This module patches that behavior properly by forcing the system refresh floor and syncing OPLUS display services with SurfaceFlinger timing.

The result:
- smoother launcher scrolling
- fluid recents animation
- proper 120Hz app drawer rendering
- reduced frame drops during UI transitions

Without touching `/system`.

---

## ✨ Features

| Feature | Description |
|---|---|
| ⚡ **True 120Hz Launcher** | Forces launcher & app drawer to render at high refresh |
| 🎞️ **Smooth Recents** | Better frame pacing during gesture navigation |
| 🧠 **DisplayManager Fix** | Bypasses broken ROM refresh classification |
| 🔧 **SurfaceFlinger Tweaks** | Improves render timing & idle transitions |
| 📱 **OPLUS Optimized** | Tuned specifically for ColorOS/OxygenOS framework |
| 🛡️ **Safe Overlay Mount** | No direct system partition modification |

---

## 📦 How it works

The module uses a dual-layer approach:

### 1️⃣ Settings Database Injection
At boot, `service.sh` directly writes:

```bash
settings put system min_refresh_rate 120
settings put system peak_refresh_rate 120
