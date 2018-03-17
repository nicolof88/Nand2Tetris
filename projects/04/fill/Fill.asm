// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Variable declaration
	@color
	M=0			// Set initial color to 0 (white)

	@SCREEN
    D=A
    @screen
    M=D         // Screen address: 16384

	@KBD
    D=A
    @kbd
    M=D         // Keyboard address: 24576

    @8191
    D=A
    @height
    M=D         // Full height of the screen

	@i
    M=0         // Reinitialize Loop index: i=0

// Loop to check the keyboard input and put into a variable
  (LOOP)
    @SCREEN
    D=A
    @screen
    M=D         // Re-Set screen address: 16384

	@KBD
    D=A
    @kbd
    M=D         // Re-Set Keyboard address: 24576

    @kbd
	A=M			
	D=M			// Get keyboard key

	@i
    M=0         // Reinitialize Loop index: i=0

	@CHANGECOLOR
	D;JNE		// If the key is not 0, then goto CHANGECOLOR
    
	@LOOP
    0;JMP		// Infinite loop


// Change color when key is pressed
  (CHANGECOLOR)
	@color
	M=!M
	@FILLSCREEN
	0;JMP		// Toggle the color between -1 and 0 (black and white), then goto FILLSCREEN with that color


// Fill the screen with the color
  (FILLSCREEN)
    @i
    D=M
    @height
    D=D-M
    @LOOP
    D;JGT       // if i>height then all screen is filled, goto LOOP again to check keyboard

	@color
	D=M
    @screen
    A=M
    M=D        // RAM[screen] = color (0 or -1, black or white)

    @i
    M=M+1       // i++
    
    @1
    D=A
    @screen
    M=D+M       // screen = screen + 1
    @FILLSCREEN
    0;JMP       // goto FILLSCREEN again until the whole screen is filled 