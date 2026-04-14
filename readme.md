# PC Hotspot Manager v2

![Windows 11](https://img.shields.io/badge/OS-Windows-blue)

---

## Overview

**PC Hotspot Manager v2** is a lightweight **Windows batch script** that allows you to **quickly lock or unlock your PC hotspot**.
It comes with **UAC elevation**, real-time status checks, and a prompt to restart your PC if changes require it.

---

## Features

* 🔒 Lock (Block) the PC hotspot
* 🔓 Unlock (Enable) the PC hotspot
* 📊 Check the current hotspot status
* 🛡 Automatic UAC prompt if not running as administrator
* 💻 Menu-driven interface for ease of use
* 🔄 Option to restart the PC to apply changes

---

## Requirements

* Windows 10 or 11
* Administrator privileges (the script prompts automatically if not)
* No installation required

---

## How to Use

1. Download or save the script as `PC_Hotspot_Manager_v2.bat`.
2. Double-click to run.

   * If not running as admin, a **UAC prompt** will appear.
3. Use the on-screen menu:

   * **1** – Lock (Block) hotspot
   * **2** – Unlock (Enable) hotspot
   * **3** – Refresh status
   * **4** – Exit script
4. If prompted, restart your PC to apply changes.

---

## Hotspot Status Indicators

| Status                | Meaning                          |
| --------------------- | -------------------------------- |
| `[LOCKED]`            | Hotspot is blocked               |
| `[UNLOCKED]`          | Hotspot is enabled               |
| `[UNKNOWN / DEFAULT]` | No registry key found or default |

---

## Registry Key Modified

> ⚠️ Changes are applied via the Windows Registry. A system restart may be required to apply changes properly.

---

## Disclaimer

* Use at your own risk.
* Backup your registry or create a restore point before running the script.
* Intended for **educational purposes and personal use only**.

---

## Author

**Elj Men** – Educational Batch Script Developer
