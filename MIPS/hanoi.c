#include <stdio.h>
#include <time.h>
#include <stdint.h>

int n = 5;
int *a;
int *b;
int *c;

void draw();
void init(int num, int *from, int *to, int *aux);
void tower(int num, int **from, int **to, int **aux);

int main() {
    int from[n], to[n], aux[n];
    a = from; b = to; c = aux;
    init(n, from, to, aux);
    int *f = from+n, *t = to, *a = aux;
    struct timespec start, end;
    clock_gettime(CLOCK_MONOTONIC_RAW, &start);
    //draw();
    tower(n-1, &f, &a, &t);
    //draw();
    clock_gettime(CLOCK_MONOTONIC_RAW, &end);
    uint64_t delta = (end.tv_sec - start.tv_sec) * 1000000 + (end.tv_nsec - start.tv_nsec) / 1000;
    printf("%lu", delta);
}

void draw() {
    int i;
    printf("[");
    for (i = 0; i < n; i++) printf("%d,", *(a+i));
    printf("]");
    printf("[");
    for (i = 0; i < n; i++) printf("%d,", *(b+i));
    printf("]");
    printf("[");
    for (i = 0; i < n; i++) printf("%d,", *(c+i));
    printf("]\n");
}

void init(int num, int *from, int *to, int *aux) {
    int i;
    for (i = 0; i < num; i++) {
        *(from+i) = num - i;
        *(to+i) = 0;
        *(aux+i) = 0;
    }
}

void tower(int num, int **from, int **to, int **aux) {
    int *t, *f;
    if (num == 0) {
        t = *to;
        f = *from;
        f--;
        *t = *f;
        t++;
        *f = 0;
        *to = t;
        *from = f;
        // *((*to)++) = *(--(*from));
        // *(*from) = 0;
        //draw();
    } else {
        tower(num-1, from, aux, to);
        t = *to;
        f = *from;
        f--;
        *t = *f;
        t++;
        *f = 0;
        *to = t;
        *from = f;
        //*((*to)++) = *(--(*from));
        //*(*from) = 0;
        //draw();
        tower(num-1, aux, to, from);
    }
}
