// Programmer: Carlos Aguilera
// Factorial
// Purpose: return the factorial of a number in X0
// Author: Carlos Aguilera
// Date Last Modified: 04/04/24

// set global factorial as the main entry
  .global factorial

  .section .text

// Subroutine factorial:
//      return the factorial of a number in X0
// X0: Must contain the integer to perform factorial on
// LR: Must contain the return address
// All AAPCS required registers are preserved,  r19-r29 and SP.
factorial:
  STR X30, [SP, #-16]! // push link register onto the stack

  ADD X0, X0, #5  // X0 = X0 + 5

  LDR X30, [SP], #16 // pop link register off the stack
  
  RET // return from function
