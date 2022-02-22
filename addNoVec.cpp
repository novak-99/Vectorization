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

    for(int i = 0; i < ARR_SIZE; i++){ // ARR_SIZE = 4096 * 128
        for(int j = 0; j < ADD_NUM; j++){ // Add 1000 times.
            arr3[i] = arr1[i] + arr2[i];
        }
    }
    // for(int i = 0; i < ARR_SIZE; i++){
    //     std::cout << arr3[i] << std::endl;
    // }

    return 0;
}