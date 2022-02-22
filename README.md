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
As mentioned, vectorization is employed at the hardware level, meaning that assembly language must be used. The good news is that utilizing assembly can be abstracted (though we'll still analyze a couple snippets of ASM code, just for demonstration), with what are called *intrinsic functions*, which are functions that are handled by the compiler. They are useful because they allow for more low-level interaction with hardware, but do not explicitly need to be implemented in verbose ASM code.  

C/C++ offer a header file called ```<immintrin.h>``` which offers a large amount of intrinsic functions we can use for optimization. For this demonstration, we will specifically be utilizing the AVX2 suite of intrinsic functions, developed by Intel, which allow for concurrent vector operations, like the vector addition example. The AVX2 is also quite efficient because it is able to handle vectors of size 256 bits, or in other words, 8 integers, 8 floats, or 4 doubles at one time. 

## Demonstration with AVX2

### Preliminaries
To follow along with this demonstration, you will need to have the g++ compiler installed, as well as the two cpp files from the repository, entitled ```add.cpp``` and ```addNoVec.cpp```. 

The ASM code snippets utilized in this demonstration are in x86_64 ASM and use the Intel dialect. 

### Evaluation
If we open the ```addNoVec.cpp``` file, we notice the following loop at line 21:
```cpp 
for(int i = 0; i < ARR_SIZE; i++){ // ARR_SIZE = 4096 * 128
    for(int i = 0; i < ADD_NUM; i++){ // Add 1000 times.
        arr3[i] = arr1[i] + arr2[i];
    }
}
```
Effectively, we notice 2 contiguous C++ arrays (which hold data of type 32-bit float) being added and saved into a third array, ```arr3```. We notice that the size of the array is 4096 * 128 (524288), and that for each iteration, the summation of both elements occurs 1000 times. Let's now look at the same code, except vectorized and optimized using intrinsic functions. 

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

The loop is similar to the first one, except with a few changes and optimizations. First, we notice that a peculiar type of data type is being used, which is called ```__m256```. Its   mechanics are very similar to the typical C++ array, but it has some computational advantages and particularities. For example, as you could tell by its name, it only contains 256 bits of data, which again, equates to 8 integers/floats. It also allows for vectorized subtraction, multiplication, and in this case addition operations to be performed. 

The code again loops through the elements of the two C++ float arrays, but does so in groups of 8 instead of 1- and as expected, this is because we can handle 8 elements of each array at once, instead of 1. The rest of the code involves storing these 8 items in our two ```__m256``` arrays, and performs the addition operation using the function ```_mm256_add_ps``` (vectorized addition) and then stores the result into a new ```__m256``` array, denoted as ```sub_arr3```. As before, this operation is done ```ADD_NUM``` or 1000 times per loop iteration.

### Performance Gains
Let's now analyze the ostensible gains in performance achieved by utilizing intrinsic functions to deal with 8 values at once. 

Using g++, create executables for ```add.cpp```:

```
g++ add.cpp -std=c++17 -march=native -o add.o
```

And for ```addNoVec.cpp```:

```
g++ addNoVec.cpp -std=c++17 -o addNoVec.o  
```

We add the ```march``` flag as this allows us to utilize intrinsic functions. Now, to test the execution time for each file, we can use ```time```:

```
time ./add.o 
```

And for ```addNoVec.cpp```:

```
time ./addNoVec.o > addNoVecTime.txt
```

Results will likely vary, but for ```add.o```, my execution time was stated to be:

```./add.o  0.12s user 0.01s system 97% cpu 0.125 total```

And for ```addNoVec.o```:

```./addNoVec.o  0.67s user 0.00s system 89% cpu 0.754 total```

Wow, that is a reduction in speed of over 6 times! If this was a very minor optimization for a trivial example, one could imagine the extent of efficiency that could be attained using techniques such as instrinsic functions/vectorization more thoroughly. 

### Assembly 
In using vectorized code, we made one major, saliant change to the inner working assembly code. We can get the ASM output for both of the files using g++ in a .s file (or alternatively you could use the ASM outputs in the repo directory):  

```
g++ add.cpp -std=c++17 -march=native -S -masm=intel
```

And for ```addNoVec.cpp```:

```
g++ addNoVec.cpp -std=c++17 -S -masm=intel 
```

If we look into both of the assembly files, we notice that in ```addNoVec.cpp```, the line: 

```nasm
addss	xmm0, dword ptr [rbp + 4*rax - 4194320]
```