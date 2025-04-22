# PowerHive Magisk Module

![PowerHive Header ASCII Art](https://raw.githubusercontent.com/kelexine/powerhive/main/assets/header.png)

- **ID:** powerhive
- **Name:** PowerHive
- **Version:** v1.0.0
- **Author:** Kelexine
- **Description:** Advanced power management and system performance control for Android devices via Magisk.

PowerHive provides an interactive interface to easily switch between predefined power modes, configure smart mode based on battery levels, view system performance statistics, and manage configuration backups.

## Features

* Interactive menu interface via the `powerhive` command.
* Predefined power modes: Normal, Turbo (Performance), Battery Saver.
* Adjustable settings per mode: CPU Governor, Background Process Limit, Max CPU Frequency.
* Smart Mode: Automatically switches power modes based on battery levels and charging status.
* Configuration Backup and Restore.
* View real-time system performance stats.
* Simple installation via Magisk.

## Prerequisites

* A rooted Android device with Magisk installed.
* A terminal emulator app (e.g., Termux) or ADB access.

## Installation

1.  Download the latest `PowerHive-vX.Y.Z.zip` release from the [GitHub Releases page](https://github.com/kelexine/powerhive/releases) (or build it yourself using the `build.sh` script).
2.  Open the Magisk app.
3.  Go to the **Modules** section.
4.  Tap on "**Install from storage**".
5.  Select the downloaded `PowerHive-vX.Y.Z.zip` file.
6.  Magisk will flash the module. Once complete, **reboot your device**.

## Usage

After installation and reboot, open your terminal emulator or connect via ADB shell and run the following command to access the interactive menu:

```bash
su -c powerhive
```
