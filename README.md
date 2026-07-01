# PS5-Bar-Tool (Updated)

PS5 implements a feature called "Backup and Restore" (BAR) to allow users to move or save user data and application information. 

This payload lets you visualize the information of any BAR file and dump the embedded file system using the PS5 hardware as a decryption oracle.

> ⚠️ **Status:** Work in Progress (WIP) / Updated to support modern firmwares.

## 🚀 Key Updates in this Fork
* **SDK Alignment:** Fully updated to compile with the latest **ps5-payload-dev/sdk v0.41**.
* **Extended Compatibility:** Successfully tested on firmware **12.40** and verified compatible up to **13.40**.
* **Exploit Ready:** Built to work seamlessly alongside the **Y2JB-P2JB** exploit chains.

## 💡 Why Use PS5-bar-tool? (Overcoming Garlic Save / Manager Limitations)

While network-based tools like Garlic Save and Garlic Manager are great for basic save mounting, they consistently fail when handling massive data blocks or heavily restricted application layers. Garlic tools frequently hit a hard **1024 MB (1 GB) file size limit**, causing payloads to crash on large RPG save profiles or game backups. Furthermore, they often output unextractable **0 KB dummy files** when encountering strict sandbox encryption layers. 

**PS5-bar-tool completely bypasses these network and memory boundaries.** By utilizing an official local Backup and Restore (BAR) archive (`archive.dat`) directly from your USB drive, it treats the PS5 hardware as a true decryption oracle. The console's native secure enclave handles the cryptographic lifting, allowing you to successfully decrypt and extract full-sized game data, applications, and massive save structures that other tools simply cannot touch.

## 🛠️ Compilation

First, make sure you have the official PS5 payload SDK installed and configured in your environment variables.

```bash
make
```

## How to Use

Place the PS5 BAR file in /mnt/usb0/PS5/EXPORT/BACKUP/archive.dat

```
USB0 Root
└── 📁 PS5
    └── 📁 EXPORT
        └── 📁 BACKUP
            └── 📄 archive.dat
            └── 📄 archive0001.dat (if multi file)
            └── 📄 archive0002.dat (if multi file)
            └── 📄 archiveXXXX.dat
            └── 📁 DUMP (output)
            └── 📄 ps5-bar-tool.log (output)
```

## Send the payload

```sh
socat -t 99999 - TCP:YOUR_PS5_IP:9021 < ps5-bar-tool.elf
```
Wait until it finishes.
You'll find a log file in the folder.

## 🤝 Credits & Acknowledgments
DEV of PS5-PAYLOAD-SDK [john-tornblom](https://github.com/john-tornblom) : [PS5 PAYLOAD SDK](https://github.com/ps5-payload-dev/sdk/releases)   
DEV of PS5-Bar-Tool [c0w-ar](https://github.com/c0w-ar) : [ps5-bar-tool](https://github.com/c0w-ar/ps5-bar-tool)

## SUPPORT
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/J8A3229V9A)
