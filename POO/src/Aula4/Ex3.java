package Aula4;
import java.util.Scanner;

public class Ex3 {
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

        System.out.printf("Acro: %s\n", Acro(sentence));
        sc.close();
    }

    public static String Acro(String s) {
        String acro = "";
        for (int i = 0; i < s.length(); i++) {
            if(Character.isUpperCase(s.charAt(i))) {
                acro += s.charAt(i);
            }
        }
        return acro;
    }
}
