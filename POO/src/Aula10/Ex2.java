package Aula10;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.TreeMap;

public class Ex2 {
    public static void main(String[] args) {      
        Map<String, HashSet<String>> map = new TreeMap<>();

        HashSet<String> cor = new HashSet<>();
        cor.add("Que tem a cor da neve");
        cor.add("Descorado, pálido");
        cor.add("Cor de leite");
        map.put("branco", cor);

        HashSet<String> UA = new HashSet<>();
        UA.add("departamentos");
        UA.add("cantinas");
        UA.add("alunos");
        map.put("universidade", UA);

        HashSet<String> q = new HashSet<>();
        q.add("secretária");
        q.add("cama");
        q.add("armário");
        map.put("quarto", q);

        HashSet<String> sk8 = new HashSet<>();
        sk8.add("rolamentos");
        sk8.add("tábua");
        sk8.add("rodas");
        map.put("skate", sk8);

        HashSet<String> s = new HashSet<>();
        s.add("atacas");
        s.add("sola");
        s.add("palmilha");
        map.put("sapatilhas não ténis ok?", s);

        // Remove
        UA.remove("alunos");
        UA.add("profs");

        // Print
        for (Map.Entry<String, HashSet<String>> b :  map.entrySet()) {
            System.out.println(b.getKey() + ": " + b.getValue());
        }
        System.out.println();
        
        int random = randomNumber(4);
        System.out.println(random);

        int i = 0;
        HashMap<Integer, HashSet<String>> h = new HashMap<>();
        for (Map.Entry<String, HashSet<String>> b :  map.entrySet()) {
            h.put(i, b.getValue());
            i++;
        }
        System.out.println(h.get(random));
        
        // ToString
        System.out.printf("\nmapa.toString() >>> %s\n", map.toString());
    }

    public static int randomNumber(int max){   
        return (int)(Math.random() * max);
    }

}
