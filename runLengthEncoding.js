function runLengthEncoding(inputString) {
    let code = "",
        count = 1;
    for (let i = 1; i < inputString.length; ++i) {
    	if(inputString.charAt(i) == inputString.charAt(i-1)) {
            ++count;
        } else {
            code += ""+count + inputString.charAt(i-1);
            count = 1;
        }
    }
    // add last character
    code += ""+count + inputString.charAt(inputString.length-1);
    return code;
}

let s = "abbaaaac";

console.log(runLengthEncoding(s));
