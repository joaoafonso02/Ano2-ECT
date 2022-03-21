package Aula3;
import java.util.Scanner;

public class Ex4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int max = 0, min = 0, sum = 0; 
        int medium = 0, count = 1,prev = 0;
        int[] array = new int[50];
        

        System.out.println("\nYOUR LIST: ");

        for (int i = 0; i < array.length; i++) {
    
            System.out.print("number: ");
            array[i] = sc.nextInt();
            
            if(array[i] > max) {
                max = array[i];
            } else if(array[i] < min) {
                min = array[i];
            } else if(array[i] == prev) {
                break;
            }
            count++;
            sum += array[i];
            medium = sum /count; 
            prev = array[0];
        }

        System.out.println("Max: " + max);
        System.out.println("Min: " + min);
        System.out.println("Medium: " + medium);
        System.out.println("Total of numbers: " + count);

        sc.close();
    }
}
