#include <stdio.h>

void init(int *arr);
void loop(int *arr, int n);

int main() {
    int n = 10, arr[n+2], i;
    init(arr);
    loop(arr, n);
    for (i = 0; i < n+2; i++) {
        printf("%d, ", *(arr+i));
    }
    printf("\n");
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
