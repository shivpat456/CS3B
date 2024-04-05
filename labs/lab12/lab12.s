// Programmer: Carlos Aguilera
// Lab #12
// Purpose: 
//     In this lab, you are to convert the below C++ function fact into an external 
//     Assembly language function and create a driver program that calls it. Have your 
//     driver ask for an integer from the user then call fact(n). Don't forget to make
//     your function AAPCS compliant by pushing/popping the appropriate registers.
// Author: Carlos Aguilera
// Date Last Modified: 04/04/24

// set global start as the main entry
  .global _start

  .equ BUFFER, 21

  .data
    chCr:       .byte   10
    szPrompt0:   .asciz "Calculate factorial of: "
    szPrompt1:   .asciz "The factorial of -> "
    szPrompt2:   .asciz " is: "
    szBuffer:   .skip BUFFER

  .section .text

_start:
  LDR X0, =szPrompt0  // load the address of szPrompt into X0
  BL putstring        // branch link to putstring

  LDR X0, =szBuffer  // load the address of szBuffer into X0
  BL getstring       // branch link to putstring

  LDR X0, =szBuffer  // load the address of szBuffer into X0
  BL ascint64        // branch link to ascint64

  MOV X0, X0    // X0 = X0 (just my preference)
  BL factorial  // branch link to ascint64

  MOV X0, X0         // X0 = X0 (just my preference)
  LDR X1, =szBuffer  // load the address of szBuffer into X1
  BL int64asc        // branch link to int64asc

  LDR X0, =szBuffer  // load the address of szBuffer into X0
  BL putstring       // branch link to putstring

  LDR X0, =chCr // load the address of szBuffer into X1
  BL putch // branch link to putstring

  MOV  X0, #0   // Setup the parameters to exit the program
  MOV  X8, #93  // and then call Linux to do it.

  SVC  0 // use 0 return code
