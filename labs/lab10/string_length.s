// Programmer: Carlos Aguilera
// String Length
// Purpose: return the length of a null terminated string
// Author: Carlos Aguilera
// Date Last Modified: 03/23/24

// set global string_length as the main entry
  .global string_length

  .section .text

// Subroutine String_length: Provided a pointer to a null terminated string, String_length will 
//      return the length of the string in X0
// X0: Must point to a null terminated string
// LR: Must contain the return address
// All AAPCS required registers are preserved,  r19-r29 and SP.
string_length:
  STR X30, [SP, #-16]! // push link register onto the stack

  MOV X1, #0  // move 0 into X1
  MOV X2, X0  // move the value of X0 into X2 (reason is we are trying to preserve X0)
  LOOP_TILL_NULL:
    LDRB W3, [X2, X1]  // load one byte from X2 with an offset of X1

    CMP W3, #0  // compare W3 and 0 store CPSR flags
    B.EQ LOOP_TILL_NULL_END  // branch equal to -> LOOP_TILL_NULL_END

    ADD X1, X1, #1  // X1 = X1 + 1
    MOV X2, X0  // move the value of X0 into X2 (again preserving null terminated string)
    B LOOP_TILL_NULL // unconditional jump to LOOP_TILL_NULL
  LOOP_TILL_NULL_END:
  
  MOV X0, X1  // set return value into X0

  LDR X30, [SP], #16 // pop link register off the stack
  
  RET // return from function
