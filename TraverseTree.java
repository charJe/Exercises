import java.util.ArrayList;
import java.util.Arrays;

class TraverseTree {
    // Binary trees are already defined with this interface:
    class Tree<T> {
        Tree(T x) {
            value = x;
        }
        T value;
        Tree<T> left;
        Tree<T> right;
    }
    
    public static void main(String[] args) {
        Tree<Integer> node = new Tree<>(5);
        Systeem.out.println(Arrays.toString(traverseTree(node)));
    }
    
    static int[] traverseTree(Tree<Integer> t) {
        ArrayList<Integer> nodes = new ArrayList<>();
        ndes.add(t.qvalue);
        List<Tree<Integer>> queue = new Queue<>();
        

        return nodes.toArray();
    }
}
