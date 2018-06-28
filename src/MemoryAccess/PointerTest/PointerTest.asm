// push constant 3030
    @3030      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// pop pointer 0
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @R3      //load register address
    M=D     //set address to the value
// push constant 3040
    @3040      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// pop pointer 1
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @R4      //load register address
    M=D     //set address to the value
// push constant 32
    @32      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// pop this 2
    @2      //load index
    D=A     //store index in D
    @THIS   //load segment
    D=M+D   //compute address
    @R13    //load vm register, R13
    M=D     //store the address in R13
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @R13    //retrieve the address
    A=M     //put the address into A
    M=D     //place D into M
// push constant 46
    @46      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// pop that 6
    @6      //load index
    D=A     //store index in D
    @THAT   //load segment
    D=M+D   //compute address
    @R13    //load vm register, R13
    M=D     //store the address in R13
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @R13    //retrieve the address
    A=M     //put the address into A
    M=D     //place D into M
// push pointer 0
    @R3      //load register address
    D=M     //set D to the value
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push pointer 1
    @R4      //load register address
    D=M     //set D to the value
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// add
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    M=M+D   //add values
// push this 2
    @2      //load index
    D=A     //store the index in D
    @THIS   //load segment
    A=M+D   //compute address
    D=M     //store value in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// sub
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    M=M-D   //add values
// push that 6
    @6      //load index
    D=A     //store the index in D
    @THAT   //load segment
    A=M+D   //compute address
    D=M     //store value in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// add
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    M=M+D   //add values
