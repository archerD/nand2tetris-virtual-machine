//David Flores
//CS220
//TODO: don't forget to document each method in all classes!
import java.io.FileOutputStream;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.io.PrintWriter;

public class VirtualMachinePart1 {
    
    // ALGORITHM:
    // get input file name
    // create output file name and stream
    
    // 
    
    // print out "done" message to user
    // close output file stream
    public static void main(String[] args) {
        
        String inputFileName, outputFileName;
        PrintWriter outputFile = null; //keep compiler happy
        SymbolTable symbolTable;
        int romAddress, ramAddress;
        
        //get input file name from command line or console input
        if(args.length == 1) {
            System.out.println("command line arg = " + args[0]);
            inputFileName = args[0];
        }
        else
        {
            Scanner keyboard = new Scanner(System.in);
            
            System.out.println("Please enter virtual machine file name you would like to assemble.");
            System.out.println("Don't forget the .vm extension: ");
            inputFileName = keyboard.nextLine();
            
            keyboard.close();
        }
        
        outputFileName = inputFileName.substring(0,inputFileName.lastIndexOf('.')) + ".asm";
        
        try {
            outputFile = new PrintWriter(new FileOutputStream(outputFileName));
        } catch (FileNotFoundException ex) {
            System.err.println("Could not open output file " + outputFileName);
            System.err.println("Run program again, make sure you have write permissions, etc.");
            System.exit(0);
        }
        
        // TODO: finish driver as algorithm describes
        //alert user and close output stream
        outputFile.close();
        System.out.println("Done! See " + outputFileName);
    }
    
    // to avoid repetitive error handling
    private static void exitWithError(String error, Parser debugData) {
        System.out.println(error); //print the error message 
        System.out.println("Error at line " + debugData.getLineNumber() + ":" + debugData.getRawLine()); //add debugging data
        System.out.println("Line Cleaned to " + debugData.getCleanLine());
        System.exit(1); //exit program
    }
}