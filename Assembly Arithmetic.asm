(add)
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    M=D+M   //add values

(sub)
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    M=M-D   //subtract values

(neg)
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    M=-M    //negate the tip of the stack

(and)
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    M=D&M   //and values

(or)
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    M=D|M   //or values

(not)
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    M=!M    //negate the tip of the stack

(eq)
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    D=M-D   //subtract values
    @EQxTRUE//load jump address
    D;JEQ   //jump if the value is D=0
    D=0     //condition was not satisfied, load false into D
    @EQxEND //load jump address
    0;JMP   //jump to end
(EQxTRUE)
    D=-1    //condition satisfied, load true into D
(EQxEND)
    @SP     //load stack pointer
    A=M-1   //point to the tip of the stack
    M=D     //write to the stack

(gt)
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    MD=M-D  //subtract values
    @GTxTRUE//load jump address
    D;JGT   //jump if the value is D>0
    D=0     //condition was not satisfied, load false into D
    @GTxEND //load jump address
    0;JMP   //jump to end
(GTxTRUE)
    D=-1    //condition satisfied, load true into D
(GTxEND)
    @SP     //load stack pointer
    A=M-1   //point to the tip of the stack
    M=D     //write to the stack

(lt)
    @SP     //load stack pointer
    AM=M-1  //update stack pointer
    D=M     //store the tip of the stack
    A=A-1   //decrement pointer
    MD=M-D  //subtract values
    @LTxTRUE//load jump address
    D;JLT   //jump if the value is D<0
    D=0     //condition was not satisfied, load false into D
    @LTxEND //load jump address
    0;JMP   //jump to end
(LTxTRUE)
    D=-1    //condition satisfied, load true into D
(LTxEND)
    @SP     //load stack pointer
    A=M-1   //point to the tip of the stack
    M=D     //write to the stack
