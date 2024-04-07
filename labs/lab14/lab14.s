// Programmer: Carlos Aguilera
// Lab #14
// Purpose: 
//      Manually add (text editor) the "line feed" and the line "Green eggs and ham."
//      to the next lines of your output.txt file.
// Author: Carlos Aguilera
// Date Last Modified: 04/06/24

// set global start as the main entry
  .global _start

  .equ buffer, 36
  .equ dfd, -100
  .equ mode, 0100
  .equ permissions, 0660

  .data
    szFilename: .asciz "output.txt"
    szBuffer:   .skip buffer
    chCr:       .byte   10
  .section .text

_start:
  MOV X0, #dfd          // mov dfd (current directory) into X0
  LDR X1, =szFilename   // load the address of filename into X0
  MOV X2, #mode         // load mode into X0
  MOV X3, #permissions  // give read write perms
  MOV X8, #56           // sys call openat
  SVC #0                // call sys

  MOV X29, X0  // store file descriptor

  MOV X0, X29        // get file descriptor set it to second param of write sys call
  LDR X1, =szBuffer  // load the address of szString into X0
  MOV X2, #buffer        // move the value of 15 into X2
  MOV X8, #63        // sys call write
  SVC #0             // call sys

  LDR X0, =szBuffer  // load the address of szBuffer into X0
  BL putstring       // branch link to putstring

  LDR X0, =chCr  // load the address of chCr into X0
  BL putch       // branch link to putch

  MOV X0, X29    // get file descriptor
  MOV X8, #0x39  // sys call close
  SVC #0         // call sys

  MOV  X0, #0   // Setup the parameters to exit the program
  MOV  X8, #93  // and then call Linux to do it.

  SVC  0 // use 0 return code
