package Aula2;
import java.util.Scanner;

public class ex3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in); //Scanner
        double M, iw, fw;
        final String NORMAL = "\033[0m"; final String RED = "\033[0;31m"; 

        do{
            try{
                System.out.print("\nWater quantity: ");
                M = sc.nextDouble();
                break;
            } catch(Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);
        do{
            try{
                System.out.print("Inicial water temperature: ");
                iw = sc.nextDouble();
                break;
            } catch(Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);

        do{
            try{
                System.out.print("Final water temperature: ");
                fw = sc.nextDouble();
                break;
            } catch(Exception e) {
                sc.nextLine();
                System.out.println(RED + "NOT A NUMBER!" + NORMAL);
            }
        } while(true);
 
        double dif = fw - iw;
        double Q = M * dif * 4184;
        System.out.println("Energy = " + Q + " J"); 
        sc.close();
    }
}

