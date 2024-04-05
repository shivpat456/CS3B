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

  CMP X0, #1      // X0 - 1 store result into CPSR registers
  B.EQ finshed    // branch if equals to finished

  STR X0, [SP, #-16]! // push X0 onto the stack

  SUB X0, X0, #1  // X0 = X0 - 1
  BL factorial    // branch link into factorial

  LDR X1, [SP], #16 // pop X0 off the stack into X1

  MUL X0, X0, X1  // multiply previous X1 by return value X0

  finshed:
    MOV X0, X0  // X0 = X0 (just my preference)

  LDR X30, [SP], #16 // pop link register off the stack
  
  RET // return from function
