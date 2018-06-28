import java.io.PrintWriter;

/**
 * Created by David on 3/30/2017.
 * CS220
 * Writes arithmetic, push, and pop commands.
 * Has method stubs to write the remaining commands and the bootstrapping code, but they have not been implemented.
 * When a CodeWriter object encounters an error in the arguments it is given, it throws an InvalidCodeException.
 */
public class CodeWriter {

    private PrintWriter outputFile;
    private String fileName;
    private String functionName;

    private int booleanJumpCounter;
    private int returnAddressCounter;

    //Opens the output file and gets ready to write into it.
    public CodeWriter(PrintWriter outputFile) {
        this.outputFile = outputFile;
        booleanJumpCounter = 0;
        returnAddressCounter = 0;
    }

    //Informs the code writer that the translation of a new VM file is started.
    public void setFileName(String fileName) {
        this.fileName = fileName;
        functionName = null;

        outputFile.println("//--Begin file \'" + fileName + "\' translation--//");
    }

    //Writes the assembly code that is the translation of the given arithmetic command.
    public void writeArithmetic(String command) {
        outputFile.println("// " + command);  // print a comment for what command is being executed
        switch (command.toLowerCase()) {
            case "add":
                writeBinaryArithmetic('+');
                break;
            case "sub":
                writeBinaryArithmetic('-');
                break;
            case "and":
                writeBinaryArithmetic('&');
                break;
            case "or":
                writeBinaryArithmetic('|');
                break;
            case "neg":
                writeUnaryArithmetic('-');
                break;
            case "not":
                writeUnaryArithmetic('!');
                break;
            case "eq":
                writeBooleanArithmetic("EQ");
                break;
            case "gt":
                writeBooleanArithmetic("GT");
                break;
            case "lt":
                writeBooleanArithmetic("LT");
                break;
            default:
                throw new InvalidCodeException("Invalid arithmetic command \'" + command + "\'");
        }
    }

    //writes the assembly code for binary arithmetic operations, where operation is the assembly operation to perform.
    //performs the operation on the top two elements of the stack, used for add, sub, and, and or.
    private void writeBinaryArithmetic(char operation) {
        outputFile.println("    @SP     //load stack pointer");
        outputFile.println("    AM=M-1  //update stack pointer");
        outputFile.println("    D=M     //store the tip of the stack");
        outputFile.println("    A=A-1   //decrement pointer");
        outputFile.println("    M=M"+operation+"D   //add values");
    }

    //writes the assembly code for unary arithmetic operations, where operation is the assembly operation to perform
    //performs the operation on the top of the stack, used for neg and not.
    private void writeUnaryArithmetic(char operation) {
        outputFile.println("    @SP     //load stack pointer");
        outputFile.println("    A=M-1  //update stack pointer");
        outputFile.println("    M="+operation+"M    //negate/not the tip of the stack");
    }

    //writes the assembly code for a boolean arithmetic operation.  code is the jump operation.
    // it is prepended with J, to form the jump command.  currently used for gt, lt, and eq.
    // valid values for code are 'EQ', 'GT', 'LT', 'NE', 'GE', and 'LE'.
    private void writeBooleanArithmetic(String code) {
        outputFile.println("    @SP     //load stack pointer");
        outputFile.println("    AM=M-1  //update stack pointer");
        outputFile.println("    D=M     //store the tip of the stack");
        outputFile.println("    A=A-1   //decrement pointer");
        outputFile.println("    D=M-D   //subtract values");
        outputFile.println("    @"+code+booleanJumpCounter+"TRUE//load jump address");
        outputFile.println("    D;J"+code+"   //jump if the value is D=0");
        outputFile.println("    D=0     //condition was not satisfied, load false into D");
        outputFile.println("    @"+code+booleanJumpCounter+"END //load jump address");
        outputFile.println("    0;JMP   //jump to end");
        outputFile.println("("+code+booleanJumpCounter+"TRUE)");
        outputFile.println("    D=-1    //condition satisfied, load true into D");
        outputFile.println("("+code+booleanJumpCounter+"END)");
        outputFile.println("    @SP     //load stack pointer");
        outputFile.println("    A=M-1   //point to the tip of the stack");
        outputFile.println("    M=D     //write to the stack");

        booleanJumpCounter++; //this variable allows for unique labels
    }

    //Writes the assembly code that is the translation of the given command, where command is either C_PUSH or C_POP
    public void writePushPop(Parser.CommandType command, String segment, int index) {
        if (command == Parser.CommandType.C_PUSH) { //switch between push and pop
            writePush(segment, index);
        } else if (command == Parser.CommandType.C_POP) {
            writePop(segment, index);
        }
    }

    // writes a push command
    private void writePush(String segment, int index) {
        outputFile.println("// push " + segment + " " + index); // print a comment for the command
        switch (segment.toLowerCase()) { //switch to output the set up code to load the value into D
            case "constant":
                outputFile.println("    @"+index+"      //load constant");
                outputFile.println("    D=A     //store constant in D");
                break;
            case "static":
                outputFile.println("    @"+fileName+"."+index+"      //load static address");
                outputFile.println("    D=M     //set D to the value");
                break;
            case "pointer":
                outputFile.println("    @R"+(3+index)+"      //load register address");
                outputFile.println("    D=M     //set D to the value");
                break;
            case "temp":
                outputFile.println("    @R"+(5+index)+"      //load register address");
                outputFile.println("    D=M     //set D to the value");
                break;
            case "local": //local, argument, this, and that all have a very similar set up.
                writeLoadFromPointerIntoD("LCL ", index);
                break;
            case "argument":
                writeLoadFromPointerIntoD("ARG ", index);
                break;
            case "this":
                writeLoadFromPointerIntoD("THIS", index);
                break;
            case "that":
                writeLoadFromPointerIntoD("THAT", index);
                break;
            default:
                //error handling!
                throw new InvalidCodeException("Invalid push segment \'" + segment + "\'");
        }

        //all push commands end in pushing to the stack from D.
        writePushFromD();
    }

    //writes the code that pushes onto the stack from D
    private void writePushFromD() {
        outputFile.println("    @SP     //load stack pointer");
        outputFile.println("    M=M+1   //increment pointer");
        outputFile.println("    A=M-1   //store pointer in A");
        outputFile.println("    M=D     //push D on to stack");
    }

    // computes an address for RAM[basePointer]+index, then gets the value at that address and puts it into D
    // basePointer must be a valid assembly symbol, so it can be 'SP', 'LCL', 'ARG', 'THIS', 'THAT', and 'RX' for any X in the range of 0 to 15, inclusive
    private void writeLoadFromPointerIntoD(String basePointer, int index) {
        outputFile.println("    @"+index+"      //load index");
        outputFile.println("    D=A     //store the index in D");
        outputFile.println("    @"+basePointer+"   //load segment");
        outputFile.println("    A=M+D   //compute address");
        outputFile.println("    D=M     //store value in D");
    }

    // writes a pop command
    private void writePop(String segment, int index) {
        outputFile.println("// pop " + segment + " " +index); // print a comment for the command
        switch (segment.toLowerCase()) { // set up, pop from stack into D, write from D to address
            case "static":
                writePopIntoD();
                outputFile.println("    @"+fileName+"."+index+"      //load static address");
                outputFile.println("    M=D     //set address to the value");
                break;
            case "pointer":
                writePopIntoD();
                outputFile.println("    @R"+(3+index)+"      //load register address");
                outputFile.println("    M=D     //set address to the value");
                break;
            case "temp":
                writePopIntoD();
                outputFile.println("    @R"+(5+index)+"      //load register address");
                outputFile.println("    M=D     //set address to the value");
                break;
            case "local": // local, argument, this, and that are all very similar
                writeAddressToR13("LCL ", index);
                writePopIntoD();
                writeDToPointerR13();
                break;
            case "argument":
                writeAddressToR13("ARG ", index);
                writePopIntoD();
                writeDToPointerR13();
                break;
            case "this":
                writeAddressToR13("THIS", index);
                writePopIntoD();
                writeDToPointerR13();
                break;
            case "that":
                writeAddressToR13("THAT", index);
                writePopIntoD();
                writeDToPointerR13();
                break;
            default:
                //error handling!
                throw new InvalidCodeException("Invalid pop segment \'" + segment + "\'");
        }
    }

    // computes an address for RAM[basePointer]+index, then stores that address in R13
    // basePointer must be a valid assembly symbol, so it can be 'SP', 'LCL', 'ARG', 'THIS', 'THAT', and 'RX' for any X in the range of 0 to 15, inclusive
    private void writeAddressToR13(String basePointer, int index) {
        outputFile.println("    @"+index+"      //load index");
        outputFile.println("    D=A     //store index in D");
        outputFile.println("    @"+basePointer+"   //load segment");
        outputFile.println("    D=M+D   //compute address");
        outputFile.println("    @R13    //load vm register, R13");
        outputFile.println("    M=D     //store the address in R13");
    }

    // write code that pops from the stack into D
    private void writePopIntoD() {
        outputFile.println("    @SP     //load stack pointer");
        outputFile.println("    AM=M-1  //update stack pointer");
        outputFile.println("    D=M     //get the tip of the stack");
    }

    // loads the address in R13 and stores the value in D at that address
    private void writeDToPointerR13() {
        outputFile.println("    @R13    //retrieve the address");
        outputFile.println("    A=M     //put the address into A");
        outputFile.println("    M=D     //place D into M");
    }

    //Closes the output file.
    public void close() {
        outputFile.close();
    }

    //-------------------- VM Part 2 below --------------------

    //Writes assembly code that effects the VM initialization, also called the bootstrap code.
    //This code must be placed at the beginning of the output file.
    public void writeInit() {
        outputFile.println("// bootstrap code");
        outputFile.println("    @256    // load value for stack pointer");
        outputFile.println("    D=A     // store value in D");
        outputFile.println("    @SP     // load stack pointer");
        outputFile.println("    M=D     // set stack pointer to 256");
//        outputFile.println("    @Sys.init // load jump address");
//        outputFile.println("    0;JMP   // jump to the Sys.init function");
        writeCall("Sys.init", 0);
    }

    //Writes assembly code that effects the label command.
    public void writeLabel(String label) {
        outputFile.println("// label " + label);
        outputFile.println("("+label(label)+") // insert the label into the code");
    }

    //Writes assembly code that effects the goto command.
    public void writeGoto(String label) {
        outputFile.println("// goto " + label);
        outputFile.println("    @"+label(label)+" // load label");
        outputFile.println("    0;JMP   // jump to label");
    }

    //Writes assembly code that effects the if-goto command.
    public void writeIf(String label) {
        outputFile.println("// if-goto " + label);
        writePopIntoD();
        outputFile.println("    @"+label(label)+" // load jump address");
        outputFile.println("    D;JNE   // jump when D==0, or D!=False");
    }

    //Writes the assembly code that effects the call command.
    public void writeCall(String functionName, int numArgs) {
        outputFile.println("// call " + functionName + " " + numArgs);

        outputFile.println("    @rtn"+returnAddressCounter+"   // push return address");
        outputFile.println("    D=A     // store in D");
        writePushFromD();
        outputFile.println("    @LCL    // push local");
        outputFile.println("    D=M     // store in D");
        writePushFromD();
        outputFile.println("    @ARG    // push argument");
        outputFile.println("    D=M     // store in D");
        writePushFromD();
        outputFile.println("    @THIS   // push this");
        outputFile.println("    D=M     // store in D");
        writePushFromD();
        outputFile.println("    @THAT   // push that");
        outputFile.println("    D=M     // store in D");
        writePushFromD();
        outputFile.println("    @SP     // find new arg and lcl, starting with stack pointer");
        outputFile.println("    D=M     // store in D");
        outputFile.println("    @LCL    // LCL pointer calculated, load pointer");
        outputFile.println("    M=D     // store new LCL pointer");
        outputFile.println("    @"+(numArgs+5)+"    // constant nArgs+5, nArgs from the call command");
        outputFile.println("    D=D-A   // calculate the new ARG pointer");
        outputFile.println("    @ARG    // load pointer");
        outputFile.println("    M=D     // store the new pointer into memory");
        outputFile.println("    @"+functionName+" // load function jump address");
        outputFile.println("    0;JMP   // jump to the function");
        outputFile.println("(rtn"+returnAddressCounter+") // insert return address label");

        returnAddressCounter++;
    }

    //Writes assembly code that effects the return command.
    public void writeReturn() {
        outputFile.println("// return");

        outputFile.println("    // move return value");
        writePopIntoD();
        outputFile.println("    @R14    // load pointer for return value location");
        outputFile.println("    M=D     // cache return value in R14 until later");
        outputFile.println("    // restore stack pointer");
        outputFile.println("    @ARG");
        outputFile.println("    D=M     // get new SP location, we will push the return value before jumping");
        outputFile.println("    @SP     // load pointer");
        outputFile.println("    M=D     // save pointer to memory");
        outputFile.println("    // locate pointers and restore them");
        outputFile.println("    @LCL    // load LCL");
        outputFile.println("    D=M     // cache LCL value in D");
        outputFile.println("    @R13    // load R13");
        outputFile.println("    AM=D-1  // cache LCL-1 into R13, and get location for THAT");
        outputFile.println("    D=M     // store THAT pointer in D");
        outputFile.println("    @THAT   // load THAT pointer");
        outputFile.println("    M=D     // save the new pointer to memory");
        outputFile.println("    @R13    // load frame location");
        outputFile.println("    AM=M-1  // update frame, and get location for THIS");
        outputFile.println("    D=M     // store THIS pointer in D");
        outputFile.println("    @THIS   // load THIS pointer");
        outputFile.println("    M=D     // save the new pointer to memory");
        outputFile.println("    @R13    // load frame location");
        outputFile.println("    AM=M-1  // update frame, and get location for ARG");
        outputFile.println("    D=M     // store ARG pointer in D");
        outputFile.println("    @ARG    // load ARG pointer");
        outputFile.println("    M=D     // save the new pointer to memory");
        outputFile.println("    @R13    // load frame location");
        outputFile.println("    AM=M-1  // update frame, and get location for LCL");
        outputFile.println("    D=M     // store LCL pointer in D");
        outputFile.println("    @LCL    // load LCL pointer");
        outputFile.println("    M=D     // save the new pointer to memory");
        outputFile.println("    // return value and address shuffle");
        outputFile.println("    @R13    // load frame location");
        outputFile.println("    AM=M-1  // update frame, and get location for the return address");
        outputFile.println("    D=M     // store return address in D for jump");
        outputFile.println("    @R13    // store the return address in R13");
        outputFile.println("    M=D     // cache return address");
        outputFile.println("    @R14    // get the return value");
        outputFile.println("    D=M     // move it into D");
        writePushFromD();
        outputFile.println("    @R13    // unpack return address for jump");
        outputFile.println("    A=M     // unpack");
        outputFile.println("    0;JMP   // jump to calling function");
    }

    //Writes assembly code that effects the function command.
    public void writeFunction(String FunctionName, int numLocals) {
        outputFile.println("// function " + FunctionName + " " + numLocals);

        outputFile.println("("+FunctionName+") //insert label for the function name");
        if (numLocals > 0) {
            outputFile.println("    @0      // set A=0");
            outputFile.println("    D=A     // setup D to push the local variables onto the stack");
            if (numLocals > 1)
                outputFile.println("    // push onto the stack " + numLocals + " times");
            else
                outputFile.println("    // push onto the stack 1 time");

            for (int i = 0; i < numLocals; i++) {
                writePushFromD();
            }
        }

        functionName = FunctionName;
    }

    private String label(String label) {
        if (functionName == null) {
//            throw new InvalidCodeException("Not in a function!");
            //how do I handle this?
            System.out.println("Warning: label access outside of function");
        }

        return functionName+"$"+label;
    }

    // exception class for error handling.
    public static class InvalidCodeException extends RuntimeException {
        public InvalidCodeException(String errorMessage) {
            super(errorMessage);
        }
    }
}
