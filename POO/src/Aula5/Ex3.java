package Aula5;
import java.io.IOException;
import java.util.*;

public class Ex3 {
    public static Scanner sc = new Scanner(System.in);
    public static void main(String[] args) throws IOException {
        while(true){
            System.out.println("\nCalendar operations:");
			System.out.println("1 - Circle");
			System.out.println("2 - Rectangle");
			System.out.println("3 - print calendar");
			System.out.println("0 - exit");
			System.out.print("\nChoice: ");

			int choice = sc.nextInt();

            switch(choice) {
                case 1:
                    System.out.println("\nCircle");
                    System.out.print("Week Day(1-7): ");
                    int weekDay = sc.nextInt();

                    System.out.print("Year: ");
                    int year = sc.nextInt();
                    
                    break;
                case 2:
                    System.out.println("\nRectangle");
                    Rectangle r1[] = new Rectangle[5];
                    int counter = 0;    

                    for (int i = 0; i < r1.length; i++) {
                        r1[i] = new Rectangle(Math.random() * 20, Math.random() * 20)   ;
                    }

                    for (int i = 0; i < r1.length; i++) {
                        System.out.println(r1[i]);
                    }

                    for (int i = 0; i < r1.length; i++) {
                        for (int j = 1; j < r1.length; j++) {
                            if(r1[j].equals(r1[i])) {
                                counter++;
                            }
                        }
                    }

                    
                    System.out.println(counter);
                    break;

            }
        }
    }
}
