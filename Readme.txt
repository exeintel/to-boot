================================================================================
  To Boot - System Boot Shortcuts
  Developer: ExEintel
================================================================================

  A collection of batch scripts providing quick shortcuts to boot into
  BIOS, UEFI firmware, boot menu, Safe Mode, Recovery Environment,
  and other system boot options on Windows.

================================================================================
  FILES
================================================================================

  to_bios.cmd              Reboot directly into BIOS / UEFI firmware settings
  to_boot_menu.cmd         Reboot into Advanced Boot Options menu
  to_uefi_firmware.cmd     Reboot directly into UEFI firmware settings
  to_safe_mode.cmd         Reboot into Safe Mode (minimal, networking, or cmd)
  to_recovery.cmd          Reboot into Windows Recovery Environment (WinRE)
  to_last_known_good.cmd   Attempt to boot with last known good configuration
  reboot_fast.cmd          Quick system reboot with no delay
  shutdown_restart_advanced.cmd  Advanced shutdown and restart options menu

================================================================================
  REQUIREMENTS
================================================================================

  - Windows 7 / 8 / 8.1 / 10 / 11
  - Administrator privileges (all scripts auto-elevate via UAC)

================================================================================
  USAGE
================================================================================

  Double-click any .cmd file or run from Command Prompt:

      to_bios.cmd

  Each script will:
  1. Request administrator privileges if not already elevated.
  2. Display a description of the action.
  3. Prompt for confirmation before proceeding.

================================================================================
  NOTES
================================================================================

  - to_bios.cmd and to_uefi_firmware.cmd use shutdown /fw which requires
    UEFI. Legacy BIOS systems will need manual key presses (F2/Del) during POST.

  - to_last_known_good.cmd: Last Known Good Configuration is not natively
    available on Windows 8+. The script provides BCD-based recovery alternatives.

  - After using to_safe_mode.cmd, run the following after booting into Safe Mode
    to prevent reboot loops:
        bcdedit /deletevalue {current} safeboot

================================================================================
  LICENSE
================================================================================

  MIT
