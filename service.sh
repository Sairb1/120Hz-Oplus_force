#!/system/bin/sh
# Display 120Hz Launcher Fix - Service Script
# Designed for OPLUS devices running Android 15 & 16 (Stock and Ports)
# Supports Magisk, APatch, and KernelSU

# Wait until boot is fully completed
until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 2
done

# Wait an additional 5 seconds to ensure system settings and providers are fully initialized
sleep 5

# Logger helper
log_msg() {
    echo "[120Hz-Oplus-Fix] $1" >> /data/adb/modules/120Hz-Oplus_force/service.log
}

log_msg "Boot completed, applying 120Hz settings database injection..."

# Apply the fix in a loop for 5 iterations (every 10 seconds)
# This prevents other boot-time optimization modules (e.g. YAKT, Uperf, LKT) from overwriting our settings.
count=0
while [ $count -lt 5 ]; do
    log_msg "Iteration $((count + 1)): Enforcing Settings..."
    
    # 1. System Settings Database Locks
    settings put system min_refresh_rate 120.0
    settings put system peak_refresh_rate 120.0
    settings put system user_refresh_rate 120
    settings put secure user_refresh_rate 120
    
    # 2. Set/Ensure OPLUS-specific and SurfaceFlinger properties
    # Using standard setprop
    setprop persist.sys.min_refresh_rate 120
    setprop sys.oplus.display.refreshrate_thread true
    
    # Using resetprop to forcefully overwrite read-only properties if they were modified by the OS
    if command -v resetprop >/dev/null 2>&1; then
        resetprop ro.surface_flinger.set_display_power_timer_ms 1000
        resetprop ro.surface_flinger.game_default_frame_rate_override 120
        resetprop persist.sys.min_refresh_rate 120
        resetprop sys.oplus.display.refreshrate_thread true
    fi
    
    sleep 10
    count=$((count + 1))
done

log_msg "Service script execution completed. 120Hz rules are locked."
