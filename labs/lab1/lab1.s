//
// Assembler program to print "Carlos Aguilera"
// to stdout.
//
// X0-X2 - parameters to Linux function services
  
// X8 - Linux function number
.global _start // Provide program starting address
// Setup the parameters to print hello world
// and then call Linux to do it.
_start: 
     MOV  X0, #1 // 1 = StdOut
     LDR  X1, =name // string to print
     MOV  X2, #16
     MOV  X8, #64

     // length of our string
     // Linux write system
     // Call Linux to output
     SVC  0

     // Setup the parameters to exit the program
     // and then call Linux to do it.
     MOV  X0, #0
     MOV  X8, #93

     // Use 0 return code
     // Service code 93

     SVC  0

.data
name:
     .ascii  "Carlos Aguilera\n"
