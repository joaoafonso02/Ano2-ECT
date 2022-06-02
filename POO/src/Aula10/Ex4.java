package Aula10;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Scanner;
import java.util.Set;
import java.io.FileReader;
import java.io.IOException;

public class Ex4 {
    public static void main(String[] args) throws IOException{
        Scanner scan = new Scanner(new FileReader("/Users/joaoafonso/Desktop/UA/Ano2-ECT/POO/src/Aula10/words.txt"));

        Set<String> words = new HashSet<>();
        String word = "";
        while(scan.hasNext()) {
            word = scan.next();
            if(word.length() > 2) {
                words.add(word);
            }
        }
        scan.close();
        System.out.println("\n" + words);
        //end
        endWith(words, "s");

        removeNotLetter(words);
        System.out.println(words);

    }
    public static void endWith(Set<String> words, String s) {
        for(String w : words) {
            if(w.endsWith(s)) {
               System.out.println("\n" + w);;
            }
        }
    }

    public static void removeNotLetter(Set<String> words) {
        Iterator<String> it = words.iterator();
        
        while(it.hasNext()) {
            String w = it.next();
            if (!w.matches("[a-zA-Z]+")) { 
                it.remove();
            }
        }
    }
}
