function primeFactors2(num) {
    var factors = new Set(), product = 1, factorList = [], n = num;
    while (n > 0) {
        if (!isPrime(n)) {
            --n;
            continue;
        }
        if (num % n == 0) {
            product *= n;
            factors.add(n);
        }
        else {
            --n;
        }
        console.log(product);
        if (product == num) {
            break;
        }
    }
    factors.forEach(function (f) { return factorList.push(f); });
    return factorList;
}
function isPrime(num) {
    if (num < 2 || num % 2 == 0) {
        return false;
    }
    if (num == 2) {
        return true;
    }
    var sqrt = Math.sqrt(num);
    for (var n = 3; n <= sqrt; n += 2) {
        if ((num % n) == 0) {
            return false;
        }
    }
    return true;
}
console.log(primeFactors2(100));
