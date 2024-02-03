// Programmer: Carlos Aguilera
// Lab #3
// Purpose: print 10 + 15 = 25
// Author: Carlos Aguilera
// Date Last Modified: 01/30/24

// set global start as the main entry
.global _start

_start:
  // ----------------- PRINT 10 + 15 = ------------------ //
  LDR X0, =szX  // load the address of szX in register X0
  BL putstring  // branch link to subroutine putstring

  LDR X0, =szPlus // load the address of szPlus in register X0
  BL putstring    // branch link to subroutine putstring

  LDR X0, =szY // load the address of szY in register X0
  BL putstring // branch link to subroutine putstring

  LDR X0, =szEqual  // load the address of szY in register X0
  BL putstring      // branch link to subroutine putstring

  // ----------------- PRINT 10 + 15 = ------------------ //

  // ----------------- COMPUTE RESULT ------------------ //

  LDR X0, =szX  // load the address of szX in register X0
  BL ascint64   // branch link to subroutine ascint64
  LDR X1, =dbX
  STR X0, [X1]  // store the returned value into dbX

  LDR X0, =szY  // load the address of szY in register X0
  BL ascint64   // branch link to subroutine ascint64
  LDR X1, =dbY
  STR X0, [X1]  // store the returned value into dbY

  LDR X0, =dbX  // load the address of dbX in register X0
  LDR X0, [X0]

  LDR X1, =dbY  // load the address of dbY in register X1
  LDR X1, [X1]

  ADD X2, X0, X1 // X2 = X0 + X1
  LDR X3, =dbSum
  STR X2, [X3] // store the value of X2 in dbSum

  // ----------------- COMPUTE RESULT ------------------ //

  // ----------------- PRINT RESULT ------------------ //

  LDR X0, =dbSum
  LDR X0, [X0]
  LDR X1, =szSum
  BL int64asc

  MOV X0, X1  // load the value of X1 in register X0
  BL putstring  // branch link to subroutine putstring

  LDR X0, =chCr // load the address of chCr in register X0
  BL putch      // branch link to subroutine putch

  MOV  X0, #0   // Setup the parameters to exit the program
  MOV  X8, #93  // and then call Linux to do it.

  SVC  0 // use 0 return code

.data
  szX: .asciz "10"
  szY: .asciz "15"
  szSum: .skip 21
  szPlus: .asciz " + "
  szEqual: .asciz " = "
  dbX: .quad 0
  dbY: .quad 0
  dbSum: .quad 0
  chCr: .byte 10
