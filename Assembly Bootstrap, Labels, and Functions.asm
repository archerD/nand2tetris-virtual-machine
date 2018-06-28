(bootstrap)
    @256    // load value for stack pointer
    D=A     // store value in D
    @SP     // load stack pointer
    M=D     // set stack pointer to 256
    @Sys.init // load jump address
    0;JMP   // jump to the Sys.init function

(label)
(functionName$label) // insert label

(goto)
    @functionName$label // load label
    0;JMP   // jump to label

(if-goto)
    @SP     // load stack pointer
    AM=M-1  // decrement stack pointer and load it into address register
    D=M     // pop data of the stack
    @functionName$label // load jump address
    D;JNE   // jump when D!=0, or D!=False

(function)
(functionName) //insert label for the name
    @0      // set A=0
    D=A     // setup D to push the local variables onto the stack
    //repeat nVar times
    push from D onto stack

(call)
    @rtnX   // push return address
    D=A     // store in D
    push D  // sudo
    @LCL    // push local
    D=M     // store in D
    push D  // sudo
    @ARG    // push argument
    D=M     // store in D
    push D  // sudo
    @THIS   // push this
    D=M     // store in D
    push D  // sudo
    @THAT   // push that
    D=M     // store in D
    push D  // sudo
    @SP     // find new arg and lcl, starting with stack pointer
    D=M     // store in D
    @LCL    // LCL pointer calculated, load pointer
    M=D     // store new LCL pointer
    @(nArgs+5) // constant, nArgs from the call command
    D=D-A   // calculate the new ARG pointer
    @ARG    // load pointer
    M=D     // store the new pointer into memory
    @functionName // load function jump address
    0;JMP   // jump to the function
(rtnX) // insert return address label

(return)
    // move return value
    pop D   //sudo, pop return value into D
    @R14    // load pointer for return value location
    M=D     // cache return value in R14 until later
    // restore stack pointer
    @ARG
    D=M     // get new SP location, we will push the return value before jumping
    @SP     // load pointer
    M=D     // save pointer to memory
    // locate pointers and restore them
    @LCL    // load LCL
    D=M     // cache LCL value in D
    @R13    // load R13
    AM=D-1  // cache LCL-1 into R13, and get location for THAT
    D=M     // store THAT pointer in D
    @THAT   // load THAT pointer
    M=D     // save the new pointer to memory
    @R13    // load frame location
    AM=M-1  // update frame, and get location for THIS
    D=M     // store THIS pointer in D
    @THIS   // load THIS pointer
    M=D     // save the new pointer to memory
    @R13    // load frame location
    AM=M-1  // update frame, and get location for ARG
    D=M     // store ARG pointer in D
    @ARG    // load ARG pointer
    M=D     // save the new pointer to memory
    @R13    // load frame location
    AM=M-1  // update frame, and get location for LCL
    D=M     // store LCL pointer in D
    @LCL    // load LCL pointer
    M=D     // save the new pointer to memory
    // return value and address shuffle
    @R13    // load frame location
    AM=M-1  // update frame, and get location for the return address
    D=M     // store return address in D for jump
    @R13    // store the return address in R13
    M=D     // cache return address
    @R14    // get the return value
    D=M     // move it into D
    push D  //sudo
    @R13    // unpack return address for jump
    A=M     // unpack
    0;JMP   // jump to calling function