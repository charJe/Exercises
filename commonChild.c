#include <string.h>
#include <stdlib.h>
#include <stdio.h>
int** memo;
void printMatrix(int len, int mat[len][len]) {
    for(int r = 0; r < len; ++r) {
        for(int c = 0; c < len; ++c) {
            printf("%d ", mat[r][c]);
        }
        printf("\n");
    }
}

int max(int one, int two) {
    return ((one > two)? one : two);
}

int commonChild(char* s1, char* s2) {
    int n = strlen(s1);
    memo = calloc(n+1, sizeof(int*));
    for(int r = 0; r < n+1; ++r) {
        memo[r] = calloc(n+1, sizeof(int));
    }
    /* zero out memo */
    for(int r = 0; r < n+1; ++r) 
        for(int c = 0; c < n+1; ++c) 
            memo[r][c] = 0;
    for(int i1 = 0; i1 < n; ++i1)
        for(int i2 = 0; i2 < n; ++i2) 
            if(s1[i1] == s2[i2])
                memo[i1+1][i2+1] = memo[i1][i2] + 1;
            else
                memo[i1+1][i2+1] = max(memo[i1][i2+1],
                                    memo[i1+1][i2]);
    return memo[n][n];
}

int main() {
    printf("%d\n", commonChild("SHINCHAN", "NOHARAAA"));
    free(memo);
    return 0;
}
