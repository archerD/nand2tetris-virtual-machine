// the value index for all is x, the file for static is f

(pushConstant) x
    @x      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack

(pushStatic) x
    @f.x    //load static address
    D=M     //set D to the value
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack

(pushLocal) *
    @x      //load index
    D=A     //store the index in D
    @LCL    //load segment
    A=M+D   //compute address
    D=M     //store value in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack

(pushArgument) *
    @x      //load index
    D=A     //store the index in D
    @ARG    //load segment
    A=M+D   //compute address
    D=M     //store value in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack

(pushThis) *
    @x      //load index
    D=A     //store the index in D
    @THIS   //load segment
    A=M+D   //compute address
    D=M     //store value in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack

(pushThat) *
    @x      //load index
    D=A     //store the index in D
    @THAT   //load segment
    A=M+D   //compute address
    D=M     //store value in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack

(pushPointerTemp) x
    @R3     //load address, compute register in translator, "3+x" or "5+x"
    D=M     //set D to the value
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack

(popStatic) x
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @f.x    //load static address
    M=D     //put into static address

(popLocal) *
    @x      //load index
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

(popArgument) *
    @x      //load index
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

(popThis) *
    @x      //load index
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

(popThat) *
    @x      //load index
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

(popPointerTemp) x
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @R3     //load address, compute register in translator, "3+x" or "5+x"
    M=D     //put into static address
