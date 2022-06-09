package Aula11;

import java.io.*;
import java.util.*;

public class Ex1 {
    public static void main(String[] args) throws IOException {
        Map<String, TreeMap<String, Integer>> map = new TreeMap<>();
        ArrayList<String> arr = new ArrayList<>();

        try{
            Scanner input = new Scanner(new File("./src/Aula11/major.txt"), "UTF-8");
            while(input.hasNext()){
                String s = input.next();

                s = s.replaceAll("[^a-zA-Z0-9]", " ");
                if(s.matches("\\w{3,}")){
                    arr.add(s);
                }
            }
            for(int j = 1; j < arr.size(); j++){
                int i = j - 1;
                if(map.containsKey(arr.get(i))){
                    TreeMap<String, Integer> b = map.get(arr.get(i));
                    if(b.containsKey(arr.get(j))){
                        int c = b.get(arr.get(j));
                        //c++;
                        b.put(arr.get(j), ++c);
                    }else{
                        b.put(arr.get(j), 1);
                    }
                    map.put(arr.get(i), b);
                }else{
                    TreeMap<String, Integer> b = new TreeMap<>();
                    b.put(arr.get(j), 1);
                    map.put(arr.get(i), b);
                }
            }
            System.out.println(map);            
        }catch(FileNotFoundException e){
            System.out.println("Ficheiro não encontrado!");
        }
    }
}