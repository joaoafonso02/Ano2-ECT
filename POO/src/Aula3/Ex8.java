package Aula3;
import java.util.Scanner;

public class Ex8 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        final String NORMAL = "\033[0m"; final String RED = "\033[0;31m"; final String GREEN = "\u001B[36m";
        Stud[] studs = new Stud[16];
        
        for (int i = 0; i < studs.length; i++) {
            studs[i] = new Stud();

            studs[i].tgrade = 20 * Math.random();
            studs[i].pgrade = 20 * Math.random();
            if(studs[i].tgrade < 7 || studs[i].pgrade < 7) {
                studs[i].fgrade = 66;
            } else {
                studs[i].fgrade = Ex1.FinalGrade(studs[i].tgrade, studs[i].pgrade);
            }
        }
        
        System.out.println(GREEN + "NotaT   NotaP   Pauta" + NORMAL);
        for (Stud student : studs) {
            System.out.printf("%4.1f    %4.1f      %2s\n",
                student.tgrade, 
                student.pgrade,
                student.fgrade == 66 || student.fgrade < 9.5  ? RED + student.fgrade + NORMAL : student.fgrade);
        }
       sc.close();
    }
}

class Stud {
    double tgrade;
    double pgrade;  
    int fgrade; 
}
