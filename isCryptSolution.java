import java.util.Arrays;
public class isCryptSolution {
    
    public static void main(String[] args) {
        new isCryptSolution();
    }
    
    isCryptSolution() {
        String[] crypt = {"AAAAAAAAAAAAAA", 
                          "BBBBBBBBBBBBBB", 
                          "CCCCCCCCCCCCCC"};
        char[][] solution = {{'A','1'}, 
                             {'B','2'}, 
                             {'C','3'}};

        System.out.println(sCryptSolution(crypt, solution));
    }
    
    boolean sCryptSolution(String[] crypt, char[][] solution) {
        // convert to number
        for(int i = 0; i < 3; ++i) {
            // decode word
            StringBuffer num = new StringBuffer();
            for(int j = 0; j < crypt[i].length(); ++j) {
                char current = crypt[i].charAt(j);
                // decode char
                for(int ki = 0; ki < solution.length; ++ki) {
                    if(current == solution[ki][0]) {
                        num.append(solution[ki][1]);
                        break;
                    }
                }
            }
            crypt[i] = num.toString();
            if(!crypt[i].equals(crypt[i].replaceFirst("^0+(?!$)", ""))) {
                return false;   // invalid number
            }
        }
        return Long.parseLong(crypt[0]) + Long.parseLong(crypt[1]) == Long.parseLong(crypt[2]);
    }
}
