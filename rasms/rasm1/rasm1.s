// Programmer: Carlos Aguilera
// RASM #1
// Purpose: take 4 user inputted ints and perform (A + B) - (C + D) = display result
// Author: Carlos Aguilera
// Date Last Modified: 02/10/24

// set global start as the main entry
  .global _start

  .equ BUFFER, 21

  .section .data
  szA: .skip BUFFER
  szB: .skip BUFFER
  szC: .skip BUFFER
  szD: .skip BUFFER
  szSum: .skip BUFFER
  szTemp: .skip BUFFER

  dbA: .quad 0
  dbB: .quad 0
  dbC: .quad 0
  dbD: .quad 0
  dbSum: .quad 0

  szPlus: .asciz " + "
  szSub: .asciz " - "
  szEqual: .asciz " = "
  szParenOpen: .asciz "("
  szParenClose: .asciz ")"
  szTab: .asciz  "   "
  szEnterNumber: .asciz "Enter a whole number: "
  szAddress: .asciz "The addresses of the 4 ints: "

  szName: .asciz  " Name: Carlos Aguilera"
  szClass: .asciz "Class: CS3B"
  szLab: .asciz   "  Lab: RASM1"
  szDate: .asciz  " Date: 02/10/24"

  chCr: .byte 10

  .section .text
_start:
  // ------------------ PRINT HEADER ----------------- //
  LDR X0, =szName // load the address of szName into X0
  BL putstring // branch link to putstring and print out szName

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  LDR X0, =szClass // load the address of szClass into X0
  BL putstring // branch link to putstring and print out szClass

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  LDR X0, =szLab // load the address of szLab into X0
  BL putstring // branch link to putstring and print out szLab

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  LDR X0, =szDate // load the address of szDate into X0
  BL putstring // branch link to putstring and print out szDate

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  // -------------------- GET AND SET "A" --------------------- //
  LDR X0, =szEnterNumber // load the address of szEnterNumber into X0
  BL putstring // branch link to putstring and print out szEnterNumber

  LDR X0, =szA // load the address of szA into X0
  MOV X1, BUFFER // mov the value of BUFFER into X1
  BL getstring // get user input as string

  LDR X0, =szA // load the address of szA into X0
  BL ascint64 // branch link to ascint64 and convert string into quad

  LDR X1, =dbA // load the address of dbA into X1
  STR X0, [X1] // store the value of X0 into dbA

  // -------------------- GET AND SET "B" --------------------- //
  LDR X0, =szEnterNumber // load the address of szEnterNumber into X0
  BL putstring // branch link to putstring and print out szEnterNumber

  LDR X0, =szB // load the address of szB into X0
  MOV X1, BUFFER // mov the value of BUFFER into X1
  BL getstring // get user input as string

  LDR X0, =szB // load the address of szB into X0
  BL ascint64 // branch link to ascint64 and convert string into quad

  LDR X1, =dbB // load the address of dbB into X1
  STR X0, [X1] // store the value of X0 into dbB

  // -------------------- GET AND SET "C" --------------------- //
  LDR X0, =szEnterNumber // load the address of szEnterNumber into X0
  BL putstring // branch link to putstring and print out szEnterNumber

  LDR X0, =szC // load the address of szC into X0
  MOV X1, BUFFER // mov the value of BUFFER into X1
  BL getstring // get user input as string

  LDR X0, =szC // load the address of szC into X0
  BL ascint64 // branch link to ascint64 and convert string into quad

  LDR X1, =dbC // load the address of dbC into X1
  STR X0, [X1] // store the value of X0 into dbC

  // -------------------- GET AND SET "D" --------------------- //
  LDR X0, =szEnterNumber // load the address of szEnterNumber into X0
  BL putstring // branch link to putstring and print out szEnterNumber

  LDR X0, =szD // load the address of szD into X0
  MOV X1, BUFFER // mov the value of BUFFER into X1
  BL getstring // get user input as string

  LDR X0, =szD // load the address of szD into X0
  BL ascint64 // branch link to ascint64 and convert string into quad

  LDR X1, =dbD // load the address of dbD into X1
  STR X0, [X1] // store the value of X0 into dbB

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  // ------------------ CALCULATE VALUE -------------------- //

  LDR X0, =dbA // load the address of dbA into X0
  LDR X0, [X0] // get the value stored in dbA
  LDR X1, =dbB // load the address of dbB into X0
  LDR X1, [X1] // get the value stored in dbB
  ADD X2, X0, X1 // X2 = X0 + X1

  LDR X0, =dbC // load the address of dbC into X0
  LDR X0, [X0] // get the value stored in dbC
  LDR X1, =dbD // load the address of dbD into X0
  LDR X1, [X1] // get the value stored in dbD
  ADD X3, X0, X1 // X3 = X0 + X1

  SUB X0, X2, X3 // X4 = X2 - X3
  LDR X1, =szSum // load the address of szSum into X0
  BL int64asc // branch link into in64asc

  // ----------------- PRINT CALCULATION ------------------ //
  LDR X0, =szParenOpen // load the address of szParenOpen into X0
  BL putstring // branch link to putstring and print out szParenOpen

  LDR X0, =szA // load the address of szA into X0
  BL putstring // branch link to putstring and print out szA

  LDR X0, =szPlus // load the address of szPlus into X0
  BL putstring // branch link to putstring and print out szPlus

  LDR X0, =szB // load the address of szB into X0
  BL putstring // branch link to putstring and print out szB

  LDR X0, =szParenClose // load the address of szB into X0
  BL putstring // branch link to putstring and print out szB

  LDR X0, =szSub // load the address of szSub into X0
  BL putstring // branch link to putstring and print out szSub

  LDR X0, =szParenOpen // load the address of szParenOpen into X0
  BL putstring // branch link to putstring and print out szParenOpen

  LDR X0, =szC // load the address of szC into X0
  BL putstring // branch link to putstring and print out szC

  LDR X0, =szPlus // load the address of szPlus into X0
  BL putstring // branch link to putstring and print out szPlus

  LDR X0, =szD // load the address of szD into X0
  BL putstring // branch link to putstring and print out szD

  LDR X0, =szParenClose // load the address of szB into X0
  BL putstring // branch link to putstring and print out szB

  LDR X0, =szEqual // load the address of szEqual into X0
  BL putstring // branch link to putstring and print out szEqual

  LDR X0, =szSum // load the address of szD into X0
  BL putstring // branch link to putstring and print out szD

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  LDR X0, =szAddress // load the address of szAddress into X0
  BL putstring // branch link to putstring and print out szAddress

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  // ---------------- PRINT OUT FOUR ADDRESSSES ----------------- //
  LDR X0, =dbA // load the address 
  MOV X2, #8 // load the address of szSum into X0
  BL hex64asc // branch link into in64asc

  LDR X0, =szTab
  BL putstring // branch link to putstring and print out szAddress

  LDR X0, =dbB // load the address 
  MOV X2, #8 // load the address of szSum into X0
  BL hex64asc // branch link into in64asc

  LDR X0, =szTab
  BL putstring // branch link to putstring and print out szAddress

  LDR X0, =dbC // load the address 
  MOV X2, #8 // load the address of szSum into X0
  BL hex64asc // branch link into in64asc

  LDR X0, =szTab
  BL putstring // branch link to putstring and print out szAddress

  LDR X0, =dbD // load the address 
  MOV X2, #8 // load the address of szSum into X0
  BL hex64asc // branch link into in64asc

  LDR X0, =szTab
  BL putstring // branch link to putstring and print out szAddress

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  MOV  X0, #0   // Setup the parameters to exit the program
  MOV  X8, #93  // and then call Linux to do it.

  SVC  0 // use 0 return code
