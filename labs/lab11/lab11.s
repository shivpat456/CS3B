// Programmer: Carlos Aguilera
// Lab #11
// Purpose: In this assignment, you are going to demonstrate the ability to modify immutable strings just like C++ and Java.
// Author: Carlos Aguilera
// Date Last Modified: 04/03/24

// set global start as the main entry
  .global _start

  .data

    szX:       .asciz "Cat"
    szY:       .asciz "in the hat."
    ptrString: .quad 0
    chCr:      .byte   10

  .section .text

_start:
  MOV  X0, #16 // move the value of 16 into X0
  BL   malloc // branch link to malloc 

  LDR X1, =ptrString  // load the address of ptrString into X1
  STR X0, [X1] // store the value of X0 into X1

  // CONCAT STRINGS
  LDR X0, =ptrString  // load the address of ptrString into X0
  LDR X0, [X0] // load the value of X0 into X0

  LDR X1, =szX  // load the address of szX into X0
  LDR X1, [X1] // load the value of X0 into X0

  STR X1, [X0] // store the value of "Cat" into ptrString

  MOV W2, #0x20 // move ascii hex space value into W2
  STRB W2, [X0, #3] // store byte into ptrString with offset of 3

  LDR X1, =szY  // load the address of szX into X0
  LDR X1, [X1] // load the value of X0 into X0

  STR X1, [X0, #4] // store the value of "in the h" into ptrString with an offset of 4 bytes

  LDR X1, =szY  // load the address of szX into X0
  LDR X1, [X1, #8] // load the value of X0 into X0

  STR X1, [X0, #12] // store the value of "in the hat." into ptrString

  MOV W2, #0 // store null terminating character into W2
  STRB W2, [X0, #15] // store byte into ptrString
  // END OF CONCAT STRINGS

  // PRINT STRING
  LDR X0, =ptrString  // load the address of ptrString into X0
  LDR X0, [X0]
  BL putstring // branch link to putstring

  LDR X0, =ptrString  // load the address of ptrString into X0
  LDR X0, [X0] // load the value of X0 into X0
  BL free // branch link to free

  LDR X0, =chCr // load the address of szBuffer into X1
  BL putch // branch link to putstring

  MOV  X0, #0   // Setup the parameters to exit the program
  MOV  X8, #93  // and then call Linux to do it.

  SVC  0 // use 0 return code
