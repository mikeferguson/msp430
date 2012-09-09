/*
 * Blink the LEDs as a test
 */

#include<msp430.h>
 
void delay()
{
  int i;
  for(i=0;i<4000;i++)
    asm("nop");
}

int main()
{
  P1DIR=0x41;
  P1OUT=0x40;
  while(1)
  {
    delay();
    P1OUT^=0x41;
  }
}
