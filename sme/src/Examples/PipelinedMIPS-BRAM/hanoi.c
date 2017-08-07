#include <stdio.h>

int n = 3;
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
    draw();
    tower(n, &f, &a, &t);
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
    if (num == 1) {
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
        draw();
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
        draw();
        tower(num-1, aux, to, from);
    }
}
