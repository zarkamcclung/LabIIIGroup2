#include <msp430.h>
#include <stdint.h>

/*Program for Controller of Zigbee Test Network,
 * adapted from msp430g2xx3_usci_uart_standard_transceiver.c example
 * by Nima Eskandari at Texas Instruments
 */
/******************************************************************************
**************************UART Initialization *********************************
******************************************************************************/

#define SMCLK_11500     0
#define SMCLK_9600      1
#define ACLK_9600       2

#define UART_MODE       SMCLK_9600

char buffer[10];
char x = '0';
int counter = 0;

void SendUCA0Data(uint8_t data)
{
    while (!(IFG2&UCA0TXIFG));                // USCI_A0 TX buffer ready?
    UCA0TXBUF = data;
}
void initUART()
{
    UCA0CTL1 |= UCSSEL_2;                     // SMCLK
    UCA0BR0 = 104;                            // 16MHz 9600
    UCA0BR1 = 0;                              // 16MHz 9600
    UCA0MCTL = UCBRS_0 + UCOS16 + UCBRF_3;    // Modulation UCBRSx = 0
    UCA0CTL1 &= ~UCSWRST;                     // **Initialize USCI state machine**
    IFG2 &= ~(UCA0RXIFG);
    IE2 |= UCA0RXIE;                          // Enable USCI_A0 RX interrupt
}

//******************************************************************************
// Device Initialization *******************************************************
//******************************************************************************

void initClockTo16MHz()
{
    if (CALBC1_16MHZ==0xFF)                  // If calibration constant erased
    {
        while(1);                            // do not load, trap CPU!!
    }
    DCOCTL = 0;                              // Select lowest DCOx and MODx settings
    BCSCTL1 = CALBC1_16MHZ;                  // Set DCO
    DCOCTL = CALDCO_16MHZ;
}

void initGPIO()
{
    P1SEL = BIT1 + BIT2;                      // P1.1 = RXD, P1.2=TXD
    P1SEL2 = BIT1 + BIT2;
    P1DIR |= 0x01;                            // Set P1.0 to output direction

    P1REN = BIT3;
    P1OUT = BIT3;
}

//******************************************************************************
// Main ************************************************************************
// Enters LPM0 if SMCLK is used and waits for UART interrupts. If ACLK is used *
// then the device will enter LPM3 mode instead. The UART RX interrupt handles *
// the received character and echoes it.                                       *
//******************************************************************************

void main()
{
    WDTCTL = WDTPW + WDTHOLD;                 // Stop WDT
    initClockTo16MHz();
    initGPIO();
    initUART();

    while(1)
        {
            if((P1IN & BIT3)!=BIT3)
            {
                __delay_cycles(22000000);
                P1OUT ^= BIT0;
                if (counter == 0){
                    x = '1';
                    counter++;
                }
                else {
                    x = '2';
                    counter = 0;
                }
                SendUCA0Data(x);

            }
        }
}

