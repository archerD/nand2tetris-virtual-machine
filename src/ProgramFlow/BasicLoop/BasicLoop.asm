//--Begin file 'BasicLoop' translation--//
// push constant 0
    @0      //load constant
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
// label LOOP_START
(null$LOOP_START) // insert the label into the code
// push argument 0
    @0      //load index
    D=A     //store the index in D
    @ARG    //load segment
    A=M+D   //compute address
    D=M     //store value in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
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
// add
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    M=M+D   //add values
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
// push argument 0
    @0      //load index
    D=A     //store the index in D
    @ARG    //load segment
    A=M+D   //compute address
    D=M     //store value in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 1
    @1      //load constant
    D=A     //store constant in D
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
// pop argument 0
    @0      //load index
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
// push argument 0
    @0      //load index
    D=A     //store the index in D
    @ARG    //load segment
    A=M+D   //compute address
    D=M     //store value in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// if-goto LOOP_START
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @null$LOOP_START // load jump address
    D;JNE   // jump when D==0, or D!=False
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
