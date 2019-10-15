function rotateImage(a) {
    let n = a.length,
        next = a[0];
    for (let c = 0; c < n/2; ++c) {
        for (let r = c ; r <n-c-1; ++r) {
    	    let temp = a[r][c];
            a[r][c] = a[n-1-c][r];
            a[n-1-c][r] = a[n-1-r][n-1-c];
            a[n-1-r][n-1-c] = a[c][n-1-r];
            a[c][n-1-r] = temp;
        }
    }
    return a;
}

let a = [[1,2,3], 
         [4,5,6], 
         [7,8,9]];

console.log(rotateImage(a));
