#include <string.h>
#include <math.h>
#define MAGIC_NUM (int)(pow(10, 9) + 7);

int mapDecoding(char* message) {
    int length = strlen(message);
    if (length > 0 && message[0] == '0') {
        return 0;
    } else if (length == 1) {
        return 1;
    }
    int i = 1,
        count = 1,
        previousCount = 1;
    do {
        char current = message[i],
            previous = message[i-1];
        if (current == '0' && !(previous == '1' ||
                                previous == '2')) {
            return 0;           /* invalid input */
        } else if (((previous == '1' && current != '0')
                    ||
                    ( previous == '2' && current != '0' && current <= '6'))
                   &&
                   ((i+1 < length)? message[i+1] != '0' : 1)) {
            int temp = count;
            count = (count + previousCount) % MAGIC_NUM;
            previousCount = temp;
        } else {
            previousCount = count;
        }
    } while (++i < length);
    return count % MAGIC_NUM;
}
