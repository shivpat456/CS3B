// Programmer: Carlos Aguilera
// Exam #1
// Purpose: Exam 1
// Author: Carlos Aguilera
// Date Last Modified: 02/22/24

// set global start as the main entry
  .global _start

  .equ BUFFER, 21

  .section .data
  szA: .skip BUFFER
  szB: .skip BUFFER
  szSum: .skip BUFFER

  dbX: .quad 0
  dbY: .quad 0

  szTwoTimes: .asciz "2 * "
  szPlus: .asciz " + "
  szEqual: .asciz " = "
  szParenOpen: .asciz "("
  szParenClose: .asciz ")"
  szEnterX: .asciz "Enter x: "
  szEnterY: .asciz "Enter y: "

  szName: .asciz    "Author: Carlos Aguilera"
  szDate: .asciz    "Date: 02/22/24"
  szProgram: .asciz "Program: Exam 1"

  chCr: .byte 10

  .section .text
_start:
  // ------------------ PRINT HEADER ----------------- //
  LDR X0, =szName // load the address of szName into X0
  BL putstring // branch link to putstring and print out szName

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  LDR X0, =szDate // load the address of szDate into X0
  BL putstring // branch link to putstring and print out szDate

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  LDR X0, =szProgram // load the address of szProgram into X0
  BL putstring // branch link to putstring and print out szProgram

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  // -------------------- GET AND SET "A" --------------------- //
  LDR X0, =szEnterX // load the address of szEnterX into X0
  BL putstring // branch link to putstring and print out szEnterX

  LDR X0, =szA // load the address of szA into X0
  MOV X1, BUFFER // mov the value of BUFFER into X1
  BL getstring // get user input as string

  LDR X0, =szA // load the address of szA into X0
  BL ascint64 // branch link to ascint64 and convert string into quad

  LDR X1, =dbX // load the address of dbX into X1
  STR X0, [X1] // store the value of X0 into dbX

  // -------------------- GET AND SET "B" --------------------- //
  LDR X0, =szEnterY // load the address of szEnterX into X0
  BL putstring // branch link to putstring and print out szEnterX

  LDR X0, =szB // load the address of szB into X0
  MOV X1, BUFFER // mov the value of BUFFER into X1
  BL getstring // get user input as string

  LDR X0, =szB // load the address of szB into X0
  BL ascint64 // branch link to ascint64 and convert string into quad

  LDR X1, =dbY // load the address of dbY into X1
  STR X0, [X1] // store the value of X0 into dbY

  // ------------------ CALCULATE VALUE -------------------- //

  LDR X0, =dbY // load the address of dbX into X0
  LDR X0, [X0] // get the value stored in dbX
  ADD X0, X0, X0 // X0 = X0 + X0 (the value)

  LDR X1, =dbX // load the address of dbY into X0
  LDR X1, [X1] // get the value stored in dbY

  ADD X2, X1, X0 // X2 = X0 + X1

  ADD X0, X2, X2 // X0 = X2 + X2 (the value)
  LDR X1, =szSum // load the address of szSum into X0
  BL int64asc // branch link into in64asc

  // ----------------- PRINT CALCULATION ------------------ //
  LDR X0, =szTwoTimes // load the address of szTwoTimes into X0
  BL putstring // branch link to putstring and print out szTwoTimes

  LDR X0, =szParenOpen // load the address of szParenOpen into X0
  BL putstring // branch link to putstring and print out szParenOpen

  LDR X0, =szA // load the address of szA into X0
  BL putstring // branch link to putstring and print out szA

  LDR X0, =szPlus // load the address of szPlus into X0
  BL putstring // branch link to putstring and print out szPlus

  LDR X0, =szTwoTimes // load the address of szTwoTimes into X0
  BL putstring // branch link to putstring and print out szTwoTimes

  LDR X0, =szB // load the address of szB into X0
  BL putstring // branch link to putstring and print out szB

  LDR X0, =szParenClose // load the address of szB into X0
  BL putstring // branch link to putstring and print out szB

  LDR X0, =szEqual // load the address of szEqual into X0
  BL putstring // branch link to putstring and print out szEqual

  LDR X0, =szSum // load the address of szD into X0
  BL putstring // branch link to putstring and print out szD

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  MOV  X0, #0   // Setup the parameters to exit the program
  MOV  X8, #93  // and then call Linux to do it.

  SVC  0 // use 0 return code
