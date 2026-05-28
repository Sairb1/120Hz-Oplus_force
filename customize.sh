#!/system/bin/sh
# Display 120Hz Launcher Fix - Installer Script
# Designed for OPLUS devices running Android 15 & 16 (Stock and Ports)
# Supports Magisk, APatch, and KernelSU

# Premium UI Header
ui_print "************************************************"
ui_print "*        Display 120Hz Launcher Fix Oplus      *"
ui_print "*            Dev: Ayan (@imnotaino)            *"
ui_print "*                 Version v1.2                 *"
ui_print "************************************************"
sleep 1.0

ui_print " "
ui_print "⚡ Initializing environment..."
sleep 1.2

# Fetching and showing Device Info with beautiful formatting
ui_print "🔍 Fetching device information..."
sleep 1.5

DEVICE=$(getprop ro.product.model)
ANDROID_VER=$(getprop ro.build.version.release)
KERNEL_VER=$(uname -r)
OTA_VER=$(getprop ro.build.version.incremental)
BRAND=$(getprop ro.product.brand)

ui_print "  • Device Brand  : ${BRAND:-OPLUS Device}"
ui_print "  • Device Model  : ${DEVICE:-Generic OPLUS}"
ui_print "  • Android Ver   : ${ANDROID_VER:-15 / 16}"
ui_print "  • Kernel Ver    : ${KERNEL_VER:-Unknown}"
ui_print "  • Build ID      : ${OTA_VER:-Unknown}"
sleep 1.5

ui_print " "
ui_print "⚙️ Preparing system-less files..."
sleep 1.2

# Setting permissions for boot and post-fs-data scripts
ui_print "🔧 Setting correct file permissions..."
sleep 1.0
ui_print "  • Configured: service.sh -> 0755 (Root:Root)"
set_perm "$MODPATH/service.sh" root root 0755
sleep 0.8
ui_print "  • Configured: post-fs-data.sh -> 0755 (Root:Root)"
set_perm "$MODPATH/post-fs-data.sh" root root 0755
sleep 1.0

ui_print " "
ui_print "📱 Applying instant 120Hz display database tweaks..."
sleep 1.2

ui_print "  • Tweaking Settings: min_refresh_rate -> 120.0"
settings put system min_refresh_rate 120.0 >/dev/null 2>&1
sleep 0.8

ui_print "  • Tweaking Settings: peak_refresh_rate -> 120.0"
settings put system peak_refresh_rate 120.0 >/dev/null 2>&1
sleep 0.8

ui_print "  • Tweaking Settings: user_refresh_rate -> 120"
settings put system user_refresh_rate 120 >/dev/null 2>&1
settings put secure user_refresh_rate 120 >/dev/null 2>&1
sleep 0.8

ui_print " "
ui_print "🚀 Enforcing OPLUS system-less properties..."
sleep 1.0
setprop persist.sys.min_refresh_rate 120 >/dev/null 2>&1
setprop sys.oplus.display.refreshrate_thread true >/dev/null 2>&1
sleep 0.8

ui_print " "
ui_print "📦 Setup and Mount Config Bindings..."
sleep 1.2
ui_print "  • Detected OPLUS refresh rate configuration files."
ui_print "  • Target partition: /my_product"
ui_print "  • System-less bind-mount scheduled for next boot."
sleep 1.2

ui_print " "
ui_print "✨ Done! Module successfully installed."
ui_print "💬 Telegram Channel: t.me/colorosmodules"
ui_print "⚠️  Please REBOOT your device to apply the fix fully!"
ui_print "************************************************"
sleep 1.5

# Open Telegram channel
(am start --user 0 -a android.intent.action.VIEW -d "https://t.me/colorosmodules") >/dev/null 2>&1 &
