#include <stdio.h>

char slowestKey(int keyTimes_rows, int keyTimes_columns, int** keyTimes) {
    int lastTime = keyTimes[0][1];
    for (int i = 1; i < keyTimes_rows; ++i) {
        int tmp = keyTimes[i][1];
        keyTimes[i][1] -= lastTime;
        lastTime = tmp;
    }
    for (int i = 0; i < keyTimes_rows; ++i) {
        printf("[%d, %d]\n", keyTimes[i][0], keyTimes[i][1]);
    }
    int slowestIndex = 0;
    for (int i = 1; i < keyTimes_rows; ++i) {
        if (keyTimes[i][1] > keyTimes[slowestIndex][1]) {
            slowestIndex = i;
        }
    }
    return (char)(keyTimes[slowestIndex][0] + 97);
}

