// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// Set R2 to R0*R1

// 初始化R2
@2 // 取得R2的位置
M=0 // 將R2的值設為0

(LOOP) // 進入無限迴圈
    // 檢查R0是否小於等於0，如果是的話就跳出迴圈
    @0 // 取得R0的位置
    D=M // 取得R0的值
    @exit1 // 如果R0<=0，則跳出迴圈
    D;JLE

    // 將R1的值加到R2上
    @1 // 取得R1的位置
    D=M // 取得R1的值
    @2 // 取得R2的位置
    M=D+M // 將R1的值加到R2上

    // 將R0的值減1
    @0 // 取得R0的位置
    D=M // 取得R0的值
    @0 // 取得R0的位置
    M=1 // 將R0設為1
    M=D-M // 將R0減1

@LOOP // 跳回迴圈開始
0;JMP

(exit1) // 迴圈結束
@exit1 // 跳到exit1