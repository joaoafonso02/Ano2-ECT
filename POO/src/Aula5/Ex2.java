package Aula5;
import java.io.IOException;
import java.util.*;

public class Ex2 {
    public static Scanner sc = new Scanner(System.in);
    public static void main(String[] args) throws IOException {
        Calendar calendar = new Calendar(2, 2022);

        while(true){
            System.out.println("\nCalendar operations:");
			System.out.println("1 - create new calendar");
			System.out.println("2 - print calendar month");
			System.out.println("3 - print calendar");
			System.out.println("0 - exit");
			System.out.print("\nChoice: ");

			int choice = sc.nextInt();

            switch(choice) {
                case 1:
                    System.out.println("\nNEW CALENDAR");
                    System.out.print("Week Day(1-7): ");
                    int weekDay = sc.nextInt();

                    System.out.print("Year: ");
                    int year = sc.nextInt();
                    calendar = new Calendar(weekDay, year);
                    break;
                case 2:
                    System.out.println("\nPRINT CALENDAR MONTH");
                    System.out.print("Month: ");
                    int month = sc.nextInt();
                    calendar.printMonth(month);
                    break;
                case 3:
                    System.out.println(calendar);
                    break;
                case 0:
                    System.out.println("\nGOODBYE!");
                    System.exit(0);
                    break;
            }
        }  
       
    }
}
