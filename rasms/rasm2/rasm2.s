//*****************************************************************************
// Name: Carlos Aguilera
// Program: RASM2.s
// Class: CS 3B
// Lab: RASM2
// Date: March 10, 2024 at 8:21 PM
// Purpose:
//  Input numeric information from the keyboard, perform addition, subtraction,
//  multiplication, and division. Check for overflow upon all operations.
//*****************************************************************************

// set global start as the main entry
  .global _start

  .equ BUFFER, 21

  .section .data


  szName:    .asciz   "    Name:      Carlos Aguilera"
  szProgram: .asciz   "    Program:   rasm2.s"
  szClass:   .asciz   "    Class:     CS 3B"
  szDate:    .asciz   "    Date:      March 10, 2024"

  chCr: .byte 10

  .section .text
_start:
  // ---------------------- PRINT HEADER ----------------------- //
  LDR X0, =szName // load the address of szName into X0
  BL putstring // branch link to putstring and print out szName

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  LDR X0, =szProgram // load the address of szProgram into X0
  BL putstring // branch link to putstring and print out szProgram

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  LDR X0, =szClass // load the address of szClass into X0
  BL putstring // branch link to putstring and print out szClass

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  LDR X0, =szDate // load the address of szDate into X0
  BL putstring // branch link to putstring and print out szDate

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  LDR X0, =chCr // load the address of chCr into X0
  BL putch // branch link to putch and print out chCr

  // ---------------------- END PROGRAM ----------------------- //
  MOV   X0, #0      // Use 0 return code
  MOV   X8, #93  // Service Command Code 93 terminates this program
  SVC   0           // Call linux to terminate the program
