var primes: Set<number> = new Set<number>();

function primeFactors2(num: number): number[] {
    let factors:Set<number> = new Set<number>(),
        product:number = 1,
        factorList:number[] = [],
        n:number  = num;
    while(num % 2 == 0) {
        factors.add(2);
        num = Math.floor(num / 2);
    }
    
    factors.forEach(f => factorList.push(f));
    return factorList.sort((a, b) => {return a - b});
}

function isPrime(num: number): boolean {
    if(primes.has(num))
        return true;
    if(num == 2)
        return true;
    if(num < 2 || num % 2 == 0)
        return false;
    let sqrt:number = Math.sqrt(num);
    for (let n:number = 3; n <= sqrt; n += 2)
    	if((num % n) == 0) 
            return false;
    primes.add(num);
    return true;
}

console.log(primeFactors2(30352762));





