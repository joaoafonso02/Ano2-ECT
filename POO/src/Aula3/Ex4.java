package Aula3;
import java.util.Scanner;

public class Ex4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int max = 0, min = 0, sum = 0; 
        int count = 1;
        double average = 0;
        int[] array = new int[100];

        System.out.println("\nYOUR LIST: ");

        for (int i = 0; i < array.length; i++) {

            System.out.print("number: ");
            array[i] = sc.nextInt();

            if(array[i] > max) {
                max = array[i];
            } else if(array[i] < min) {
                min = array[i];
            } else if(array[i] == array[0] && i > 0) {
                break;
            }
            count++;
            sum += array[i];
            average = (double)sum /count;    
        }

        System.out.println("\nMax: " + max);
        System.out.println("Min: " + min);
        System.out.printf("Average: %3.1f\n", average);
        System.out.println("Total of numbers: " + count);

        sc.close();
    }
}
