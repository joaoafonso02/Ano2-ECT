package Aula4;
import java.util.Scanner;

public class Ex2 {
    public static String NORMAL = "\033[0m"; public static String RED = "\033[0;31m"; public static String ANSI_PURPLE = "\u001B[36m";    
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String sentence;
        do {
            System.out.print("Write something: ");
            sentence = sc.nextLine();
            if(sentence.isEmpty()) {
                System.out.println(RED + "EMPTY STRING!" + NORMAL);
            }
        }while(sentence.isEmpty());

        
		System.out.println("Number of numeric digits: " + countDigits(sentence));
		System.out.println("Number of spaces: " + countSpaces(sentence));
		System.out.println("Only Low Case? " + (onlyLowerCase(sentence)));
		System.out.println("Double spaces: " + removeDoubleSpaces(sentence));
		System.out.println("Palindrome?: " + (isPalindrome(sentence)));

        sc.close();
    }
    
    public static int countDigits(String s) {
        int digits = 0;                                      
        for (int i = 0; i < s.length(); i++) {               
         if(Character.isDigit(s.charAt(i))) digits++;     
        }                                                    
        return digits;                                       
		//return s.replaceAll("\\D", "").length(); // count the length of numeric chars
	}

    public static int countSpaces(String s) {
        int spaces = 0;                           
        for (int i = 0; i < s.length(); i++) {    
            if(s.charAt(i) ==' ') spaces++;       
        }                                         
        return spaces;                            
		//return s.replaceAll("[^ ]", "").length(); // count the length of spaces
	}

    public static boolean onlyLowerCase(String s) {
        int up = 0;                                                       
        for (int i = 0; i < s.length(); i++) {                            
             if(Character.isUpperCase(s.charAt(i))) up++;            
        }                                                                 
        if(up == 0)                                                       
                return true;                                               
        else                                                              
             return false;                                                 
		//return s.equals(s.toLowerCase()); // returns if is LowerCase or not
	}

	public static String removeDoubleSpaces(String s) {
		return s.replaceAll("[ ]+", " "); 
	}

    public static boolean isPalindrome(String s) {
        int last = s.length() - 1; // get last element
        for (int i = 0; i < s.length(); i++) {
            if(s.charAt(i) != s.charAt(last)) return false;
            last--;
        }
        return true;
	}

 
}
