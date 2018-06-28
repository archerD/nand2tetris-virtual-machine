//--Begin file 'FibonacciSeries' translation--//
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
// pop pointer 1
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @R4      //load register address
    M=D     //set address to the value
// push constant 0
    @0      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// pop that 0
    @0      //load index
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
// push constant 1
    @1      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// pop that 1
    @1      //load index
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
// push constant 2
    @2      //load constant
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
// label MAIN_LOOP_START
(null$MAIN_LOOP_START) // insert the label into the code
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
// if-goto COMPUTE_ELEMENT
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @null$COMPUTE_ELEMENT // load jump address
    D;JNE   // jump when D==0, or D!=False
// goto END_PROGRAM
    @null$END_PROGRAM // load label
    0;JMP   // jump to label
// label COMPUTE_ELEMENT
(null$COMPUTE_ELEMENT) // insert the label into the code
// push that 0
    @0      //load index
    D=A     //store the index in D
    @THAT   //load segment
    A=M+D   //compute address
    D=M     //store value in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push that 1
    @1      //load index
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
// push pointer 1
    @R4      //load register address
    D=M     //set D to the value
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
// add
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    M=M+D   //add values
// pop pointer 1
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @R4      //load register address
    M=D     //set address to the value
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
// goto MAIN_LOOP_START
    @null$MAIN_LOOP_START // load label
    0;JMP   // jump to label
// label END_PROGRAM
(null$END_PROGRAM) // insert the label into the code
