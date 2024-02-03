// Programmer: Carlos Aguilera
// Lab #2
// Purpose: print The sun did not shine. and It was too wet to play.
// Author: Carlos Aguilera
// Date Last Modified: 01/26/24

// set global start as the main entry
.global _start

_start:
  // load the address of szMsg1 in register X0
  LDR X0, =szMsg1
  // branch link to subroutine putstring
  BL putstring

  // load the address of chCr in register X0
  LDR X0, =chCr
  // branch link to subroutine putch
  BL putch

  // load the address of szMsg1 in register X0
  LDR X0, =szMsg2
  // branch link to subroutine putstring
  BL putstring

  // load the address of chCr in register X0
  LDR X0, =chCr
  // branch link to subroutine putch
  BL putch

  // Setup the parameters to exit the program
  // and then call Linux to do it.
  MOV  X0, #0
  MOV  X8, #93

  // Use 0 return code
  // Service code 93
  SVC  0

.data
  szMsg1: .asciz "The sun did not shine."
  szMsg2: .asciz "It was too wet to play."
  chCr: .byte 10
