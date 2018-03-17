// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Initialize variables
    @R0
    D=M
    @cum
    M=D       // Initialize cumulative sum to R0: cum = R0

    @R0
    D=M
    @sum
    M=D       // Initialize the value to sum to R0: sum = R0

    @R1
    D=M
    @times
    M=D       // Number of times to sum R0 given by R1: times = R1

    @i
    M=1       // Initialize Index variable

// Loop over times and sum the result
  (LOOP)
    @R0
    D=M
    @ZERO
    D;JEQ     // if R0 = 0 then result is zero

    @R1
    D=M
    @ZERO
    D;JEQ     // if R1 = 0 then result is zero

    @i
    D=M
    @times
    D=D-M
    @STOP
    D;JEQ     // if i > times go to STOP to finish loop

    @sum
    D=M
    @cum
    D=D+M
    @cum
    M=D     // cum += sum
    @i
    M=M+1   // Increment i
    @LOOP
    0;JMP   // Start the loop over until i > times

// Output zero if one of the inputs is 0
  (ZERO)
    @R2
    M=0
    @END
    0;JMP

// Stop loop
  (STOP)
    @cum
    D=M
    @R2
    M=D     // Assign cumulative sum result to R2

// Terminate in infinite loop
  (END)
    @END
    0;JMP
