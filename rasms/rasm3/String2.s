//*****************************************************************************
// Name: Carlos Aguilera
// Program: String2.s
// Class: CS 3B
// Date: March 30, 2024 at 9:04 PM
// Purpose:
//    DO SOMETHING LOL
//*****************************************************************************

// set global start as the main entry
  .global String2

  .section .data

  szString2: .asciz   "In String 2!"

  chCr: .byte 10

  .section .text

String2:
  STR X30, [SP, #-16]! // push link register onto the stack

  LDR X0, =szString2   // load the address of szString2 into X0
  BL putstring       // branch link to putstring and print out szString2

  LDR X0, =chCr  // load the address of chCr into X0
  BL putch       // branch link to putch and print out chCr

  LDR X30, [SP], #16 // pop link register off the stack

  RET
