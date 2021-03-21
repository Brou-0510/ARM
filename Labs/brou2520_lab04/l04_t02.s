/*
-------------------------------------------------------
l04_t02.s
Reads a string from the UART and writes in mem until buffer full
-------------------------------------------------------
Author:  Paige Broussard
ID:      190832520
Email:   brou2520@mylaurier.ca
Date:    2021-02-12
-------------------------------------------------------
*/
// Constants
.equ UART_BASE, 0xff201000     // UART base address
.equ SIZE, 10        // Size of string buffer storage (bytes)
.org    0x1000       // Start at memory location 1000
.text  // Code section
.global _start
_start:

LDR  R1, =UART_BASE // loads UART address
LDR  R4, =READ_STRING
ADD  R5, R4, #SIZE // store address of end of buffer

LOOP:
LDRB  R0, [R1]  // read the UART data register
CMP  R0, #0x0a // stops at enter
BEQ  _stop
CMP  R4, R5        // end program if buffer full
BEQ  _stop
STRB R0, [R4]      // store the character in memory
ADD  R4, R4, #1    // move to next byte in storage buffer
B    LOOP
// if not all FIFO data is read it stays there
//if compiled and run again, it continues on with the rest of the inputed data
_stop:
B    _stop

.data  // Data section
// Set aside storage for a string
READ_STRING:
.space    SIZE

.end