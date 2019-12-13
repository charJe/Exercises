function incorrectPasscodeAttempts(passcode, attempts) {
    let wrongCount = 0;
    for (let i = 0; i < attempts.length; ++i) {
    	if(attempts[i] !== passcode) {
            ++wrongCount;
        } else {
            wrongCount = 0;
        }
        if(wrongCount >= 10) {
            return true;
        }
    }
    return false;
}
