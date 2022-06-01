package Aula10;

import java.util.HashMap;
import java.util.Map;

public class Ex1 {
    public static void main(String[] args) {
        Map<String, String> map = new HashMap<>();

        // Insertions
        map.put("branco", "Que tem a cor da neve");
        map.put("preto", "Upside Down STRANGER THINGS");
        map.put("verde", "Cor de relva");
        map.put("amalelo", "Cor de certos dentes");
        map.put("vermelho", "Cor feia");
        map.put("azul", "Cor do Grande PORTO 💙");
        
        // Remove
        map.remove("vermelho");

        // Replacement
        map.put("verde", map.get("verde").replaceAll("relva", "piscina não lavada"));
        map.put("verde", "que tem a cor do Sporting, infelizmente.");
    
        // Search and print
        System.out.printf("Busca por Branco: %s\n", map.get("branco"));
        System.out.printf("Busca por preto: %s\n", map.get("preto"));
        System.out.printf("Busca por Azul: %s\n", map.get("azul"));

        // Diferent way to search and print
        System.out.println();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            System.out.println(entry.getKey() + " --> " + entry.getValue() + " :)");
        }

      
    }
}
