#include <stdio.h> // printf()
#include <omp.h> // OpenMP
#include <stdlib.h> // rand()
void initialize(int* a, int n);
int sequentialSum(int* a, int n);
int parallelSum(int* a, int n);
#define SIZE 1000000
int main(int argc, char** argv) {
int array[SIZE];
if (argc > 1) {
omp_set_num_threads( atoi(argv[1]) );
}
initialize(array, SIZE);
printf("\nSequential sum: \t%d\nParallel sum: \t%d\n\n",
sequentialSum(array, SIZE),
parallelSum(array, SIZE) );
return 0;
}
/* fill array with random values */
void initialize(int* a, int n) {
int i;
for (i = 0; i < n; i++) {
a[i] = rand() % 1000;
}
}
/* sum the array sequentially */
int sequentialSum(int* a, int n) {
int sum = 0;
int i;
for (i = 0; i < n; i++) {
sum += a[i];
}
return sum;
}
/* sum the array using multiple threads */
int parallelSum(int* a, int n) {
int sum = 0;
int i;
#pragma omp parallel for reduction(+:sum)
for (i = 0; i < n; i++) {
sum += a[i];
}
return sum;
}
