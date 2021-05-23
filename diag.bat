@echo on
set PATH=%CD%\compiler\bin
arm-none-eabi-gdb blink.elf --command gdb.txt
pause