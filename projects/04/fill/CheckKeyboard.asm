// Program: CheckKeyboard.asm checks for the input from the keyboard
// on RAM[24576], and toggles variable color to 0 or -1
// Usage: Press a key on the keyboard

// Variable declaration
    @KBD
    D=A
    @kbd
    M=D         // Keyboard address: 24576

	@color
	M=0			// Set initial color to 0

// Loop to check the keyboard input and put into a variable
  (LOOP)
    @kbd
	A=M			
	D=M			// Get keyboard key


	@CHANGECOLOR
	D;JNE		// If the key is not 0,  then goto CHANGECOLOR
    
	@LOOP
    0;JMP		// Infinite loop

  (CHANGECOLOR)
	@color
	M=!M
	@LOOP
	0;JMP		// Toggle the color between -1 and 0 (black and white) and go back to check the keyboard
