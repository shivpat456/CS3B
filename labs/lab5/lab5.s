// Programmer: Carlos Aguilera
// Lab #5
// Purpose: print 100 - -10000 + 10000000 - -10000000000 = (the actual result)
// Author: Carlos Aguilera
// Date Last Modified: 02/04/24

// set global start as the main entry
  .global _start
  .section .text

_start:
  // ----------------- SET DATA ------------------ //
  LDR X0, =szAskA
  BL putstring

  LDR X0, =szA
  MOV X1, #21
  BL getstring

  // ----------------- COMPUTE RESULT ------------------ //


  // ----------------- PRINT RESULT ------------------ //


  MOV  X0, #0   // Setup the parameters to exit the program
  MOV  X8, #93  // and then call Linux to do it.

  SVC  0 // use 0 return code

  .data
  szA: .skip 21
  szB: .skip 21
  szC: .skip 21
  szD: .skip 21
  dbSum: .quad 0
  szTemp: .skip 21
  szPlus: .asciz " + "
  szEqual: .asciz " = "
  szAskA: .asciz "Enter A: "
  szAskB: .asciz "Enter B: "
  szAskC: .asciz "Enter C: "
  szAskD: .asciz "Enter D: "
  chCr: .byte 10
