// Programmer: Carlos Aguilera
// Lab #13
// Purpose: Write the string "cat in the hat" to a text file "output.txt".
// Author: Carlos Aguilera
// Date Last Modified: 04/05/24

// set global start as the main entry
  .global _start

  .equ BUFFER, 21

  .data
    chCr:       .byte   10
    szString:   .asciz "cat in the hat"

  .section .text

_start:
  LDR X0, =szString  // load the address of szPrompt into X0
  BL putstring        // branch link to putstring

  LDR X0, =chCr // load the address of szResult into X1
  BL putch // branch link to putstring

  MOV  X0, #0   // Setup the parameters to exit the program
  MOV  X8, #93  // and then call Linux to do it.

  SVC  0 // use 0 return code
