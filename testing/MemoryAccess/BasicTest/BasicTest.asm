// push constant 10
    @10      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// pop local 0
    @0      //load index
    D=A     //store index in D
    @LCL    //load segment
    D=M+D   //compute address
    @R13    //load vm register, R13
    M=D     //store the address in R13
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @R13    //retrieve the address
    A=M     //put the address into A
    M=D     //place D into M
// push constant 21
    @21      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 22
    @22      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// pop argument 2
    @2      //load index
    D=A     //store index in D
    @ARG    //load segment
    D=M+D   //compute address
    @R13    //load vm register, R13
    M=D     //store the address in R13
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @R13    //retrieve the address
    A=M     //put the address into A
    M=D     //place D into M
// pop argument 1
    @1      //load index
    D=A     //store index in D
    @ARG    //load segment
    D=M+D   //compute address
    @R13    //load vm register, R13
    M=D     //store the address in R13
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @R13    //retrieve the address
    A=M     //put the address into A
    M=D     //place D into M
// push constant 36
    @36      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// pop this 6
    @6      //load index
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
// push constant 42
    @42      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 45
    @45      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// pop that 5
    @5      //load index
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
// pop that 2
    @2      //load index
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
// push constant 510
    @510      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// pop temp 6
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @R11      //load register address
    M=D     //set address to the value
// push local 0
    @0      //load index
    D=A     //store the index in D
    @LCL    //load segment
    A=M+D   //compute address
    D=M     //store value in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push that 5
    @5      //load index
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
// push argument 1
    @1      //load index
    D=A     //store the index in D
    @ARG    //load segment
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
// push this 6
    @6      //load index
    D=A     //store the index in D
    @THIS   //load segment
    A=M+D   //compute address
    D=M     //store value in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push this 6
    @6      //load index
    D=A     //store the index in D
    @THIS   //load segment
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
// sub
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    M=M-D   //add values
// push temp 6
    @R11      //load register address
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
