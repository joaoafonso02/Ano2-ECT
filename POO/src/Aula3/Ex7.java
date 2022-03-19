package Aula3;
import java.util.Scanner;

public class Ex7 {
    public static void main(String[] args) {
        // Scanner
        Scanner sc = new Scanner(System.in);
        // Terminal Colors Output
        final String NORMAL = "\033[0m"; final String RED = "\033[0;31m"; 
        final String BLUE = "\u001B[34m"; final String GREEN = "\u001B[32m";
        final String YELLOW = "\u001B[33m";
        // Introduction
        System.out.println("\n-------------- Higher Lower Game --------------");
        // Variables
        int guess, secret, count = 0;
        char resp = 'y', giveup = 'n';
        // Random int
        secret = (int)(100.0 * Math.random()) + 1;;
        // While loop if the user wants to play
        while(resp == 'y') {
            do{
                System.out.print("\nWrite a number(1-100): ");
                guess = sc.nextInt();
                // TIPS
                if(guess >= 1 && guess <= 100) {
                    if(guess > secret) 
                        System.out.println(GREEN + "TRY LOWER!" + NORMAL);
                    else
                        System.out.println(GREEN + "TRY HIGHER!" + NORMAL);
                } else {
                    System.out.println(RED + "\nTHE NUMBER YOU INTRODUCED IS NOT BETWEEN 0 - 100" + NORMAL);
                }
                // GIVE UP OPTION
                if(count == 10) {
                    System.out.print(RED + "\nYOU HAVE REACHED 10 TRIES! DO YOU WANT TO GIVE UP?(y/n)" + NORMAL);
                    giveup = sc.next().charAt(0);
                    if(giveup == 'y') break;
                }
                count++;
            } while(guess != secret);
            
            if(giveup == 'n') {
                // Congrats!!
                System.out.println(BLUE + "\nCongratss!!You guessed the number" + "\nNumber of tries: " + count + NORMAL);
                // Play again
                System.out.print(YELLOW + "\nDo u want to play again?(y/n): " + NORMAL);
                resp = sc.next().charAt(0);
            } else break;
            count = 0;
        }
        // Game Over!
        System.out.println(RED + "\nGAME OVER! SEE YOU NEXT TIME!\n" + NORMAL);
        sc.close();
    }
}
