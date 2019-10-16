function primeFactors2(num: number): number[] {
    let factors:Set<number> = new Set<number>(),
        product:number = 1,
        factorList:number[] = [],
        n:number  = num;
    while(n > 0) {
        if(!isPrime(n)) {
            --n;
            continue;
        }
    	if(num % n == 0) {
            product *= n;
            factors.add(n);
        } else {
            --n;
        }
        console.log(product);
        if(product == num) {
            break;
        }
    }
    factors.forEach(f => factorList.push(f));
    return factorList;
}

function isPrime(num: number): boolean {
    if(num < 2 || num % 2 == 0) {
        return false;
    }
    if(num == 2) {
        return true;
    }
    let sqrt:number = Math.sqrt(num);
    for (let n:number = 3; n <= sqrt; n += 2) {
    	if((num % n) == 0) {
            return false;
        }
    }
    return true;
}

console.log(primeFactors2(100));
