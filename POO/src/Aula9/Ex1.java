package Aula9;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

import Aula5.Data;

public class Ex1 {

    public static void main(String[] args) {
        ArrayList<Integer> c1 = new ArrayList<>();

        for (int i = 10; i <= 100; i += 10) {
            c1.add(i);
        }

        System.out.println("Size: " + c1.size());
        for (int i = 0; i < c1.size(); i++) {
            System.out.println("Elemento: " + c1.get(i));
        }

        ArrayList<String> c2 = new ArrayList<>();
        c2.add("Vento");
        c2.add("Calor");
        c2.add("Frio");
        c2.add("Chuva");
        System.out.println(c2);
        Collections.sort(c2);
        System.out.println(c2);
        c2.remove("Frio");
        c2.remove(0);
        System.out.println(c2);

        // new colection(c3)
        Set<Pessoa> c3 = new HashSet<>();
        c3.add(new Pessoa("Aníbal", 43121876, new Data(1, 10, 2001)));
        c3.add(new Pessoa("Peixoto", 32755498, new Data(7, 5, 2002)));
        c3.add(new Pessoa("Joaquim", 21746413, new Data(30, 6, 2002)));
        c3.add(new Pessoa("Luu", 74367471, new Data(21, 8, 2002)));
        c3.add(new Pessoa("Gertrudes", 16535638, new Data(14, 1, 2002)));
        
        for(Pessoa p : c3) {
            System.out.println(p);
        }
        // new colection(c4)
        Set<Data> c4 = new TreeSet<>();
        c4.add(new Data(2, 11, 2002));
        c4.add(new Data(7, 5, 2002));
        c4.add(new Data(30, 6, 2002));
        c4.add(new Data(21, 8, 2002));
        c4.add(new Data(14, 1, 2002));
        
        for(Data p : c4) {
            System.out.println(p);
        }
    }
}