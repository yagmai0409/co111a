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

//這個程式主要是在檢查變數i是否在範圍16384~24576之間，如果是的話就把該位置的值改成color的值。

首先，它會將變數i的值設為16384，然後進入一個無限迴圈(LOOP)。接下來，它會比較i的值是否大於等於24576，如果是的話就跳出迴圈。

接下來，它會檢查color的值是否等於0，如果是的話就直接跳到迴圈的末尾(BREAK)，否則就將該位置的值改成-1。

最後，它會將i的值加1，然後跳回迴圈的開始繼續執行。一直執行到i的值大於等於24576為止。

// Put your code here.
(CHECK) // 檢查 變數i 是否在16384~24576範圍間 有的話變色
  @16384  // 將i的值設為16384
  D=A
  @i
  M=D
(LOOP) // 進入無限迴圈
  @24576 // 取得24576的值 
  D=A
  @i // 取得i的值
  D=M-D // 計算i-24576的差
  @FINISH // 如果i>=24576，則跳出迴圈
  D;JGE

  @color // 取得color的值
  M=0
  @24576 // 取得24576的值
  D=M
  @BREAK // 如果color=0，則跳到迴圈末尾 
  D;JEQ
  
  @color // 取得color的值
  M=-1
(BREAK)  // 迴圈末尾
  @color // 取得color的值
  D=M
  @i // 取得i的值
  A=M // 將i的值放入暫存器A中
  M=D // 將color的值寫入記憶體
  @i // 取得i的值
  M=M+1 // 將i的值加1
  @LOOP // 跳回迴圈開始
  0;JMP
(FINISH) // 迴圈結束
  @CHECK // 跳回CHECK標籤
  0;JMP