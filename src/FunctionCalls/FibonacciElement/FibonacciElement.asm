// bootstrap code
    @256    // load value for stack pointer
    D=A     // store value in D
    @SP     // load stack pointer
    M=D     // set stack pointer to 256
// call Sys.init 0
    @rtn0   // push return address
    D=A     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @LCL    // push local
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @ARG    // push argument
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @THIS   // push this
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @THAT   // push that
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @SP     // find new arg and lcl, starting with stack pointer
    D=M     // store in D
    @LCL    // LCL pointer calculated, load pointer
    M=D     // store new LCL pointer
    @5    // constant nArgs+5, nArgs from the call command
    D=D-A   // calculate the new ARG pointer
    @ARG    // load pointer
    M=D     // store the new pointer into memory
    @Sys.init // load function jump address
    0;JMP   // jump to the function
(rtn0) // insert return address label
//--Begin file 'Main' translation--//
// function Main.fibonacci 0
(Main.fibonacci) //insert label for the function name
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
// lt
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    D=M-D   //subtract values
    @LT0TRUE//load jump address
    D;JLT   //jump if the value is D=0
    D=0     //condition was not satisfied, load false into D
    @LT0END //load jump address
    0;JMP   //jump to end
(LT0TRUE)
    D=-1    //condition satisfied, load true into D
(LT0END)
    @SP     //load stack pointer
    A=M-1   //point to the tip of the stack
    M=D     //write to the stack
// if-goto IF_TRUE
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
    @Main.fibonacci$IF_TRUE // load jump address
    D;JNE   // jump when D==0, or D!=False
// goto IF_FALSE
    @Main.fibonacci$IF_FALSE // load label
    0;JMP   // jump to label
// label IF_TRUE
(Main.fibonacci$IF_TRUE) // insert the label into the code
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
// return
    // move return value
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
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
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @R13    // unpack return address for jump
    A=M     // unpack
    0;JMP   // jump to calling function
// label IF_FALSE
(Main.fibonacci$IF_FALSE) // insert the label into the code
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
// call Main.fibonacci 1
    @rtn1   // push return address
    D=A     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @LCL    // push local
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @ARG    // push argument
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @THIS   // push this
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @THAT   // push that
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @SP     // find new arg and lcl, starting with stack pointer
    D=M     // store in D
    @LCL    // LCL pointer calculated, load pointer
    M=D     // store new LCL pointer
    @6    // constant nArgs+5, nArgs from the call command
    D=D-A   // calculate the new ARG pointer
    @ARG    // load pointer
    M=D     // store the new pointer into memory
    @Main.fibonacci // load function jump address
    0;JMP   // jump to the function
(rtn1) // insert return address label
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
// call Main.fibonacci 1
    @rtn2   // push return address
    D=A     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @LCL    // push local
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @ARG    // push argument
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @THIS   // push this
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @THAT   // push that
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @SP     // find new arg and lcl, starting with stack pointer
    D=M     // store in D
    @LCL    // LCL pointer calculated, load pointer
    M=D     // store new LCL pointer
    @6    // constant nArgs+5, nArgs from the call command
    D=D-A   // calculate the new ARG pointer
    @ARG    // load pointer
    M=D     // store the new pointer into memory
    @Main.fibonacci // load function jump address
    0;JMP   // jump to the function
(rtn2) // insert return address label
// add
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    M=M+D   //add values
// return
    // move return value
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //get the tip of the stack
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
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @R13    // unpack return address for jump
    A=M     // unpack
    0;JMP   // jump to calling function
//--Begin file 'Sys' translation--//
// function Sys.init 0
(Sys.init) //insert label for the function name
// push constant 4
    @4      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// call Main.fibonacci 1
    @rtn3   // push return address
    D=A     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @LCL    // push local
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @ARG    // push argument
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @THIS   // push this
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @THAT   // push that
    D=M     // store in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
    @SP     // find new arg and lcl, starting with stack pointer
    D=M     // store in D
    @LCL    // LCL pointer calculated, load pointer
    M=D     // store new LCL pointer
    @6    // constant nArgs+5, nArgs from the call command
    D=D-A   // calculate the new ARG pointer
    @ARG    // load pointer
    M=D     // store the new pointer into memory
    @Main.fibonacci // load function jump address
    0;JMP   // jump to the function
(rtn3) // insert return address label
// label WHILE
(Sys.init$WHILE) // insert the label into the code
// goto WHILE
    @Sys.init$WHILE // load label
    0;JMP   // jump to label
