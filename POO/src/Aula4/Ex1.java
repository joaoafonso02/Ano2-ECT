package Aula4;
import java.util.*;

public class Ex1 {
    public static  String NORMAL = "\033[0m"; public static String RED = "\033[0;31m";
     public static String ANSI_PURPLE = "\u001B[36m";    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String sentence;
        do {
            System.out.print("Write something: ");
            sentence = sc.nextLine();
            if(sentence.isEmpty()) {
                System.out.println(RED + "EMPTY STRING!" + NORMAL);
            }
        }while(sentence.isEmpty());

        if (sentence.length() >= 3) {
            System.out.printf("\nLow case converted String: %s", sentence.toLowerCase());
            System.out.printf("\nUpper case converted String: %s", sentence.toUpperCase());
            System.out.printf("\nLast char: %s", sentence.charAt(sentence.length()-1));
            System.out.printf("\nFirst 3 chars: %s", sentence.substring(0,3));
            System.out.printf("\nYour sentence concatenated: %s", sentence.concat("! Goodbye!"));
            System.out.printf("\nThe char r replaced by l: %s", sentence.replace("l", "r"));
            System.out.printf("\nYour sentence contains the world --> |World|: %s", sentence.contains("World"));
            String[] senList = sentence.split("[\\s,.:/]");
            System.out.print("\nYour sentence after spliting some chars: ");
            for (int i = 0; i < senList.length; i++) {
                System.out.print(senList[i]);
            }
        } else {
            // whatever is appropriate in this case
            System.out.println(RED + "Sentence has fewer than 3 characters!" + NORMAL);
        }
        System.out.println("");
        sc.close();
    }    
}
