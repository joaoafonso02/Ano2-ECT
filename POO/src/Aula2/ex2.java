package Aula2;
import java.util.Scanner;
public class ex2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);    // scanner
        double Celcius, Fahrenheit; 
        final String NORMAL = "\033[0m"; final String RED = "\033[0;31m"; 

        // Exceptions
        do{
            try {
                System.out.print("Temperature in Celcius: ");
                Celcius = sc.nextDouble();  // write value from keyboard
                if(Celcius > -272.15 && Celcius < 272.15) break;
                System.out.println(RED + "NON EXISTING TEMPERATURE!" + NORMAL); 
            } catch (Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);

        // Calculus
        Fahrenheit = 1.8 * Celcius + 32; // calculus

        // Print
        System.out.printf("%3.1fºC is %3.1fºF!\n", Celcius, Fahrenheit);
        sc.close();
    }
    
}
