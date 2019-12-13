import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Stack;

public class WellFormated {
    /**
     * Iterate through each line of input.
     */
    public static void main(String[] args) throws IOException {
        InputStreamReader reader = new InputStreamReader(System.in, StandardCharsets.UTF_8);
        BufferedReader in = new BufferedReader(reader);
        String line;
        while ((line = in.readLine()) != null) {
            System.out.println((isFormated(line)?
                                "True":
                                "False"));
        }
    }
    public static boolean isFormated(String str) {
        Stack<Character> track = new Stack<>();
        int length = str.length();
        for(int i = 0; i < length; ++i) {
            char cur = str.charAt(i);
            switch(cur) {
            case '(':
            case '[':
            case '{':
                track.push(cur);
                break;
            case ')':
                if(track.empty() || !track.pop().equals('(')) {
                    return false;
                }
                break;
            case ']':
            case '}':
                if(track.empty() || !track.pop().equals((char)(cur-2))) {
                    return false;
                }
                break;
            }
        }
        return track.empty();
    }
}
