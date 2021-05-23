@echo on
set PATH=%CD%\compiler\bin;%CD%\pico\bin
set FLAGS=-mcpu=cortex-m0plus -std=gnu99 -fpic -ffreestanding -O2 -Wall -Wextra -I %CD%\pico
set LINKS=-T link.ld -O2 -ffreestanding -nostartfiles -L %CD%\compiler\lib

arm-none-eabi-gcc %FLAGS% -c boot.S -o boot.o
arm-none-eabi-gcc %FLAGS% -c -g blink.c -o blink.o
arm-none-eabi-gcc %LINKS% boot.o blink.o -o blink.elf
elf2uf2 blink.elf blink.uf2
pause