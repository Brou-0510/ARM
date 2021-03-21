/*
-------------------------------------------------------
l04_t01.s
Reads a string from the UART and writes in UART until ENTER
-------------------------------------------------------
Author:  Paige Broussard
ID:      190832520
Email:   brou2520@mylaurier.ca
Date:    2021-02-12
-------------------------------------------------------
*/
// Constants
.equ UART_BASE, 0xff201000     // UART base address
.org    0x1000       // Start at memory location 1000
.text  // Code section
.global _start
_start:

LDR  R1, =UART_BASE // loads UART address

LOOP:
LDRB  R0, [R1]  // read the UART data register
CMP  R0, #0x0a // stops at enter
BEQ  _stop
STR  R0, [R1]    // copy the character to the UART DATA field
B    LOOP

// without hitting enter key, the program will overflow
_stop:
B    _stop

.end