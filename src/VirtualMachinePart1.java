import java.io.*;
import java.util.Scanner;

/**
 * Created by David on 3/30/2017.
 * CS220
 * Can handle a directory or a file passed as the argument
 * Is set up to handle all command types and write the bootstrapping code, however CodeWriter is not equipped for the task.
 * Handles the InvalidCodeException thrown by CodeWriter by catching it, printing some debugging information and the exception message, and exits.
 */
public class VirtualMachinePart1 {
    // ALGORITHM:
    // get input file name
    // create output file name and stream

    //

    // print out "done" message to user
    // close output file stream
    public static void main(String[] args) {

        String inputFileName, outputFileName;
        PrintWriter outputFileWriter = null; //keep compiler happy
        Scanner inputFileScanner = null;
        File inputFile = null, outputFile = null;
        File[] parserFiles = null;

        //get input file name from command line or console input
        if(args.length == 1) {
            System.out.println("command line arg = " + args[0]);
            inputFileName = args[0];
        }
        else
        {
            Scanner keyboard = new Scanner(System.in);

            System.out.println("Please enter virtual machine file/directory name you would like to assemble.");
            System.out.println("Don't forget the .vm extension, if a file: ");
            inputFileName = keyboard.nextLine();

            keyboard.close();
        }

        // make the input a File
        inputFile = new File(inputFileName);

        if (!inputFile.exists()) { //handle the case where the input file does not exist
            System.out.println("The specified file/directory, " + inputFile + ", does not exist");
            System.exit(0);
        }

        //switch between if an inputFile is a directory or not
        if (inputFile.isDirectory()) {
            outputFile = new File(inputFile, inputFile.getName()+".asm"); // create the output file

            //File::isFile as parameter instead?
            parserFiles = inputFile.listFiles(new FileFilter() { // if it is a directory, get an array of the files in the directory that are vm files
                @Override
                public boolean accept(File pathname) {
                    return pathname.isFile() && pathname.getName().endsWith(".vm");
                }
            });
            if (parserFiles == null || parserFiles.length ==  0) {
                System.out.println("No VM files in directory " + inputFile);
                System.exit(0);
            }
        } else {
            outputFileName = inputFileName.substring(0, inputFileName.lastIndexOf('.')) + ".asm";
            outputFile = new File(outputFileName); // create output file name
            parserFiles = new File[1]; // create the parser file array
            parserFiles[0] = inputFile;
        }

        try {
            outputFileWriter = new PrintWriter(new FileOutputStream(outputFile));
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
            System.out.println("Could not open file " + outputFile);
            System.out.println("Run program again, make sure you have write permissions, etc.");
            System.exit(0);
        }

        CodeWriter codeWriter = new CodeWriter(outputFileWriter);

        codeWriter.writeInit();


        for (int i = 0; i < parserFiles.length; i++) {
            Parser parser = null;
            try {
                parser = new Parser(new Scanner(parserFiles[i])); // open new parser for an import file
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                System.out.println("Could not open file " + parserFiles[i]);
                System.out.println("Run program again, make sure you have write permissions, etc.");
                System.exit(0);
            }

            codeWriter.setFileName(parserFiles[i].getName().substring(0, parserFiles[i].getName().lastIndexOf('.')));  //set the file name in the CodeWriter
            while (parser.hasMoreCommands()) { //iterate over all the commands of the file
                parser.advance();

                try {
                    switch (parser.commandType()) {  //switch between the command types
                        case C_ARITHMETIC:
                            codeWriter.writeArithmetic(parser.arg1());
                            break;
                        case C_PUSH:
                        case C_POP:
                            codeWriter.writePushPop(parser.commandType(), parser.arg1(), parser.arg2());
                            break;
                        case C_LABEL:
                            codeWriter.writeLabel(parser.arg1());
                            break;
                        case C_GOTO:
                            codeWriter.writeGoto(parser.arg1());
                            break;
                        case C_IF:
                            codeWriter.writeIf(parser.arg1());
                            break;
                        case C_FUNCTION:
                            codeWriter.writeFunction(parser.arg1(), parser.arg2());
                            break;
                        case C_RETURN:
                            codeWriter.writeReturn();
                            break;
                        case C_CALL:
                            codeWriter.writeCall(parser.arg1(), parser.arg2());
                            break;
                        case NO_COMMAND:
                            break;
                    }
                } catch (CodeWriter.InvalidCodeException e) {
                    System.out.println(e.getMessage()); //print the error message
                    System.out.println("Error at line " + parser.getLineNumber() + ": " + parser.getRawLine()); //add debugging data
                    System.out.println("Line Cleaned to: " + parser.getCleanLine());
                    System.out.println("Command type: " + parser.commandType());
                    System.exit(1); //exit program
                }
            }
        }

        //alert user and close output stream
        outputFileWriter.close();
        System.out.println("Done! See " + outputFile);
    }

    // to avoid repetitive error handling
    private static void exitWithError(String error, Parser debugData) {
        System.out.println(error); //print the error message
        System.out.println("Error at line " + debugData.getLineNumber() + ":" + debugData.getRawLine()); //add debugging data
        System.out.println("Line Cleaned to " + debugData.getCleanLine());
        System.exit(1); //exit program
    }
}
