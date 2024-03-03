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
  foreach_in_3:
    LDR X0, =szEnterX // load the address of szEnterX into X0
    BL putstring // branch link into getstring

    LDR X0, =szBuffer // load the address of szBuffer into X0
    MOV X1, BUFFER // mov the value of BUFFER into X1
    BL getstring // branch link into getstring

    LDR X0, =szBuffer // load the address of szBuffer into X0
    BL ascint64 // branch link into ascint64

    LDR X1, =dbX // load the address of dbX into X1
    STR X0, [X1] // load the value of X0 into the address pointed by X1

    LDR X0, =szEnterY // load the address of szEnterY into X0
    BL putstring // branch link into getstring

    LDR X0, =szBuffer // load the address of szBuffer into X0
    MOV X1, BUFFER // mov the value of BUFFER into X1
    BL getstring // branch link into getstring

    LDR X0, =szBuffer // load the address of szBuffer into X0
    BL ascint64 // branch link into ascint64

    LDR X1, =dbY // load the address of dbY into X1
    STR X0, [X1] // load the value of X0 into the address pointed by X1

    LDR X0, =dbX // load the address of X0 into X0
    LDR X0, [X0] // load the value of X0 into X0

    LDR X1, =dbY // load the address of dbY into X1
    LDR X1, [X1] // load the value of X1 into X1

    CMP X0, X1 // X0 - X1 = a value which is stored into the CPSR register
    BGT x_greater // branch greater than
    BLT y_greater // branch less than
    BEQ equal // branch equal to

    x_greater:
      LDR X0, =szXgreater // load the address of szXgreater into X0
      BL putstring // branch link to putstring

      LDR X0, =dbX // load the address of dbX into X0
      LDR X0, [X0] // load the value pointed to by X0 into X0
      LDR X1, =szBuffer // load the address of szBuffer into X1
      BL int64asc // branch link to int64asc

      LDR X0, =szBuffer // load the address of szBuffer into X1
      BL putstring // branch link to putstring

      LDR X0, =szGreaterOp // load the address of szBuffer into X1
      BL putstring // branch link to putstring

      LDR X0, =dbY // load the address of dbY into X0
      LDR X0, [X0] // load the value pointed to by X0 into X0
      LDR X1, =szBuffer // load the address of szBuffer into X1
      BL int64asc // branch link to int64asc

      LDR X0, =szBuffer // load the address of szBuffer into X1
      BL putstring // branch link to putstring

      B end_comparison // branch to end_comparison

    y_greater:
      LDR X0, =szYgreater // load the address of szXgreater into X0
      BL putstring // branch link to putstring

      LDR X0, =dbY // load the address of dbY into X0
      LDR X0, [X0] // load the value pointed to by X0 into X0
      LDR X1, =szBuffer // load the address of szBuffer into X1
      BL int64asc // branch link to int64asc

      LDR X0, =szBuffer // load the address of szBuffer into X1
      BL putstring // branch link to putstring

      LDR X0, =szGreaterOp // load the address of szBuffer into X1
      BL putstring // branch link to putstring

      LDR X0, =dbX // load the address of dbX into X0
      LDR X0, [X0] // load the value pointed to by X0 into X0
      LDR X1, =szBuffer // load the address of szBuffer into X1
      BL int64asc // branch link to int64asc

      LDR X0, =szBuffer // load the address of szBuffer into X1
      BL putstring // branch link to putstring

      B end_comparison // branch to end_comparison

    equal:
      LDR X0, =szEqual // load the address of szXgreater into X0
      BL putstring // branch link to putstring

      LDR X0, =dbY // load the address of dbY into X0
      LDR X0, [X0] // load the value pointed to by X0 into X0
      LDR X1, =szBuffer // load the address of szBuffer into X1
      BL int64asc // branch link to int64asc

      LDR X0, =szBuffer // load the address of szBuffer into X1
      BL putstring // branch link to putstring

      LDR X0, =szEqualOp // load the address of szBuffer into X1
      BL putstring // branch link to putstring

      LDR X0, =dbX // load the address of dbX into X0
      LDR X0, [X0] // load the value pointed to by X0 into X0
      LDR X1, =szBuffer // load the address of szBuffer into X1
      BL int64asc // branch link to int64asc

      LDR X0, =szBuffer // load the address of szBuffer into X1
      BL putstring // branch link to putstring

      B end_comparison // branch to end_comparison

      end_comparison:
        LDR X0, =chCr // load the address of szBuffer into X1
        BL putch // branch link to putstring

        MOV X10, #2 // move the value of 2 into X10
        CMP X15, X10 // X15 - X10 result stored in CPSR register
        ADD X15, X15, #1 // X15 = X15 + 1
        BLT foreach_in_3 // branch less than to foreach_in_3

  MOV  X0, #0   // Setup the parameters to exit the program
  MOV  X8, #93  // and then call Linux to do it.

  SVC  0 // use 0 return code

  .data
  szEnterX: .asciz "Enter x: "
  szEnterY: .asciz "Enter y: "
  szXgreater: .asciz "x > y : "
  szYgreater: .asciz "y > x : "
  szEqual: .asciz "x == y : "
  szEqualOp: .asciz " == "
  szGreaterOp: .asciz " > "
  szBuffer: .skip BUFFER
  dbX:  .quad   0
  dbY:  .quad   0
  chCr:   .byte   10
