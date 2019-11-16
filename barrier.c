#include <stdio.h>
#include <omp.h>
#include <stdlib.h>
int main(int argc,char** argv){
   printf("\n");
   if(argc > 1){
    omp_set_num_threads(atoi(argv[1]));
   }
   #pragma omp parallel	
   {
     int id = omp_get_thread_num();
     int numThreads = omp_get_num_threads();
     printf("Thread %d of %d is	BEFORE the barrier.\n",id, numThreads);
     #pragma omp barrier	
     printf("Thread %d of %d is	AFTER the barrier.\n",id, numThreads);
   }
   printf("\n");
   return 0;
}
