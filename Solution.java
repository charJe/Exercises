import java.util.*;

// you can write to stdout for debugging purposes, e.g.
// System.out.println("this is a debug message");

class Solution {
    public static void main(String[] args) {
        System.out.println(solution("1f9----3fji-nfi1-hp-24h14hg-134-", 2));
    }
    public static String solution(String S, int K) {
        // write your code in Java SE 8
        ArrayList<Character> key = new ArrayList<>();
        for(int i = 0; i < S.length(); ++i) 
            if(S.charAt(i) != '-')
                key.add(S.charAt(i));
        StringBuilder output = new StringBuilder();
        for(int i = key.size() - 1; i >= 0; --i) {
            if((key.size() - 1 - i) % K == 0 && i < key.size() - 1)
                output.insert(0, '-');
            output.insert(0, key.get(i));
        }
        return output.toString().toUpperCase();
    }
}
