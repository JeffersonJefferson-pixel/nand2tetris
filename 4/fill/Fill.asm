// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.


@RESET
0;JMP

(LOOP)
  // pos = pos - 1
  @pos
  M=M-1
  // if pos < 0 goto RESET
  @pos
  D=M
  @RESET
  D;JLT
  // if (key is not pressed) goto WHITE
  @KBD
  D=M
  @WHITE
  D;JEQ
  // goto BLACK 
  @BLACK
  0;JMP


(WHITE)
  // color = 0
  @color
  M=0
  // goto PAINT
  @PAINT
  0;JMP

(BLACK)
  // color = 0
  @color
  M=-1
  // goto PAINT
  @PAINT
  0;JMP

(PAINT)
  // set screen to color
  @color
  D=M
  @pos
  A=M
  M=D
  @LOOP
  0;JMP

(RESET) 
  // color = 0
  @color
  M=0
  // pos = SCREEN + 8192
  @SCREEN
  D=A
  @8192
  D=D+A
  @pos
  M=D
  @LOOP
  0;JMP