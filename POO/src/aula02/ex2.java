import java.util.Scanner;
public class ex2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);    // scanner
        System.out.print("Temperature in Celcius: ");
        double Celcius = sc.nextDouble();       // write value from keyboard
        double Fahrenheit = 1.8 * Celcius + 32; // calculus

        System.out.printf("%3.1fºC is %3.1fºF!\n", Celcius, Fahrenheit);
        sc.close();
    }
    
}
