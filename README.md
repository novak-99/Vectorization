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
As mentioned, vectorization is employed at the hardware level, meaning that ASM language must be used. The good news is that utilizing assembly can be abstracted (though we'll still analyze a couple snippets of ASM code, just for demonstration), with what are called *intrinsic functions*, which are functions which are handled compiler. They are useful because they allow more low-level interaction with hardware, but do not explicitly need to be implemented in ASM code.  

C/C++ offer a header file called ```<immintrin.h>``` which offer a large amount of intrinsic functions we can use for optimization. For this demonstration, we will specifically be utilizing the AVX2 suite of intrinsic functions, developed by Intel, which allow for concurrent vector operations, like the vector addition example. 
