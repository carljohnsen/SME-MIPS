#include <stdio.h>

void load(int *a);
int partition(int *a, int p, int r);
void quicksort(int *a, int p, int r);

int main() {
    int arr[6], i;
    load(arr);
    quicksort(arr, 0, 5);
    for (i = 0; i < 6; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

void load(int *a) {
    *(a)   = 5;
    *(a+1) = 8;
    *(a+2) = 2;
    *(a+3) = 9;
    *(a+4) = 1;
    *(a+5) = 3;
}

int partition(int *a, int p, int r) {
    int x, i, j, tmp1, tmp2, *addr1, *addr2;
    addr1 = a + r;
    x = *(addr1);
    i = p - 1;
    for (j = p; j < r; j++) {
        addr1 = a + j;
        if (*(addr1) <= x) {
            i++;
            addr1 = a + i;
            addr2 = a + j;
            tmp1 = *(addr1);
            tmp2 = *(addr2);
            *(addr1) = tmp2;
            *(addr2) = tmp1;
        }
    }
    addr1 = a + i + 1;
    addr2 = a + r;
    tmp1 = *(addr1);
    tmp2 = *(addr2);
    *(addr1) = tmp2;
    *(addr2) = tmp1;
    return i + 1;
}

void quicksort(int *a, int p, int r) {
    if (p < r) {
        int q = partition(a, p, r);
        quicksort(a, p, q-1);
        quicksort(a, q+1, r);
    }
}
