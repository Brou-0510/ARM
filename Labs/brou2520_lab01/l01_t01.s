/*
-------------------------------------------------------
l01.s
Assign to and add contents of registers.
-------------------------------------------------------
Author:  Paige Broussard
ID:      190832520
Email:   brou2520@mylaurier.ca
Date:    2021-01-20
-------------------------------------------------------
*/
.org    0x1000  // Start at memory location 1000
.text  // Code section
.global _start
_start:

MOV R0, #9       // Store decimal 9 in register R0
MOV R1, #14     // Store hex E (decimal 14) in register R1
ADD R2, R1, R0  // Add the contents of R0 and R1 and put result in R2
MOV R3, #8		// Store decimal 8 in register R3
ADD R3, R3, R3	// Add the contents of R3 and R3 and put result in R3
ADD R4, R3, #5

// End program
_stop:
B   _stop

