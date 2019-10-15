import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class HappyNumber {
  /**
   * Iterate through each line of input.
   */
  public static void main(String[] args) throws IOException {
    InputStreamReader reader = new InputStreamReader(System.in, StandardCharsets.UTF_8);
    BufferedReader in = new BufferedReader(reader);
    String line;
    while ((line = in.readLine()) != null) {
       HashSet<Integer> visited = new HashSet<>();
      System.out.println(happyNumber(Integer.parseInt(line), visited));
    }
  }
      public static int happyNumber(int num, HashSet<Integer> visited) {
        if(num == 1) {
            return 1;           // happy
        } else if(visited.contains(num))
            return 0;           // not happy
        else {
            visited.add(num);
            int sumOfDigits = 0;
            // calculate sumOfDigits
            while(num > 0) {
                sumOfDigits += Math.pow(num % 10,2);
                num = num / 10;
            }
            return happyNumber(sumOfDigits, visited);
        }
    }
}
