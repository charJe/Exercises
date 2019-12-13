public class rectangleUnionArea {
    
    public static void main(String[] args) {
        System.out.println(rectanglesUnionArea(new int[][]{{0, 0, 1, 3},{0, 2, 2, 3},{1, 2, 2, 4}}));
    }
    
    static int rectanglesUnionArea(int[][] rectangles) {
        int[][] track = new int[1000][1000];
        int area = 0;
        for (int[] rectangle : rectangles) {
            int sx = rectangle[0],
                sy = rectangle[1],
                ex = rectangle[2],
                ey = rectangle[3];
            for(int x = sx; x < ex; ++x) {
                for(int y = sy; y < ey; ++y) {
                    track[x][y] += 1;
                }
            }
        }
        for(int r = 0; r < 1000; ++r) {
            for(int c = 0; c < 1000; ++c) {
                if(track[r][c] != 0 ) {
                    area += 1;   
                }
            }
        }
        return area;
    }

    
}
