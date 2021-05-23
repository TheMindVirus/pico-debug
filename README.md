# pico-debug

Debugging Tools for Raspberry Pi Pico

OpenOCD: https://github.com/raspberrypi/openocd

```
    compiler/bin/* - arm-none-eabi-gcc for Windows
    blink.elf - sample elf file with C symbols (-g) for arm-none-eabi-gdb on Windows
    diag.bat - launcher for arm-none-eabi-gdb on Windows
    gdb.txt - command file for arm-none-eabi-gdb on Windows
    openocd.sh - launcher for OpenOCD on Raspberry Pi OS (was missing -c "bindto 0.0.0.0")
```
Additionally, you may need to open port 3333 in Incoming/Outgoing TCP/UDP \
in Windows Firewall and whichever other firewalls are present on your network. \
Tested working through a Wi-Fi extender and several network switches.

![pinout](https://github.com/TheMindVirus/pico-debug/blob/main/pico-zero.png)