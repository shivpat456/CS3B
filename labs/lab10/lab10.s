// Programmer: Carlos Aguilera
// Lab #10
// Purpose: write your external String_length function (not a macro).
// Author: Carlos Aguilera
// Date Last Modified: 03/23/24

// set global start as the main entry
  .global _start

  .equ BUFFER, 21

  .data
    chCr:           .byte   10
    szTestString:   .asciz "This is a string."
    szResultOutput: .asciz "String Length = "
    szBuffer:       .skip BUFFER

  .section .text

_start:
  LDR X0, =szTestString  // load the address of szTestString into X0
  BL string_length       // branch link to string_length

  LDR X1, =szBuffer  // load the address of szBuffer into X1
  BL int64asc        // branch link to int64asc

  LDR X0, =szResultOutput  // load the address of szResultOutput into X0
  BL putstring             // branch link to putstring

  LDR X0, =szBuffer  // load the address of szBuffer into X0
  BL putstring       // branch link to putstring

  LDR X0, =chCr // load the address of szBuffer into X1
  BL putch // branch link to putstring

  MOV  X0, #0   // Setup the parameters to exit the program
  MOV  X8, #93  // and then call Linux to do it.

  SVC  0 // use 0 return code
