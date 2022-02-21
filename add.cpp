#include <vector>
#include <iostream>

#include <immintrin.h>

int main(){
    const int INTRIN_SIZE = 8; 
    const int ARR_SIZE = 4096*128; 

    const int ADD_NUM = 1000;

    float arr1[ARR_SIZE];
    float arr2[ARR_SIZE];
    float arr3[ARR_SIZE];

    for(int i = 0; i < ARR_SIZE; i++){
        arr1[i] = i; 
        arr2[i] = 2*i;
    }

    for(int i = INTRIN_SIZE; i <= ARR_SIZE; i+=INTRIN_SIZE){ // ARR_SIZE = 4096 * 128
        __m256 sub_arr1 = _mm256_set_ps(arr1[i-8], arr1[i-7], arr1[i-6], arr1[i-5], 
                arr1[i-4], arr1[i-3], arr1[i-2], arr1[i-1]); // first iteration: 0,1,2,3,4,5,6,7...

        __m256 sub_arr2 = _mm256_set_ps(arr2[i-8], arr2[i-7], arr2[i-6], arr2[i-5], 
                arr2[i-4], arr2[i-3], arr2[i-2], arr2[i-1]); 

        for(int i = 0; i < ADD_NUM; i++){ // Add 1000 times. 
            __m256 sub_arr3 = _mm256_add_ps(sub_arr1, sub_arr2);
        }
    }

    // for(int i = 0; i < ARR_SIZE; i++){
    //     std::cout << arr3[i] << std::endl;
    // }

    return 0;
}