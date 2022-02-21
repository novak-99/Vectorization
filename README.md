# Vectorization

## About
This project is a quick demo of vectorization using C++ and x86_64 ASM. It mainly serves to illustrates its power and utility.

## What is Vectorization 
Vectorization refers to a family of techniques which can be used to perform sequential operations in groups at once, typically in the context of array operations. 

For example, let's say you have to carry out element-wise addition of two vectors(1D arrays): 

```[ 1  2  3  4  5 ] + [ 1  2  3  4  5 ]```

The above operation would, in typical programming, be done sequentially. That is to say that each operation would be done one at a time. The operation, ```vector1[0] + vector2[0]```, would be executed, following by the next one, until all of the operations have been done. 

However,this operation can be optimized, as the addition of the elements can be done simultaneously in one operation at the hardware level. This is the idea behind vectorization. 

## Techniques for Vectorization in C/C++
