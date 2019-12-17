public static int getMinimumUniqueSum(List<Integer> arr) {
    Set<Integer> track = new HashSet<>();
    int sum = 0;
    Iterator itr = arr.listIterator();
    while (itr.hasNext()) {
        Integer current = itr.next();
        while (track.contains(current)) {
            ++current;
        }
        track.add(current);
        sum += current;
    }
    return sum;
}
