class Weather {
    
    public static void main(String[] args) {
        int[] a = {5, 6, 1, 4, 7, 4};
        int[] b = {5, 6, 1, 4, 7, 4};
        System.out.println(maxMatches(a, b));
        
    }

    public static int maxMatches(int[] a, int[] b) {
        int max = Integer.MIN_VALUE;
        int increments = 0;
        int index = 0;
        while (index < a.length &&
               index < b.length) {
            if (a[index] == b[index] &&
                a[index] > max) {
                increments++;
                max = a[index];
            }
            index += 1;
        }
        return increments;
    }

}
