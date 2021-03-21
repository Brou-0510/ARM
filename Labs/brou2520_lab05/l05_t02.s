/*
-------------------------------------------------------
l05_t02.s
counts the values in the list and displays the count in R4, and displays the number of bytes in the list in R5
-------------------------------------------------------
Author:  Paige Broussard
ID:      190832520
Email:   brou2520@mylaurier.ca
Date:    2021-02-25
-------------------------------------------------------
*/
.org    0x1000    // start at memory location 1000
.text
.global _start
_start:
    LDR    R2, =Data    // store address of start of list
    LDR    R3, =_Data   // store address of end of list
    MOV    R1,#0 // sum
    MOV    R4,#0 // count values
    MOV    R5,#0 // count bytes (ans: cant determine number of bytes wihtout loop)
Loop:
    LDR    R0, [R2], #4    // read address with post-increment (R1 = *R2, R2 += 4)
    ADD    R1, R0, R1
    ADD    R4, R4, #1
    ADD    R5, R5, #4
    CMP    R3, R2       // compare current address with end of list
    BNE    Loop         // if not at end, continue 

_stop:    B    _stop

.data
.align
    Data:    .word   4,5,-9,0,3,0,8,-7,12    // list of data
    _Data:    // end of list address 16
.end