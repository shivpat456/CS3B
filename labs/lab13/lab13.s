// Programmer: Carlos Aguilera
// Lab #13
// Purpose: Write the string "cat in the hat" to a text file "output.txt".
// Author: Carlos Aguilera
// Date Last Modified: 04/05/24

// set global start as the main entry
  .global _start

  .equ buffer, 21
  .equ dfd, -100
  .equ mode, 0101
  .equ permissions, 0660

  .data
    szFilename: .asciz "output.txt"
    szString:   .asciz "cat in the hat\n"


  .section .text

_start:
  MOV X0, #dfd          // load the address of filename into X0
  LDR X1, =szFilename   // load the address of filename into X0
  MOV X2, #mode         // load mode into X0
  MOV X3, #permissions  // give read write perms
  MOV X8, #56           // sys call openat
  SVC #0                // call sys

  MOV X29, X0  // store file descriptor

  MOV X0, X29        // get file descriptor set it to second param of write sys call
  LDR X1, =szString  // load the address of szString into X0
  MOV X2, #15        // move the value of 15 into X2
  MOV X8, #64        // sys call write
  SVC #0             // call sys

  MOV X0, X29    // get file descriptor
  MOV X8, #0x39  // sys call save
  SVC #0         // call sys

  MOV  X0, #0   // Setup the parameters to exit the program
  MOV  X8, #93  // and then call Linux to do it.

  SVC  0 // use 0 return code
