#include <stdio.h>
#include <stdlib.h>
typedef struct {
    int arrival;
    int departure;
}  Investor;

int dtime(const void* a, const void* b) {
    Investor* one = ((Investor*)a);
    Investor* two = ((Investor*)b);
    if (one->arrival < two->arrival) {
        return -1;
    } else if (one->arrival > two->arrival) {
        return 1;
    } else if (one->departure < two->departure) {
        return -1;
    } else if (one->departure > two->departure) {
        return 1;
    } else
        return 0;
}

int countMeetings(int arrival_count, int* arrival, int departure_count, int* departure) {
    Investor investors[arrival_count];
    for (int i = 0; i < arrival_count; ++i) {
        investors[i].arrival = arrival[i];
        investors[i].departure = departure[i];
    }
    qsort(investors, arrival_count, sizeof(Investor), dtime);
    for (int i = 0; i < arrival_count; ++i) {
        printf("%d, %d\n", investors[i].arrival, investors[i].departure);
    }
    int numberOfMeetings = 0;
    int day = 1;
    for (int i = 0; i < arrival_count; ++i) {
        if (day < investors[i].arrival) {
            day = investors[i].arrival;
        }
        if (day <= investors[i].departure) {
            ++numberOfMeetings;
            ++day;
        }
        
    }
    return numberOfMeetings;
}
