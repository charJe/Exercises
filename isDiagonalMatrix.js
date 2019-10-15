function isDiagonalMatrix(matrix) {
    for (let r = 0; r < matrix.length; ++r) {
    	for (let c = 0; c < matrix.length; ++c) {
    	    if(r != c && matrix[r][c] != 0) {
                return false;
            }
        }
    }
    return true;
}
