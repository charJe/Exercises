/**
 * @author Charles Jackson
 * @email charles.jackson@utd.edu
 */

import java.util.ArrayList;
import java.util.HashMap;

class LowLengthHighFrequency {
    
    public static void main(String[] args) {
        System.out.println(getAnswer("aaaaaaaaaaaaaaaaaaa"));
    }
    
    public static int getAnswer(String s) {
        HashMap<String, Integer> frequency = new HashMap<>();
        ArrayList<String> pSet = new ArrayList<>();
        pSet.add("");
        // generate and count combos
        for (int sindex = 0; sindex < s.length(); ++sindex) {
            int currentLength = pSet.size();
            // add each character to every current combo
            for (int pindex = 0; pindex < currentLength; ++pindex) {
                String combo = pSet.get(pindex) + s.charAt(sindex); // make the combo
                // increment the frequency in the hash table
                if (!frequency.containsKey(combo))
                    frequency.put(combo, 1);
                else
                    frequency.put(combo, frequency.get(combo) + 1);
                pSet.add(combo);
            }
        }
        // find best combo
        String bestString = "";
        int freq = Integer.MIN_VALUE;
        int length = Integer.MAX_VALUE;
        for (String k : frequency.keySet()) {
            // System.out.println(k+": "+frequency.get(k));
            if (frequency.get(k) > freq || // if higher frequency
                (frequency.get(k) == length && k.length() < length)) { // or equal frequency and lower length
                // update variables with new best string
                freq = frequency.get(k);
                bestString = k;
                length = bestString.length();
            } 
        }
        // System.out.println("best: "+ bestString);
        // System.out.println("freq: "+ freq);
        if (bestString.equals("")) {
            length = -1;
        }
        return length;
    }   

    // public static void main(String[] args){
    //     Scanner scan = new Scanner(System.in);
    //     String S;
    //     S=scan.next();
    //     int result;
    //     result = getAnswer(S);
    //     System.out.print(result);
    //     return ;
    // }
}
