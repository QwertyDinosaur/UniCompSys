// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// Set R2 value to 0
@R2
M=0

// If R1 value = 0, jump to end
@R1
D=M
@END
D;JEQ

// If R0 value = 0, jump to end 
@R0
D=M
@END
D;JEQ

// Set temp to the amount of times to loop via value of R0, negate on iteration in loop
@temp
M=D

(LOOP)
    // Get value of R1, store in D
    @R1
    D=M

    // Set value of D to value of R2 + whatever the value of M already is (sum)
    @R2
    M=M+D

    // Negate 1 from the temp value to keep track of amount of times to loop
    @temp
    M=M-1
    D=M

    // If temp value is greater than 0, loop back and do again
    @LOOP
    D;JGT

(END)
    // Infinite loop to end
    @END
    0;JMP
