// push constant 17
    @17      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 17
    @17      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// eq
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    D=M-D   //subtract values
    @EQ0TRUE//load jump address
    D;JEQ   //jump if the value is D=0
    D=0     //condition was not satisfied, load false into D
    @EQ0END //load jump address
    0;JMP   //jump to end
(EQ0TRUE)
    D=-1    //condition satisfied, load true into D
(EQ0END)
    @SP     //load stack pointer
    A=M-1   //point to the tip of the stack
    M=D     //write to the stack
// push constant 17
    @17      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 16
    @16      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// eq
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    D=M-D   //subtract values
    @EQ1TRUE//load jump address
    D;JEQ   //jump if the value is D=0
    D=0     //condition was not satisfied, load false into D
    @EQ1END //load jump address
    0;JMP   //jump to end
(EQ1TRUE)
    D=-1    //condition satisfied, load true into D
(EQ1END)
    @SP     //load stack pointer
    A=M-1   //point to the tip of the stack
    M=D     //write to the stack
// push constant 16
    @16      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 17
    @17      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// eq
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    D=M-D   //subtract values
    @EQ2TRUE//load jump address
    D;JEQ   //jump if the value is D=0
    D=0     //condition was not satisfied, load false into D
    @EQ2END //load jump address
    0;JMP   //jump to end
(EQ2TRUE)
    D=-1    //condition satisfied, load true into D
(EQ2END)
    @SP     //load stack pointer
    A=M-1   //point to the tip of the stack
    M=D     //write to the stack
// push constant 892
    @892      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 891
    @891      //load constant
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
    @LT3TRUE//load jump address
    D;JLT   //jump if the value is D=0
    D=0     //condition was not satisfied, load false into D
    @LT3END //load jump address
    0;JMP   //jump to end
(LT3TRUE)
    D=-1    //condition satisfied, load true into D
(LT3END)
    @SP     //load stack pointer
    A=M-1   //point to the tip of the stack
    M=D     //write to the stack
// push constant 891
    @891      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 892
    @892      //load constant
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
    @LT4TRUE//load jump address
    D;JLT   //jump if the value is D=0
    D=0     //condition was not satisfied, load false into D
    @LT4END //load jump address
    0;JMP   //jump to end
(LT4TRUE)
    D=-1    //condition satisfied, load true into D
(LT4END)
    @SP     //load stack pointer
    A=M-1   //point to the tip of the stack
    M=D     //write to the stack
// push constant 891
    @891      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 891
    @891      //load constant
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
    @LT5TRUE//load jump address
    D;JLT   //jump if the value is D=0
    D=0     //condition was not satisfied, load false into D
    @LT5END //load jump address
    0;JMP   //jump to end
(LT5TRUE)
    D=-1    //condition satisfied, load true into D
(LT5END)
    @SP     //load stack pointer
    A=M-1   //point to the tip of the stack
    M=D     //write to the stack
// push constant 32767
    @32767      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 32766
    @32766      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// gt
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    D=M-D   //subtract values
    @GT6TRUE//load jump address
    D;JGT   //jump if the value is D=0
    D=0     //condition was not satisfied, load false into D
    @GT6END //load jump address
    0;JMP   //jump to end
(GT6TRUE)
    D=-1    //condition satisfied, load true into D
(GT6END)
    @SP     //load stack pointer
    A=M-1   //point to the tip of the stack
    M=D     //write to the stack
// push constant 32766
    @32766      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 32767
    @32767      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// gt
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    D=M-D   //subtract values
    @GT7TRUE//load jump address
    D;JGT   //jump if the value is D=0
    D=0     //condition was not satisfied, load false into D
    @GT7END //load jump address
    0;JMP   //jump to end
(GT7TRUE)
    D=-1    //condition satisfied, load true into D
(GT7END)
    @SP     //load stack pointer
    A=M-1   //point to the tip of the stack
    M=D     //write to the stack
// push constant 32766
    @32766      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 32766
    @32766      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// gt
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    D=M-D   //subtract values
    @GT8TRUE//load jump address
    D;JGT   //jump if the value is D=0
    D=0     //condition was not satisfied, load false into D
    @GT8END //load jump address
    0;JMP   //jump to end
(GT8TRUE)
    D=-1    //condition satisfied, load true into D
(GT8END)
    @SP     //load stack pointer
    A=M-1   //point to the tip of the stack
    M=D     //write to the stack
// push constant 57
    @57      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 31
    @31      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// push constant 53
    @53      //load constant
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
// push constant 112
    @112      //load constant
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
// neg
    @SP     //load stack pointer
    A=M-1  //update stack pointer
    M=-M    //negate/not the tip of the stack
// and
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    M=M&D   //add values
// push constant 82
    @82      //load constant
    D=A     //store constant in D
    @SP     //load stack pointer
    M=M+1   //increment pointer
    A=M-1   //store pointer in A
    M=D     //push D on to stack
// or
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    M=M|D   //add values
// not
    @SP     //load stack pointer
    A=M-1  //update stack pointer
    M=!M    //negate/not the tip of the stack
