function primeFactors2(num: number): number[] {
    let factors:Set<number> = new Set<number>(),
        factorList:number[] = [];
    while(num % 2 == 0) {
        factors.add(2);
        num = Math.floor(num / 2);
    }
    let sqrt:number = Math.sqrt(num);
    for (let n = 3; n <= sqrt; n += 2) {
        console.log(n);
    	while(num % n == 0) {
            factors.add(n);
            num /= n;
        }
    }
    if(num > 2)
        factors.add(num);
    factors.forEach(f => factorList.push(f));
    return factorList.sort((a, b) => {return a - b});
}

console.log(primeFactors2(100));





