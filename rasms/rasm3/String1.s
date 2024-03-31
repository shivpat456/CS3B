//*****************************************************************************
// Name: Shiv
// Program: String1.s
// Class: CS 3B
// Date: March 30, 2024 at 9:04 PM
// Purpose:
//    DO SOMETHING LOL
//*****************************************************************************

// set global start as the main entry
  .global String1

  .section .data

  szString1: .asciz   "In String 1!"

  chCr: .byte 10

  .section .text

String1:
  STR X30, [SP, #-16]! // push link register onto the stack

  LDR X0, =szString1   // load the address of szString1 into X0
  BL putstring       // branch link to putstring and print out szString1

  LDR X0, =chCr  // load the address of chCr into X0
  BL putch       // branch link to putch and print out chCr

  LDR X30, [SP], #16 // pop link register off the stack

  RET
