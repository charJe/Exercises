#include <stdlib.h>
#include <stdio.h>
typedef struct {
    int priority;
    int ogIndex;
} Photo;

int cmpPhoto(const void* a, const void* b) {
    Photo* one = ((Photo*)a);
    Photo* two = ((Photo*)b);
    if (one->priority < two->priority) {
        return -1;
    } else if (one->priority > two->priority) {
        return 1;
    } else if (one->ogIndex < two->ogIndex) {
        return -1;
    } else if (one->ogIndex > two->ogIndex) {
        return 1;
    } else
        return 0;
}

int* photoAlbum(int index_count, int* index, int identity_count, int* identity, int* result_count) {
    Photo album[index_count];
    for (int i = 0; i < index_count; ++i) {
        album[i].ogIndex = identity[i];
        album[i].priority = index[i];
    }
    qsort(album, sizeof(Photo), index_count, cmpPhoto);
    int* result = (int*)album;
    return result;
}
