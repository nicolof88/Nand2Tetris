// Program: Recatangle.asm draws a filled rectangle at the
// screen's top left corner, with width of 16 pixels and height
// of RAM[0] pixels
// Usage: Put a non-negative number in RAM[0]

// Variable declaration
    @SCREEN
    D=A
    @screen
    M=D         // Screen address: 16384

    @8191
    D=A
    @height
    M=D         // Full height of the screen

	@512
    D=M
    @width
    M=D         // Full width of the screen

    @i
    M=0         // Loop index: i=0

// Loop to change pixels inside the screen
  (LOOP)
    @i
    D=M
    @height
    D=D-M
    @END
    D;JGT       // if i>height goto END

    @screen
    A=M
    M=-1        // RAM[screen] = -1 (0b1111111111111111)

    @i
    M=M+1       // i++
    
    @1
    D=A
    @screen
    M=D+M       // screen = screen + 32
    @LOOP
    0;JMP       // goto LOOP again

  (END)
    @END
    0;JMP
