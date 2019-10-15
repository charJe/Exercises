function uniqueChars(s) {
    let maxLength = 1,
        freq = {},
        count = 0;
    for (let i = 0; i < s.length; ++i) {
        let current = s.charAt(i);
        if(!freq.hasOwnProperty(current)) {
            freq[current] = 1;
        } else {
            freq[current]++;
        }
        ++count;
        if(freq[current] > 1) {
            freq = {};
            count = 0;
            --i;
        }
        if(count > maxLength){
            maxLength = count;
        }
    }
    return maxLength;
}

console.log(uniqueChars("njwiycvzjzmoguhhhuagqxqawmtvvyasqdsdghasokknhcgisxryfdcecijdrvmmervdbyydvghhrvjuhwhgpulmsbhqsgqrcjoq"));
console.log(uniqueChars("ofjplintgipshpufvxcmzgwcmaqzimksovoswoambntntwpnuvnwvcbwolubjzsmfnnmficrmdfoprkugrlijqlavpuzyejlkqncgdtfvfleoyoidzwgazibrbfvcmxecthlqsiaoklmxrfetovejrdvvhhulxeehilulevgbdcrvtevyfevmkstodluwhvjvmcwlttkrcvsbekbzmcislifqydydjdjwxufdnvdbqrcpicbdbfnjqniypzwuggocepqpngaqtiyxpxucyxrbtmvaexsokkutlnevadnocrnfjhvagslcsrhznxrnkowizbyebelpkmscbkylacbxkmqyluueihzdlgmiimmoajyhlboylnpgpitblfvcdwnoyolbfvawtxfulwxkhtxdcxppydripqyvsnhtbagezfngxssfmfgjgudneeqrcnjcwfgswplsbmnmqofcbvtbofdzvpisbaprldtdxsqisbfiylfuiapqqconwjojidllqnzaxihedoivenjhfzuzkgrwfkqlzzfrhlplkpomzkjipwbbbhdupciuegvxhcnzvrsbfpmsrjmipvbaiiiejhfjztzsamfpfnmafcqqysceygxuztjtewrifguqvrquevgvqxycxfielransjhnelsvcwspeahttossbesuvrzzwuoprvenkwbincrbfkmkfhscgcbfvslcaafxjjzhrxusnpstbzjwxesktuiceolsgulawulxjjxwceztgifqqyddcmcuhhcyvmractjauggeeizkqwwsfmlyeafgujkxbcedqerikoxrqrbcgiridiymnhacvftqhwvdogqfrslabrcwnriduqdvllarugupgifklbgpxzuahyofagebmfluwvsxyzpyvldvdfxeolaijjsnwbwogyravlqxrqzwuddlaehsosrivvckzlxcnolputtdwqddaaosezptatfjfvfnhuvyaheuukw"));
