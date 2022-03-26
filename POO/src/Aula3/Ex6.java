package Aula3;
import java.util.Scanner;

public class Ex6 {
    public static Scanner sc = new Scanner(System.in); 
    public static final String NORMAL = "\033[0m"; public static final String BLUE = "\u001B[34m"; 
   
    public static void main(String[] args) {
        int month = support.readIntervalInt(sc, NORMAL + "Month: ", 0, 12);
		int yy = support.getIntPos(sc, NORMAL + "Year: ");
		
		System.out.println(BLUE + "Days: " + Days(month, yy) + NORMAL);
	}
    public static int Days(int m, int y) {
        int[] days = {31,28,31,30,31,30,31,31,30,31,30,31};

		if( (y % 400 == 0) || ( (y % 4 == 0) && (y % 100 != 0) ) )
            if(m == 2) {
                days[1] = 29;
            } else {
                days[1] = 28;
            }
        return days[m - 1];
    }

}

