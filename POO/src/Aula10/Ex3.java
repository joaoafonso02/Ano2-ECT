package Aula10;

import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;

public class Ex3 {
    public static void main(String[] args) {
        System.out.println(getCharPositions("Hello World"));
    }

    public static String getCharPositions(String s) {
        Map<Character, ArrayList<Integer>> map = new HashMap<>();
        int i = 0;

        for(Character c: s.toCharArray()) {
            if(!map.containsKey(c)) {
                map.put(c, new ArrayList<>());
            }
            map.get(c).add(i++);

        }
        return map.toString();
    }
}
