//*****************************************************************************
// Name: Carlos Aguilera and Shiv
// Program: RASM3.s
// Class: CS 3B
// Lab: RASM3
// Date: March 30, 2024 at 9:04 PM
// Purpose:
//    DO SOMETHING LOL
//*****************************************************************************

// set global start as the main entry
  .global _start

  .equ BUFFER, 512

  .section .data

  szBuffer:  .skip BUFFER

  szTest1: .asciz   "Cat in the hat."
  szTest2: .asciz   "Green eggs and ham."
  szTest3: .asciz   "cat in the hat."

  szStringIndexOf1:  .asciz "String_indexOf_1(s2,'g') = "
  szStringIndexOf2:  .asciz "String_indexOf_2(s2,'g',9) = "
  szStringIndexOf3:  .asciz "String_indexOf_3(s2,\"eggs\") = "

  szStringLastIndexOf1:  .asciz "String_lastIndexOf_1(s2,'g') = "
  szStringLastIndexOf2:  .asciz "String_lastIndexOf_2(s2,'g',6) = "
  szStringLastIndexOf3:  .asciz "String_lastIndexOf_3(s2,\"eggs\") = "

  szStringReplace:      .asciz "String_replace(s1,'a','o') =  "
  szStringToLower:      .asciz "String_toLowerCase(s1) = "
  szStringToUpper:      .asciz "String_toUpperCase(s1) = "
  szStringConcatSpace:  .asciz "String_concat(s1, " ");"
  szStringConcat:       .asciz "String_concat(s1, s2) = "

  szEggTest:  .asciz "egg"
  szSpaceTest:  .asciz " "

  chCr: .byte 10

  .section .text

convert_and_print_number:
  STR X30, [SP, #-16]! // push link register onto the stack

  LDR X1, =szBuffer   // load the address of szBuffer into X0
  BL int64asc         // branch link to int64asc

  LDR X0, =szBuffer   // load the address of szBuffer into X0
  BL putstring

  LDR X0, =chCr  // load the address of chCr into X0
  BL putch       // branch link to putch and print out chCr

  LDR X30, [SP], #16 // pop link register off the stack

  RET

_start:
  // ----------------------- TEST #13 --------------------------- //
  LDR X0, =szStringIndexOf1   // load the address of szStringIndexOf1 into X0
  BL putstring

  LDR X0, =szTest2     // load the address of szTest2 into X0
  MOV X1, #103         // move 'g' into X1
  BL String_indexOf_1

  MOV X0, X0  // set param for convert_and_print_number
  BL convert_and_print_number

  // ----------------------- TEST #14 --------------------------- //
  LDR X0, =szStringIndexOf2   // load the address of szStringIndexOf1 into X0
  BL putstring

  LDR X0, =szTest2     // load the address of szTest2 into X0
  MOV X1, #103         // move 'g' into X1
  MOV X2, #9           // move 9 into X2
  BL String_indexOf_2

  MOV X0, X0  // set param for convert_and_print_number
  BL convert_and_print_number

  // ----------------------- TEST #15 --------------------------- //
  LDR X0, =szStringIndexOf3   // load the address of szStringIndexOf1 into X0
  BL putstring

  LDR X0, =szTest2      // load the address of szTest2 into X0
  LDR X1, =szEggTest    // load the address of szEggTest into X0
  BL String_indexOf_3

  MOV X0, X0  // set param for convert_and_print_number
  BL convert_and_print_number

  // ----------------------- TEST #16 --------------------------- //
  LDR X0, =szStringLastIndexOf1   // load the address of szStringIndexOf1 into X0
  BL putstring

  LDR X0, =szTest2     // load the address of szTest2 into X0
  MOV X1, #103         // move 'g' into X1
  BL String_lastIndexOf_1

  MOV X0, X0  // set param for convert_and_print_number
  BL convert_and_print_number

  // ----------------------- TEST #17 --------------------------- //
  LDR X0, =szStringLastIndexOf2   // load the address of szStringIndexOf1 into X0
  BL putstring

  LDR X0, =szTest2     // load the address of szTest2 into X0
  MOV X1, #103         // move 'g' into X1
  MOV X2, #6           // move 9 into X2
  BL String_lastIndexOf_2

  MOV X0, X0  // set param for convert_and_print_number
  BL convert_and_print_number

  // ----------------------- TEST #18 --------------------------- //
  LDR X0, =szStringLastIndexOf3   // load the address of szStringLastIndexOf3 into X0
  BL putstring

  LDR X0, =szTest2         // load the address of szTest2 into X0
  LDR X1, =szEggTest       // load the address of szEggTest into X0
  BL String_lastIndexOf_3

  MOV X0, X0  // set param for convert_and_print_number
  BL convert_and_print_number

  // ----------------------- TEST #19 --------------------------- //
  LDR X0, =szStringReplace   // load the address of szStringLastIndexOf3 into X0
  BL putstring

  LDR X0, =szTest1         // load the address of szTest2 into X0
  MOV X1, #97              // load the address of szEggTest into X0
  MOV X2, #111              // load the address of szEggTest into X0
  BL String_replace

  MOV X0, X0  // set param for putstring
  BL putstring 

  LDR X0, =chCr  // load the address of chCr into X0
  BL putch       // branch link to putch and print out chCr

  // ----------------------- TEST #20 --------------------------- //
  LDR X0, =szStringToLower   // load the address of szStringLastIndexOf3 into X0
  BL putstring

  LDR X0, =szTest1         // load the address of szTest2 into X0
  BL String_toLowerCase 

  MOV X0, X0  // set param for putstring
  BL putstring 

  LDR X0, =chCr  // load the address of chCr into X0
  BL putch       // branch link to putch and print out chCr

  // ----------------------- TEST #21 --------------------------- //
  LDR X0, =szStringToUpper   // load the address of szStringLastIndexOf3 into X0
  BL putstring

  LDR X0, =szTest1         // load the address of szTest2 into X0
  BL String_toUpperCase 

  MOV X0, X0  // set param for putstring
  BL putstring 

  LDR X0, =chCr  // load the address of chCr into X0
  BL putch       // branch link to putch and print out chCr

  // ----------------------- TEST #22 --------------------------- //
  LDR X0, =szStringConcatSpace   // load the address of szStringLastIndexOf3 into X0
  BL putstring

  LDR X0, =chCr  // load the address of chCr into X0
  BL putch       // branch link to putch and print out chCr

  LDR X0, =szStringConcat   // load the address of szStringLastIndexOf3 into X0
  BL putstring

  LDR X0, =szTest1       // load the address of szTest2 into X0
  LDR X1, =szSpaceTest         // load the address of szTest2 into X0
  BL String_concat 

  LDR X1, =szTest2  // load the address of szTest2 into X0
  BL String_concat 

  MOV X0, X0  // set param for putstring
  BL putstring 

  LDR X0, =chCr  // load the address of chCr into X0
  BL putch       // branch link to putch and print out chCr

  MOV   X0, #0   // Use 0 return code
  MOV   X8, #93  // Service Command Code 93 terminates this program
  SVC   0        // Call linux to terminate the program
