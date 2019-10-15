function clockDigitsCount(startTime, finishTime) {
    let freq = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        h = startTime[0],
        m = startTime[1],
        s = startTime[2];
    
    for (;h != finishTime[0] || m != finishTime[1] || s != finishTime[2]; h = (h+1)%24) {
    	for (; m != finishTime[1] || s != finishTime[2]; m =(m+1)%60) {
    	    for (; s != finishTime[2]; s = (s+1)%60) {
                // console.log(h+", "+m+", "+s);
                freq[Math.floor(s/10)]++;
                freq[(s%10)]++;
                freq[Math.floor(m/10)]++;
                freq[(m%10)]++;
                freq[Math.floor(h/10)]++;
                freq[(h%10)]++;
            }
        }
    }
    h = finishTime[0];
    m = finishTime[1];
    s = finishTime[2];
    freq[Math.floor(s/10)]++;
    freq[(s%10)]++;
    freq[Math.floor(m/10)]++;
    freq[(m%10)]++;
    freq[Math.floor(h/10)]++;
    freq[(h%10)]++;
    return freq;
}

console.log(clockDigitsCount([13, 24, 9], [13, 24, 40]));
