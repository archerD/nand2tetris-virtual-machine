// push constant 111
    @111      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 333
    @333      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 888
    @888      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// pop static 8
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @StaticTest.8      //load static address
    M=D     //set address to the value
// pop static 3
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @StaticTest.3      //load static address
    M=D     //set address to the value
// pop static 1
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @StaticTest.1      //load static address
    M=D     //set address to the value
// push static 3
    @StaticTest.3      //load static address
    D=M     //set D to the value
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push static 1
    @StaticTest.1      //load static address
    D=M     //set D to the value
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
// push static 8
    @StaticTest.8      //load static address
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
