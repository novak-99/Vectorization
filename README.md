# Vectorization

## About
This project is a quick demo of vectorization using C++ and x86_64 ASM. It mainly serves to illustrates its power and utility.

## What is Vectorization 
Vectorization refers to a family of techniques which can be used to perform sequential operations in groups at once, typically in the context of array operations. 

For example, let's say you have to carry out element-wise addition of two vectors(1D arrays): 

```[ 1  2  3  4  5 ] + [ 1  2  3  4  5 ]```

The above operation would, in typical programming, be done sequentially. That is to say that each operation would be done one at a time. The operation, ```vector1[0] + vector2[0]```, would be executed, following by the next one, until it has reached the last index both vectors. 

However, this operation can be optimized, as the addition of the elements can be done simultaneously, in one operation, at the hardware level. This is the idea behind vectorization. 

## Techniques for Vectorization in C/C++
As mentioned, vectorization is employed at the hardware level, meaning that assembly language must be used. The good news is that utilizing assembly can be abstracted (though we'll still analyze a couple snippets of ASM code, just for demonstration), with what are called *intrinsic functions*, which are functions that are handled by the compiler. They are useful because they allow more low-level interaction with hardware, but do not explicitly need to be implemented in ASM code.  

C/C++ offer a header file called ```<immintrin.h>``` which offers a large amount of intrinsic functions we can use for optimization. For this demonstration, we will specifically be utilizing the AVX2 suite of intrinsic functions, developed by Intel, which allow for concurrent vector operations, like the vector addition example. The AVX2 is also quite efficient because it is able to handle vectors of size 256 bits, or in other words, 8 integers, 8 floats, or 4 doubles at one time. 

## Demonstration with AVX2

### Preliminaries
To follow along with this demonstration, you will need to have the g++ compiler installed, as well as the two cpp files from the repository, entitled ```add.cpp``` and ```addNoVec.cpp```. 

### Evaluation
If we open the ```addNoVec.cpp``` file, we notice the following loop at line 21:
```cpp 
for(int i = 0; i < ARR_SIZE; i++){ // ARR_SIZE = 4096 * 128
    for(int i = 0; i < ADD_NUM; i++){ // Add 1000 times.
        arr3[i] = arr1[i] + arr2[i];
    }
}
```
Effectively, we notice 2 contiguous C++ arrays are being added and saved into a third array, ```arr3```. We notice that the size of the array is 4096 * 128 (524288), and that each iteration, the summation occurs 1000 times. Let's now look at the same code, except vectorized and optimized using intrinsic functions. 

Meanwhile, in the file ```add.cpp```, also at line 21, we see the same loop except vectorized. Note the inclusion of the ```<immintrin.h>``` header file. 

```cpp

for(int i = INTRIN_SIZE; i <= ARR_SIZE; i+=INTRIN_SIZE){ // ARR_SIZE = 4096 * 128
        __m256 sub_arr1 = _mm256_set_ps(arr1[i-8], arr1[i-7], arr1[i-6], arr1[i-5], 
                arr1[i-4], arr1[i-3], arr1[i-2], arr1[i-1]); // first iteration: 0,1,2,3,4,5,6,7...

        __m256 sub_arr2 = _mm256_set_ps(arr2[i-8], arr2[i-7], arr2[i-6], arr2[i-5], 
                arr2[i-4], arr2[i-3], arr2[i-2], arr2[i-1]); 

        for(int i = 0; i < ADD_NUM; i++){ // Add 1000 times. 
            __m256 sub_arr3 = _mm256_add_ps(sub_arr1, sub_arr2);
        }
    }
```
