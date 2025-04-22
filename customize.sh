#!/system/bin/sh

# Magisk Module Install Script
# PowerHive

# --- Magisk Constants and Helper Functions ---
# The update-binary stub sources Magisk's util_functions.sh,
# making functions like ui_print, set_perm, set_perm_recursive available.
# You can also include them directly if preferred, but sourcing is standard.

# Default permissions
umask 022

# MODPATH is the directory where your module files are extracted during installation
# Provided by Magisk framework

ui_print "- Installing PowerHive module"

# Magisk automatically extracts files from the zip to $MODPATH
# Your customize.sh's main job is to set permissions and perform extra setup

ui_print "- Setting permissions for module files"

# Set permissions for the entire module directory
# Use Magisk's built-in set_perm_recursive function
# owner=0 (root), group=0 (root), directory_perm=0755, file_perm=0644
set_perm_recursive "$MODPATH" 0 0 0755 0644

# Set specific execute permission for your main script
# owner=0, group=0, file_perm=0755
set_perm "$MODPATH/system/bin/powerhive" 0 0 0755

# Additional setup: Initialize PowerHive configuration directory in /data
ui_print "- Initializing PowerHive configuration directory"
mkdir -p /data/powerhive
mkdir -p /data/powerhive/backups

# Create default configuration file if it doesn't exist
if [ ! -f /data/powerhive/config.json ]; then
    ui_print "- Creating default configuration file"
    # Use a different heredoc delimiter here to avoid conflict with the outer EOF
    cat > /data/powerhive/config.json << EOF_CONFIG
{
  "active_mode": "normal",
  "modes": {
    "normal": {
      "cpu_governor": "schedutil",
      "background_limit": 32,
      "max_cpu_freq": "auto"
    },
    "turbo": {
      "cpu_governor": "performance",
      "background_limit": 64,
      "max_cpu_freq": "max"
    },
    "battery": {
      "cpu_governor": "powersave",
      "background_limit": 16,
      "max_cpu_freq": "min"
    }
  },
  "smart_mode": {
    "enabled": false,
    "conditions": {
      "battery_low": 20,
      "battery_high": 80
    }
  }
}
EOF_CONFIG
    # Set permissions for the config file
    set_perm /data/powerhive/config.json 0 0 0644
fi

ui_print "- Installation complete!"
ui_print "- Execute 'su -c powerhive' to start"

exit 0
