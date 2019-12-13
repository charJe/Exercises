def rectanglesUnionArea(rectangles):
    track = []
    area = 0
    for (rectangle in rectangles):
        sx = rectangle[0]
        sy = rectangle[1]
        ex = rectangle[2]
        ey = rectangle[3]
        for (x in range(sx, ex)):
            for (y in range(sy, ey)):
                track[x][y]+=1
    for(s in track.keys()) {
        area += 1
    return area;

            
print(rectanglesUnionArea([[0, 0, 1, 3],
                           [0, 2, 2, 3],
                           [1, 2, 2, 4]]))
