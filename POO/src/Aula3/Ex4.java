package Aula3;
import java.util.Scanner;

public class Ex4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int count = 0;
        double average = 0;
        int[] array = new int[100];
        int max = Integer.MIN_VALUE, min = Integer.MAX_VALUE, sum = 0; 

        System.out.println("\nYOUR LIST: ");

        for (int i = 0; i < array.length; i++) {

            System.out.print("number: ");
            array[i] = sc.nextInt();

            if(array[i] > max) {
                max = array[i];
            } else if(array[i] < min) {
                min = array[i];
            } 
            count++;
            sum += array[i];
            average = (double)sum /count; 
            
            if(array[i] == array[0] && i > 0) {
                break;
            }
            
        }
         

        System.out.println("\nMax: " + max);
        System.out.println("Min: " + min);
        System.out.printf("Average: %3.1f\n", average);
        System.out.println("Total of numbers: " + count);

        sc.close();
    }
}
