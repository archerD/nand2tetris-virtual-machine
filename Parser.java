import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

/**
 * Parser Class
 * Designed to read in a asemebly file and parse lines
 *
 * David Flores
 * CS220
 */


public class Parser {
    public enum COMMANDS {
        NO_COMMAND,
        A_COMMAND,
        C_COMMAND,
        L_COMMAND
    }

    private Scanner inputFile;

    private int lineNumber;
    private String rawLine;

    private String cleanLine;
    private COMMANDS commandType;
    private String symbol;
    private String destMnemonic;
    private String compMnemonic;
    private String jumpMnemonic;

    //Description:      opens input file/stream and prepares to parse
    //Precondition:     provided file is ASM file
    //Postcondition:    if file can't be opened, ends program w/ error message
    public Parser(String inFileName) {
        try {
            inputFile = new Scanner(new File(inFileName));
        } catch (FileNotFoundException e) { //if the file is not availible for what ever reason, alert the user, and exit
            System.out.println("The file " + inFileName + " could not be opened!");
            e.printStackTrace();
            System.exit(2);
        }

        lineNumber = 0;
    }

    //Description:      returns boolean if more commands left, closes stream if not
    //Precondition:     file stream is open
    //Postcondition:    returns true if more commands, else closes stream
    public boolean hasMoreCommands() {
        return inputFile.hasNextLine(); //this is basically if there are more lines to process
    }

    //Description:      reads next line from file and parses it into instance vars
    //Precondition:     file stream is open, called only if hasMoreCommands()
    //Postcondition:    current instruction parts put into instance vars
    public void advance() {
        rawLine = inputFile.nextLine(); //get the next line
        cleanLine(); 
        parseCommandType(); //parse its command type and parse accordingly
        parse();

        //advance the line number
        lineNumber++;
    }

    //Description:      cleans raw instruction by removing non-essential parts
    //Precondition:     String parameter given (not null)
    //Postcondition:    returned without comments and whitespace
    private void cleanLine() {
        int comment = rawLine.indexOf("//");
        String intermediate = rawLine;
        if (comment != -1) { // remove any comments, should they exists
            intermediate = rawLine.substring(0, comment); 
        }

        //remove end white space
        intermediate = intermediate.trim();
        
        cleanLine = "";

        for (int i = 0; i < intermediate.length(); i++) { //remove whitespace in the middle of the line
            if (!Character.isWhitespace(intermediate.charAt(i))) {
                cleanLine += intermediate.charAt(i);
            }
        }
    }

    //Description:      determines command type from parameter
    //Precondition:     String parameter is clean instruction
    //Postcondition:    sets commandType to the proper command type
    private void parseCommandType() {
        if (cleanLine.length() == 0) {
            commandType = COMMANDS.NO_COMMAND;  //if there is nothing here, it is an empty line or a commented line
        } else if (cleanLine.charAt(0) == '@') { //starts with a @, it is a A command
            commandType = COMMANDS.A_COMMAND;
        } else if (cleanLine.charAt(0) == '(' && cleanLine.charAt(cleanLine.length()-1) == ')') { //starts with ( and ends with ), it is a label
            commandType = COMMANDS.L_COMMAND;
        } else { //must be a C command at this point.  To make sure, could check for ; or =.  
            commandType = COMMANDS.C_COMMAND;
        }
    }

    //Description:      helper method parses line depending on instruction type
    //Precondition:     advance() called so cleanLine has value
    //Postcondition:    appropriate parts (instance vars) of instruction filled
    private void parse() {
        //null the everything, so there is no old data
        symbol = null;
        destMnemonic = null;
        compMnemonic = null;
        jumpMnemonic = null;
        
        //process according to command type
        switch (commandType) {
            case A_COMMAND:
            case L_COMMAND:
                parseSymbol();
                break; // do the same thing for A and L commands
            case C_COMMAND:
                parseDest();
                parseComp();
                parseJump();
        }
    }

    //Description:      parses symbol for A- or L-commands
    //Precondition:     advance() called so cleanLine has value, call for A- and L-commands only
    //Postcondition:    symbol has appropriate value from instruction assigned
    private void parseSymbol() {
        if (commandType == COMMANDS.A_COMMAND) {
            symbol = cleanLine.substring(1); // the line is of the form @symbol
        } else if (commandType == COMMANDS.L_COMMAND) {
            symbol = cleanLine.substring(1, cleanLine.length()-1); // the line is of the form
        }
    }

    //Description:      helper method parses line to get dest part
    //Precondition:     advance() called so cleanLine has value, call for C-instructions only
    //Postcondition:    destMnemonic set to apprpriate value from instruction
    private void parseDest() {
        int endIndex = cleanLine.indexOf('='); //look for the = sign

        if (endIndex == -1) {
            endIndex = 0; //if it does not exist, there is no dest mnemonic
        }

        destMnemonic = cleanLine.substring(0, endIndex);  // substring from beginning to the endIndex
    }

    //Description:      helper method parses line to get comp part
    //Precondition:     advance() called so cleanLine has value, call for C-instructions only
    //Postcondition:    compMnemonic set to appropriate value from instruction
    private void parseComp() {
        int startIndex = cleanLine.indexOf('='); //starts after the =
        int endIndex = cleanLine.lastIndexOf(';'); //ends before the ;

        startIndex++; // if startIndex = -1, increment to 0, otherwise, increment to not get the = in the comp mnemonic

        if (endIndex == -1) {
            endIndex = cleanLine.length(); //no jump, end at the end of the line
        }

        compMnemonic = cleanLine.substring(startIndex, endIndex); //substring to get the comp mnemonic
    }

    //Description:      helper method parses line to get jump part
    //Precondition:     advance() called so cleanLine has value, call for C-instructions only
    //Postcondition:    jumpMnemonic set to appropriate value from instruction
    private void parseJump() {
        //start after the ;, end at the end of the line
        int startIndex = cleanLine.lastIndexOf(';');
        int endIndex = cleanLine.length();

        if (startIndex == -1) {
            startIndex = cleanLine.length() - 1;
        }
        startIndex++; //make sure we are not including the ;
        
        jumpMnemonic = cleanLine.substring(startIndex, endIndex);
    }

    //Description:      getter for command type
    //Precondition:     cleanLine has been parsed (advance was called)
    //Postcondition:    returns COMMANDS enum for command type
    public COMMANDS getCommandType() {
        return commandType;
    }

    //Description:      getter for symbol name
    //Precondition:     cleanLine has been paresd (advance was called), call for labels only (use getCommandType())
    //Postcondition:    returns string for symbol name
    public String getSymbol() {
        return symbol;
    }

    //Description:      getter for dest part of C-instruction
    //Precondition:     cleanLine has been paresd (advance was called), call for C-instructions only (use getCommandType())
    //Postcondition:    returns mnemonic (ASM symbol) for dest part
    public String getDest() {
        return destMnemonic;
    }

    //Description:      getter for comp part of C-instruction
    //Precondition:     cleanLine has been parsed (advance was called), call for C-instructions only (use getCommandType())
    //Postcondition:    returns mnemonic (ASM symbol) for comp part
    public String getComp() {
        return compMnemonic;
    }

    //Description:      getter for jump part of C-instruction
    //Precondition:     cleanLine has been parsed (advance was called), call for C-instructions only (use getCommandType())
    //Postcondition:    retuns mnemonic (ASM symbol) for comp part
    public String getJump() {
        return jumpMnemonic;
    }

    //Description:      getter for string version of command type (debugging)
    //Precondition:     advance() and parse() have been called
    //Postcondition:    returns string version of command type
    public String getCommandTypeString() {
        return commandType.toString();
    }

    //Description:      getter for lineNumber (debugging)
    //Precondition:     n/a
    //Postcondition:    returns line number currently being processed from file
    public int getLineNumber() {
        return lineNumber;
    }

    //Description:      getter for rawLine from file (debugging)
    //Precondition:     advance() and cleanLine() were called
    //Postcondition:    returns string of current original line from file
    public String getRawLine() {
        return rawLine;
    }

    //Description:      getter for cleanLine from file (debugging)
    //Precondition:     advance() and cleanLine() were called
    //Postcondition:    returns string of current clean instruction from file
    public String getCleanLine() {
        return cleanLine;
    }
}