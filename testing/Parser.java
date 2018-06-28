import java.util.Scanner;

/**
 * Created by David on 3/30/2017.
 * CS 220
 * Recognizes and parses all command types.
 */
public class Parser {

    private Scanner inputFile;

    private int lineNumber;
    private String rawLine;
    private String cleanLine;
    private String[] lineParts;

    private CommandType commandType;
    private String arg1;
    private int arg2;

    //opens the input file and gets ready to parse it.
    public Parser(Scanner inputFile) {
        this.inputFile = inputFile;
        lineNumber = 0;
    }

    //are there more commands in the input?
    public boolean hasMoreCommands() {
        return inputFile.hasNextLine(); //this is basically if there are more lines to process
    }

    //Reads the next command from the input and makes it the current command.
    //Should be called only if hasMoreCommands() is true.
    //Initially there is no current command.
    public void advance() {
        rawLine = inputFile.nextLine(); //get the next line
        cleanLine();
        parseCommandType(); //parse its command type
        parse(); // parse accordingly

        //advance the line number
        lineNumber++;
    }

    //Returns the type of the current VM command.
    //C_ARITHMETIC is returned for all arithmetic commands.
    public CommandType commandType() {
        return commandType;
    }

    //Returns the first argument of the current command.
    //In the case of C_ARITHMETIC, the command itself (add, sub, etc.) is returned.
    //Should not be called if the current command is C_RETURN.
    public String arg1() {
        return arg1;
    }

    //Returns the second argument of the current command.
    // Should be called only if the current command is C_PUSH, C_POP, C_FUNCTION, or C_CALL.
    public int arg2() {
        return arg2;
    }


    // cleans the line stored in rawLine, stores it in cleanLine,
    // then splits the cleaned line on spaces and stores the result in lineParts
    private void cleanLine() {
        int comment = rawLine.indexOf("//");
        String intermediate = rawLine;
        if (comment != -1) { // remove any comments, should they exists
            intermediate = rawLine.substring(0, comment);
        }

        //remove end white space
        intermediate = intermediate.trim();

        cleanLine = "";

        boolean wasWhiteSpaceEncountered = false;
        for (int i = 0; i < intermediate.length(); i++) { //changes whitespace to a single space
            if (Character.isWhitespace(intermediate.charAt(i))) {
                wasWhiteSpaceEncountered = true;
            } else {
                if (wasWhiteSpaceEncountered) {
                    cleanLine += " ";
                    wasWhiteSpaceEncountered = false;
                }
                cleanLine += intermediate.charAt(i);
            }
        }

        lineParts = cleanLine.split(" "); //split the line into its parts
    }

    // determines the command type of the line stored in lineParts.
    private void parseCommandType() {
        commandType = null;
        switch (lineParts.length) {
            case 0: //only one option: no command
                commandType = CommandType.NO_COMMAND;
                break;
            case 1: // two options: arithmetic and return
                if (lineParts[0].equalsIgnoreCase("return")) {
                    commandType = CommandType.C_RETURN;
                } else if (lineParts[0].length() == 0) {
                    commandType = CommandType.NO_COMMAND;
                } else {
                    commandType = CommandType.C_ARITHMETIC;
                }
                break;
            case 2: // three options: label, goto, if goto
                if (lineParts[0].equalsIgnoreCase("label")) {
                    commandType = CommandType.C_LABEL;
                } else if (lineParts[0].equalsIgnoreCase("goto")) {
                    commandType = CommandType.C_GOTO;
                } else if (lineParts[0].equalsIgnoreCase("if-goto")) {
                    commandType = CommandType.C_IF;
                }
                break;
            case 3: // four options: push, pop, function, call
                if (lineParts[0].equalsIgnoreCase("pop")) {
                    commandType = CommandType.C_POP;
                } else if (lineParts[0].equalsIgnoreCase("push")) {
                    commandType = CommandType.C_PUSH;
                } else if (lineParts[0].equalsIgnoreCase("function")) {
                    commandType = CommandType.C_FUNCTION;
                } else if (lineParts[0].equalsIgnoreCase("call")) {
                    commandType = CommandType.C_CALL;
                }
                break;
        }

        if (commandType == null) { // error handle when the command type is not set
            System.out.println("Error determining command type!");
            System.out.println("Error at line " + lineNumber + ":" + rawLine); //add debugging data
            System.out.println("Line Cleaned to " + cleanLine);
            System.exit(1);
        }
    }

    // parses the line stored in line parts
    private void parse() {
        arg1 = null;
        arg2 = 0;

        switch (commandType) {
            case C_ARITHMETIC: // for arithmetic commands, store the exact command in arg1
                arg1 = lineParts[0];
                break;
            case C_PUSH:
            case C_POP:
            case C_FUNCTION:
            case C_CALL: // for push, pop, function, and call commands, store the number in arg2 (index, num of args/local vars)
                arg2 = Integer.parseInt(lineParts[2]);
                // and then the second string in arg1 (segment or function name), done below
            case C_LABEL:
            case C_GOTO:
            case C_IF: // for if, goto, and label commands, store the label in arg1
                arg1 = lineParts[1];
                break;
            case C_RETURN:
            case NO_COMMAND:
                break; // do nothing for return and no command
        }
    }

    //debugging information getters

    // returns the line number the parser is on
    public int getLineNumber() {
        return lineNumber;
    }

    // returns the preprocessed line the parser is on
    public String getRawLine() {
        return rawLine;
    }

    // returns the line the parser is on after it is cleaned
    public String getCleanLine() {
        return cleanLine;
    }


    // a enum for the command type, one for each command type, and one for no command.
    public enum CommandType {
        C_ARITHMETIC,
        C_PUSH,
        C_POP,
        C_LABEL,
        C_GOTO,
        C_IF,
        C_FUNCTION,
        C_RETURN,
        C_CALL,
        NO_COMMAND
    }
}
