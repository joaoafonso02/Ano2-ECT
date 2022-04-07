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
			System.out.println("3 - Triangle");
			System.out.println("0 - exit");
			System.out.print("\nChoice: ");

			int choice = sc.nextInt();

            switch(choice) {
                case 1:
                    System.out.println("\nCIRCLE");      
                    int counter = 0;   
                    Circle c1[] = new Circle[10]; 

                    for (int i = 0; i < c1.length; i++) {
                        c1[i] = new Circle(Math.floor(Math.random() * 20)); // generate random radius[0-20]
                    }

                    for (int i = 0; i < c1.length; i++) {
                        System.out.println(c1[i] + " Area: " + c1[i].Area() + " Perimeter: " + c1[i].Perimeter()); // print all characteristics of the figure
                    }

                    for (int i = 1; i < c1.length; i++) {
                        if(c1[0].equals(c1[i])) { // compare first circle with the next ones
                            counter++;
                        }
                    }

                    System.out.println("There are " + counter + " circles equal to the first one!");
                    break;
                case 2:
                    System.out.println("\nRECTANGLE");
                    Rectangle r1[] = new Rectangle[5];
                    counter = 0;    

                    for (int i = 0; i < r1.length; i++) {
                        r1[i] = new Rectangle(Math.floor(Math.random() * 10), Math.floor(Math.random() * 10)); // generate random numbers for length & height[0-10]
                    }

                    for (int i = 0; i < r1.length; i++) {
                        System.out.println(r1[i] + " Area: " + r1[i].Area() + " Perimeter: " + r1[i].Perimeter()); // print all characteristics of the figure
                    }

                    for (int i = 1; i < r1.length; i++) {
                        if(r1[0].equals(r1[i])) { // compare first rectangle with the next ones
                            counter++;
                        }
                    }

                    System.out.println("There are " + counter + " rectangles equal to the first one!");
                    break;
                case 3:
                    Triangle t1[] = new Triangle[5];
                    counter = 0;    

                    for (int i = 0; i < t1.length; i++) {
                        t1[i] = new Triangle(Math.floor(Math.random() * 10 + 1) , Math.floor(Math.random() * 10 + 1), Math.floor(Math.random() * 10+ 1)); // // generate random numbers for side1,2 & 3[0-10]
                    }

                    for (int i = 0; i < t1.length; i++) {
                        System.out.printf(t1[i] + " \tArea: %3.2f \tPerimeter: %3.2f\n", t1[i].TriangleArea(), t1[i].TrianglePerimeter()); // print all characteristics of the figure
                    }

                    for (int i = 1; i < t1.length; i++) {
                        if(t1[0].equals(t1[i])) { // compare first triangle with the next ones
                            counter++;
                        }
                    }

                    System.out.println("There are " + counter + " triangles equal to the first one!");
                    break;         
                case 0:
                    System.out.println("\nGOODBYE MATE!");
                    System.exit(0);
            }
            
        }
    }
}
