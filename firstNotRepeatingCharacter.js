function firstNotRepeatingCharacter(s) {
    let freq = {};
    for (let i = 0; i < s.length; ++i) {
	    if(freq[s[i]])
            ++freq[s[i]];
        else
            freq[s[i]] = 1;
    }
    for (let i = 0; i < s.length; ++i) {
    	if(freq[s[i]] == 1)
            return s[i];
    }
    return '_';
    
}

n = "";
console.log(firstNotRepeatingCharacter(n));
