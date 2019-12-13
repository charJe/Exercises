#include <stdio.h>
#include <stdbool.h>
#include <string.h>

bool isAnagram (char* s1, char* s2, int length) {
    int checkList[26];
    /* clear array */
    for(int i = 0; i < 26; ++i) 
        checkList[i] = 0;
    /* count letter frequency */
    for(int i = 0; i < length; ++i) {
        checkList[s1[i]-97]++;
        checkList[s2[i]-97]--;
    }
    /* check letter frequency */
    for(int i = 0; i < 26; ++i)
        if(checkList[i] != 0)
            return false;
    return true;
}

int sherlockAndAnagrams(char* s) {
    int count = 0;
    int limit = strlen(s);
    for(int len = 1; len < limit; ++len)
        for(int i1 = 0; i1 + len <= limit; ++i1)
            for(int i2 = i1 + 1; i2 + len <= limit; ++i2)
                if(i1 != i2 && isAnagram(s+i1,s+i2, len))
                    ++count;
    return count;
}

int main() {
    printf("%d", sherlockAndAnagrams("kkkk"));
    return 0;
}
