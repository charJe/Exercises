import java.util.*;

// you can write to stdout for debugging purposes, e.g.
// System.out.println("this is a debug message");

class Solution2 {
    public static void main(String[] args) {
        int[] a ={1, 2, 3, 6, 3, 2};
        int[] b ={2, 1, 2, 2, 2, 4};
        System.out.println(solution(a, b, 2));
    }
    public static int solution(int[] a, int[] b, int k) {
        // write your code in Java SE 8
        int sumA = 0;
        int sumB = 0;
        for(int i = 0; i < a.length; ++i) {
            sumA += a[i];
            sumB += b[i];
        }
        if(sumA > sumB) {
            return greatestSwap(a, b, k);
        } else {
            return greatestSwap(b, a, k);
        }
    }
    static int greatestSwap(int[] a, int[] b, int k) {
        Stack<Integer> greatestIs = new Stack<>();
            while(greatestIs.size() < a.length) {
                // find greatest in b
                int greatestI = 0;
                for(int i = 1; i < b.length; ++i)
                    if(b[i] > b[greatestI] && greatestIs.search(i) == -1) 
                        greatestI = i;
                greatestIs.push(greatestI);
            }
            while(k > 0 && greatestIs.size() > 0) {
                int cur = greatestIs.pop();
                System.out.println(cur);
                if(a[cur] < b[cur]) {
                    // swap domino
                    int temp = a[cur];
                    a[cur] = b[cur];
                    b[cur] = temp;
                    --k;
                }
            }
            int sumA = 0;
            for(int i = 0; i < a.length; ++i)
                sumA += a[i];
            return sumA;
    }
}
