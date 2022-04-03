package Aula5;
import java.io.IOException;
import java.util.*;

public class Ex1 {
    public static Scanner sc = new Scanner(System.in);
    public static void main(String[] args) throws IOException {
        Data data = new Data(30, 5, 2002);

        while(true){
            System.out.println("\nDate operations:");
			System.out.println("1 - create new date");
			System.out.println("2 - show current date");
			System.out.println("3 - increment date");
			System.out.println("4 - decrement date");
			System.out.println("0 - exit");
			System.out.print("\nChoice: ");

			int choice = sc.nextInt();

            switch(choice) {
                case 1:
                    System.out.println("\nNEW DATE");
                    System.out.print("Day: ");
                    int day = sc.nextInt();

                    System.out.print("Month: ");
                    int month = sc.nextInt();

                    System.out.print("Year: ");
                    int year = sc.nextInt();
                    data = new Data(day, month, year);
                    break;
                case 2:
                    System.out.println(data);
                    break;
                case 3:
                    System.out.println("\nINCREMENT DATE");
                    System.out.print("Number of days: ");
                    int days = sc.nextInt();
                    data.increment(days);
                    break;
                case 4:
                    System.out.println("\nDECREMENT DATE");
                    System.out.print("Number of days: ");
                    days = sc.nextInt();
                    data.decrement(days);
                    break;
                case 0:
                    System.out.println("\nGOODBYE!");
                    System.exit(0);
                    break;
            }
        }  
       
    }
}
