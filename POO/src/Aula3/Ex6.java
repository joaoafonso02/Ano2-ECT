package Aula3;
import java.util.Scanner;

public class Ex6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in); 
        final String NORMAL = "\033[0m"; final String RED = "\033[0;31m"; final String BLUE = "\u001B[34m"; 
        
        String date;
        String[] dateSplit;
        int month, year, number_of_days = 31;

        do{
            System.out.println("\nDate(MM:YYYY): ");
            date = sc.nextLine();
            dateSplit = date.split("[:,\\s-]");
            month = Integer.parseInt(dateSplit[0]);
            year = Integer.parseInt(dateSplit[1]);
            if(month < 0 || month > 12) {
                System.out.println(RED + "MONTH NOT BETWEEN 0-12!" + NORMAL);
            }
        } while(month < 0 || month > 12);
        
        switch (month) {
            case 1:
            case 3: 
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                number_of_days = 31;
            case 4:
            case 6:
            case 9:
            case 11:
                number_of_days = 30;
            case 2:
            if ((year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0))) {
                number_of_days = 29;
            } else {
                number_of_days = 28;
            }
            break;
        }

        System.out.println(BLUE + "The month number " + month + " of the year " + year + " has " + number_of_days + " of days!" + NORMAL);
        sc.close();
    }
}
