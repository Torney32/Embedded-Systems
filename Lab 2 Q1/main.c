#include <msp430.h> 

float flVal = 32.0;

/**
 * main.c
 */
int main()
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	
	int intVal = 0;

	unsigned char char1 = 0x0f0;
	unsigned char char2 = 0x00f;

	unsigned char char3, char4;

    intVal += 1;
    flVal--;

    char3 = (char1 | char2); //or
    char4 = (char1 ^ char2); //xor

    while(1);
}
