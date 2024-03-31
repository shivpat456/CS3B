//*****************************************************************************
// Name: Carlos Aguilera and Shiv
// Program: RASM3.s
// Class: CS 3B
// Lab: RASM3
// Date: March 30, 2024 at 9:04 PM
// Purpose:
//    DO SOMETHING LOL
//*****************************************************************************

// set global start as the main entry
  .global _start

  .equ BUFFER, 512

  .section .data

  szBuffer:  .skip BUFFER

  szRasm3: .asciz   "In RASM 3!"

  chCr: .byte 10

  .section .text

_start:
  LDR X0, =szRasm3   // load the address of szRasm3 into X0
  BL putstring       // branch link to putstring and print out szRasm3

  LDR X0, =chCr  // load the address of chCr into X0
  BL putch       // branch link to putch and print out chCr

  BL String1       // branch link to String1
  BL String2       // branch link to String2

  MOV   X0, #0   // Use 0 return code
  MOV   X8, #93  // Service Command Code 93 terminates this program
  SVC   0        // Call linux to terminate the program
