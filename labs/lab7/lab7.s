// Programmer: Carlos Aguilera
// Lab #7
// Purpose: You will learn to use STR, STRH, and STRB in this lab.
// Author: Carlos Aguilera
// Date Last Modified: 02/29/24

// set global start as the main entry
  .global _start
  .section .text

_start:
  // ------------------- POPULATING bA -------------------- //
  LDR X0, =bA // load address of bA into X0
  MOV W1, #155 // move the value of 155 into W1
  STRB W1, [X0] // store one byte into the address pointed by X0

  // ------------------- POPULATING chInit -------------------- //
  LDR X0, =chInit // load address of chInit into X0
  MOV W1, 'j' // move the value of 'j' into W1
  STRB W1, [X0] // store one byte into the address pointed by X0

  // ------------------- POPULATING u16Hi -------------------- //
  LDR X0, =u16Hi // load address of u16Hi into X0
  MOV W1, #88 // move the value of 88 into W1
  STRH W1, [X0] // store one byte into the address pointed by X0

  // ------------------- POPULATING wAlt -------------------- //
  LDR X0, =wAlt // load address of wAlt into X0
  MOV X1, #16 // move the value of 16 into X1
  STR X1, [X0] // store one byte into the address pointed by X0

  LDR X0, =wAlt // load address of wAlt into X0
  MOV X1, #-1 // move the value of -1 into X1
  STR X1, [X0, 4] // store one byte into the address pointed by X0

  LDR X0, =wAlt // load address of wAlt into X0
  MOV X1, #-2 // move the value of -2 into X1
  STR X1, [X0, 8] // store one byte into the address pointed by X0

  // ------------------- POPULATING szMsg1 -------------------- //
  LDR X0, =szMsg1 // load address of szMsg1 into X0
  MOV W1, 'A' // move the value of 'A' into W1
  STRB W1, [X0] // store one byte into the address pointed by X0

  MOV W1, 'n' // move the value of 'n' into W1
  STRB W1, [X0, 1] // store one byte into the address pointed by X0

  MOV W1, 'd' // move the value of 'd' into W1
  STRB W1, [X0, 2] // store one byte into the address pointed by X0

  MOV W1, ' ' // move the value of ' ' into W1
  STRB W1, [X0, 3] // store one byte into the address pointed by X0

  MOV W1, 'S' // move the value of 'S' into W1
  STRB W1, [X0, 4] // store one byte into the address pointed by X0

  MOV W1, 'a' // move the value of 'a' into W1
  STRB W1, [X0, 5] // store one byte into the address pointed by X0

  MOV W1, 'l' // move the value of 'l' into W1
  STRB W1, [X0, 6] // store one byte into the address pointed by X0

  MOV W1, 'l' // move the value of 'l' into W1
  STRB W1, [X0, 7] // store one byte into the address pointed by X0

  MOV W1, 'y' // move the value of 'y' into W1
  STRB W1, [X0, 8] // store one byte into the address pointed by X0

  MOV W1, '\n' // move the value of '\n' into W1
  STRB W1, [X0, 9] // store one byte into the address pointed by X0

  LDR X0, =szMsg1 // load address of szMsg1 into X0
  BL putstring

  LDR X0, =dbBig // load address of dbBig into X0

  MOV X1, #0xFFFFFFFF // Load the lower 32 bits of the constant into register X0
  LSL X1, X1, #32 // Left-shift the lower 32 bits to make room for the upper 32 bits
  MOVK X1, #0x7FFF, LSL #48 // Load the upper 32 bits of the constant into register X0

  STR X1, [X0] // store one byte into the address pointed by X0

  MOV  X0, #0   // Setup the parameters to exit the program
  MOV  X8, #93  // and then call Linux to do it.

  SVC  0 // use 0 return code

  .data
  bA:     .skip   1
  chInit: .skip   1
  u16Hi:  .hword  0
  wAlt:   .word   0, 0, 0
  szMsg1: .skip   10
  dbBig:  .quad   0

  szBuffer:  .skip 21
  chCr:   .byte   10
