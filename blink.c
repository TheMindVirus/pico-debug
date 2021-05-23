void led_on(void);
void led_off(void);

void nop(long t)
{
    for (long l = 0; l < (t * 8000000l); ++l) { asm volatile ("nop"); }
}

void main()
{
    led_on();
    nop(25);
    led_off();
    nop(25);
}