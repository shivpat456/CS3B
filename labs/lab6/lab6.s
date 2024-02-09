// Programmer: Carlos Aguilera
// Lab #6
// Purpose: print each data label given and its value
// Author: Carlos Aguilera
// Date Last Modified: 02/08/24

// set global start as the main entry
  .global _start
  .section .text

_start:
  // ------------------- PRINTING bA -------------------- //
  LDR X0, =szA // load address of szA into X0
  BL putstring // branch link to putstring

  LDR X0, =bA // load address of bA into X0
  LDRB W0, [X0] // load one byte from X0 into W0
  LDR X1, =szBuffer // load address of szBuffer into X1
  BL int64asc // branch link to putstring

  LDR X0, =szBuffer // load address of szBuffer into X0
  BL putstring // branch link to putstring

  LDR X0, =chCr // load address of chCr into X0
  BL putch // branch link to putch

  // ------------------- PRINTING szFlag -------------------- //
  LDR X0, =szFlag // load address of szFlag into X0
  BL putstring // branch link to putstring

  LDR X0, =bFlag // load address of bFlag into X0
  LDRB W0, [X0] // load one byte from X0 into W0
  LDR X1, =szBuffer // load address of szBuffer into X1
  BL int64asc // branch link to putstring

  LDR X0, =szBuffer // load address of szBuffer into X0
  BL putstring // branch link to putstring

  LDR X0, =chCr // load address of chCr into X0
  BL putch // branch link to putch

  // ------------------- PRINTING szInit -------------------- //
  LDR X0, =szInit // load address of szInit into X0
  BL putstring // branch link to putstring

  LDR X0, =chInit // load address of szInit into X0
  BL putch // branch link to putch

  LDR X0, =chCr // load address of chCr into X0
  BL putch // branch link to putch

  // ------------------- PRINTING szHi -------------------- //
  LDR X0, =szHi // load address of szHi into X0
  BL putstring // branch link to putstring

  LDR X0, =u16Hi // load address of u16Hi into X0
  LDRH W0, [X0] // load 2 bytes from X0 into W0
  LDR X1, =szBuffer // load address of szBuffer into X1
  BL int64asc // branch link to putstring

  LDR X0, =szBuffer // load address of szBuffer into X0
  BL putstring // branch link to putstring

  LDR X0, =chCr // load address of chCr into X0
  BL putch // branch link to putch

  // ------------------- PRINTING szLo -------------------- //
  LDR X0, =szLo // load address of szLo into X0
  BL putstring // branch link to putstring

  LDR X0, =U16Lo // load address of u16Lo into X0
  LDRH W0, [X0] // load 2 bytes from X0 into W0
  LDR X1, =szBuffer // load address of szBuffer into X1
  BL int64asc // branch link to putstring

  LDR X0, =szBuffer // load address of szBuffer into X0
  BL putstring // branch link to putstring

  LDR X0, =chCr // load address of chCr into X0
  BL putch // branch link to putch

  // ------------------- PRINTING wALT[0] -------------------- //
  LDR X0, =szAlt0 // load address of szAlt0 into X0
  BL putstring // branch link to putstring

  LDR X0, =wAlt // load address of wAlt into X0
  LDR W0, [X0] // load four byte value of X0 into W0
  LDR X1, =szBuffer // load address of szBuffer into X1
  BL int64asc // branch link into int64asc

  LDR X0, =szBuffer // load address of szBuffer into X0
  BL putstring // branch link to putstring

  LDR X0, =chCr // load address of chCr into X0
  BL putch // branch link to putch

  // ------------------- PRINTING wALT[1] -------------------- //
  LDR X0, =szAlt1 // load address of szAlt1 into X0
  BL putstring // branch link to putstring

  LDR X0, =wAlt // load address of wAlt into X0
  LDR W0, [X0, #4] // load the value of X0 + 8 bytes into W0
  SXTW X0, W0 // sign extend W0 to a 64 bit value in X0

  LDR X1, =szBuffer // load address of szBuffer into X1
  BL int64asc // branch link into int64asc

  LDR X0, =szBuffer // load address of szBuffer into X0
  BL putstring // branch link to putstring

  LDR X0, =chCr // load address of chCr into X0
  BL putch // branch link to putch

  // ------------------- PRINTING wALT[2] -------------------- //
  LDR X0, =szAlt2 // load address of szAlt2 into X0
  BL putstring // branch link to putstring

  LDR X0, =wAlt // load address of wAlt into X0
  LDR W0, [X0, #8] // load the value of X0 + 8 bytes into W0
  SXTW X0, W0 // sign extend W0 to a 64 bit value in X0

  LDR X1, =szBuffer // load address of szBuffer into X1
  BL int64asc // branch link into int64asc

  LDR X0, =szBuffer // load address of szBuffer into X0
  BL putstring // branch link to putstring

  LDR X0, =chCr // load address of chCr into X0
  BL putch // branch link to putch

  // ------------------- PRINTING szMsg1 -------------------- //
  LDR X0, =szMsg // load address of szFlag into X0
  BL putstring // branch link to putstring

  LDR X0, =szMsg1 // load address of wAlt into X0
  BL putstring // branch link to putstring

  LDR X0, =chCr // load address of chCr into X0
  BL putch // branch link to putch

  // ------------------- PRINTING szBig -------------------- //
  LDR X0, =szBig // load address of szFlag into X0
  BL putstring // branch link to putstring

  LDR X0, =dbBig // load address of wAlt into X0
  LDR X0, [X0] // load the value of X0 into X0
  LDR X1, =szBuffer // load address of szBuffer into X1
  BL int64asc // branch link into int64asc

  LDR X0, =szBuffer // load address of wAlt into X0
  BL putstring // branch link to putstring

  LDR X0, =chCr // load address of chCr into X0
  BL putch // branch link to putch

  MOV  X0, #0   // Setup the parameters to exit the program
  MOV  X8, #93  // and then call Linux to do it.

  SVC  0 // use 0 return code

  .data
  bA:     .byte   155
  bFlag:  .byte   1
  chInit: .byte   'j'
  u16Hi:  .hword  88
  U16Lo:  .hword  45
  wAlt:   .word   16, -1, -2
  szMsg1: .asciz  "And Sally and I"
  dbBig:  .quad   9223372036854775807

  szA: .asciz  "bA = "
  szFlag: .asciz  "bFlag = "
  szInit: .asciz  "chInit = "
  szHi: .asciz  "u16Hi = "
  szLo: .asciz  "U16Lo = "
  szAlt0:  .asciz  "wAlt[0] = "
  szAlt1:  .asciz  "wAlt[1] = "
  szAlt2:  .asciz  "wAlt[2] = "
  szMsg:  .asciz  "szMsg1 = "
  szBig:  .asciz  "dbBig = "

  szBuffer:  .skip 21
  chCr:   .byte   10
