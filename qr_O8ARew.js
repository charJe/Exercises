var primes = new Set();
function primeFactors2(num) {
    var factors = new Set(), product = 1, factorList = [], n = num;
    while (num % 2 == 0) {
        factors.add(2);
        num = Math.floor(num / 2);
    }
    factors.forEach(function (f) { return factorList.push(f); });
    return factorList.sort(function (a, b) { return a - b; });
}
function isPrime(num) {
    if (primes.has(num))
        return true;
    if (num == 2)
        return true;
    if (num < 2 || num % 2 == 0)
        return false;
    var sqrt = Math.sqrt(num);
    for (var n = 3; n <= sqrt; n += 2)
        if ((num % n) == 0)
            return false;
    primes.add(num);
    return true;
}
console.log(primeFactors2(30352762));
