function firstDuplicate(a) {
    let dupes = {};
    for (let i = 0; i < a.length; ++i) {
	    if(dupes[a[i]])
            ++dupes[a[i]];
        else
            dupes[a[i]] = 1;
        if (dupes[a[i]] == 2) {
            return a[i];
        }

    }
    return -1;
}
n = [2, 1, 3, 5, 3, 2];

console.log(firstDuplicate(n));
