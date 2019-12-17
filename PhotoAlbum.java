public static List<Integer> photoAlbum(List<Integer> index, List<Integer> identity) {
    List<Integer> result = new ArrayList<>();
    for (int i = 0; i < index.size(); ++i) {
        result.add(index[i], identity);
    }
    return result;
}
