// Programmer: Carlos Aguilera
// Lab #7
// Purpose: Write a program that prompts the user for two (2) 64 bit signed numbers and displays the largest of the two. Execute a for loop that runs three times.
// Author: Carlos Aguilera
// Date Last Modified: 03/01/24

// set global start as the main entry
  .global _start

  .equ BUFFER, 21

  .section .text

_start:
  MOV X15, #0
  foreach_in_10_input: // {
    LDR X0, =szEnterIndex // load the address of szEnterX into X0
    BL putstring // branch link into putstring

    MOV X0, X15 // move the value of X15 into X0
    LDR X1, =szBuffer // load the address of szBuffer into X0
    BL int64asc // branch link into int64asc

    LDR X0, =szBuffer // load the address of szBuffer into X0
    BL putstring // branch link into putstring

    LDR X0, =szColon // load the address of szColon into X0
    BL putstring // branch link into putstring

    LDR X0, =szBuffer // load the address of szBuffer into X0
    MOV X1, BUFFER // mov the value of BUFFER into X1
    BL getstring // branch link into getstring

    LDR X0, =szBuffer // load the address of szBuffer into X0
    BL ascint64 // branch link into ascint64

    LDR X1, =dbArray // load the address of dbArray into X1
    MOV X3, #8 // move the value of 8 into X3
    MUL X2, X15, X3 // X2 = X15 * X3
    STR X0, [X1, X2] // store the value of X0 into X1 shifted X2

    LDR X1, =dbSum // load the address of dbSum into X1
    LDR X1, [X1] // get value in X1 and load it into X1
    ADD X1, X1, X0 // X1 = X1 + X0

    LDR X0, =dbSum // load the address of dbSum into X0
    STR X1, [X0] // store the value of X1 into X0

    MOV X10, #9 // move the value of 2 into X10
    CMP X15, X10 // X15 - X10 result stored in CPSR register
    ADD X15, X15, #1 // X15 = X15 + 1
    BLT foreach_in_10_input // branch less than to foreach_in_3
  // }

  LDR X0, =chCr // load the address of szBuffer into X1
  BL putch // branch link to putstring

  MOV X15, #0
  foreach_in_10_print: // {
    LDR X1, =dbArray // load the address of dbArray into X1
    MOV X3, #8 // move the value of 8 into X3
    MUL X2, X15, X3 // X2 = X15 * X3
    LDR X0, [X1, X2] // load the value of X1 shifted X2 into X0

    // X0 previously calculated
    LDR X1, =szBuffer // load the address of szBuffer into X1
    BL int64asc // branch link into int64asc

    LDR X0, =szBuffer // load the address of szBuffer into X1
    BL putstring // branch link into putstring

    LDR X0, =szPlus // load the address of szPlus into X1
    BL putstring // branch link into putstring

    MOV X10, #9 // move the value of 2 into X10
    CMP X15, X10 // X15 - X10 result stored in CPSR register
    ADD X15, X15, #1 // X15 = X15 + 1
    BLT foreach_in_10_print // branch less than to foreach_in_3
  // }

  LDR X0, =szEquals // load the address of szPlus into X1
  BL putstring // branch link into putstring

  LDR X0, =dbSum // load the address of dbSum into X0
  LDR X0, [X0] // load the value pointed by X0 into X0
  LDR X1, =szBuffer // load the address of szBuffer into X1
  BL int64asc // branch link into int64asc

  LDR X0, =szBuffer // load the address of szBuffer into X1
  BL putstring // branch link into putstring

  LDR X0, =chCr // load the address of szBuffer into X1
  BL putch // branch link to putstring

  MOV  X0, #0   // Setup the parameters to exit the program
  MOV  X8, #93  // and then call Linux to do it.

  SVC  0 // use 0 return code

  .data
  szEnterIndex: .asciz "Enter Index "
  szColon: .asciz ": "
  szPlus: .asciz " + "
  szEquals: .asciz " = "
  szBuffer: .skip BUFFER
  dbArray:  .quad   0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  dbSum:  .quad   0
  chCr:   .byte   10
