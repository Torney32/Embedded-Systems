#include <msp430.h> 

int sum(int a, int b){
    int c = a + b;

    return c;
}


/**
 * main.c
 */
int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	
	int x = 0b1100110000110001;
	int y = 0b1000001100000001;

	sum(x, y);

	while(1);
}
