#!/system/bin/sh
# Display 120Hz Launcher Fix - Post-FS-Data Script
# Designed for OPLUS devices running Android 15 & 16 (Stock and Ports)
# Supports Magisk, APatch, and KernelSU

MODDIR=${0%/*}

# Bind mount the customized my_product configurations
# This is required because OEM-specific partitions like /my_product are not handled
# automatically by standard system-less Magic Mount systems.

# List of files to bind-mount with their relative paths
FILES_TO_MOUNT="
etc/refresh_rate_config.xml
etc/oplus_vrr_config.json
etc/report_rate_config.xml
vendor/etc/multimedia_display_feature_config.xml
vendor/etc/multimedia_display_perf_list.xml
"

# Logger helper
log_msg() {
    echo "[120Hz-Oplus-Fix] $1" >> /data/adb/modules/120Hz-Oplus_force/mount.log
}

log_msg "Starting post-fs-data mounting..."

for file in $FILES_TO_MOUNT; do
    SRC="$MODDIR/my_product/$file"
    DST="/my_product/$file"
    
    # Verify the source file exists in our module
    if [ -f "$SRC" ]; then
        # Check if the target destination file exists on the system
        if [ -f "$DST" ]; then
            log_msg "Found destination: $DST"
            # Unmount first if already mounted (to avoid stacked mounts on soft reboots)
            umount -f "$DST" >/dev/null 2>&1
            umount "$DST" >/dev/null 2>&1
            
            # Perform bind mount
            mount -o bind "$SRC" "$DST"
            if [ $? -eq 0 ]; then
                log_msg "Successfully bind-mounted $SRC to $DST"
            else
                log_msg "Failed to bind-mount $SRC to $DST"
            fi
        else
            # Some ported ROMs or GSIs might have these files at alternate paths
            ALT_DST="/system/my_product/$file"
            if [ -f "$ALT_DST" ]; then
                log_msg "Found alternate destination: $ALT_DST"
                umount -f "$ALT_DST" >/dev/null 2>&1
                umount "$ALT_DST" >/dev/null 2>&1
                
                mount -o bind "$SRC" "$ALT_DST"
                if [ $? -eq 0 ]; then
                    log_msg "Successfully bind-mounted $SRC to $ALT_DST"
                else
                    log_msg "Failed to bind-mount $SRC to $ALT_DST"
                fi
            else
                log_msg "Destination not found for $file (checked $DST and $ALT_DST)"
            fi
        fi
    else
        log_msg "Source file not found: $SRC"
    fi
done

log_msg "Post-fs-data mounting complete."
