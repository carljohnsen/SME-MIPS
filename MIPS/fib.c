#include <stdio.h>
#include <time.h>
#include <stdint.h>

void init(int *arr);
void loop(int *arr, int n);

int main() {
    struct timespec start, end;
    clock_gettime(CLOCK_MONOTONIC_RAW, &start);
    int n = 10, arr[n+2], i;
    init(arr);
    loop(arr, n);
    clock_gettime(CLOCK_MONOTONIC_RAW, &end);
    uint64_t delta = (end.tv_sec - start.tv_sec) * 1000000 + (end.tv_nsec - start.tv_nsec) / 1000;
    for (i = 0; i < n+2; i++) {
        printf("%d, ", *(arr+i));
    }
    printf("\n");
    printf("%lu\n", delta);
}

void init(int *arr) {
    *(arr)   = 1;
    *(arr+1) = 1;
}

void loop(int *arr, int n) {
    int i, tmp1, tmp2, tmp3;
    for (i = 0; i < n; i++) {
        tmp1 = *(arr+i);
        tmp2 = *(arr+i+1);
        tmp3 = tmp1 + tmp2;
        *(arr+i+2) = tmp3;
    }
}
