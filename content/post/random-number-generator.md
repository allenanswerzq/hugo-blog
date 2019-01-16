---
title: "Random Number Generator"
date: 2017-07-23T09:52:12+08:00
draft: false
---

### Update:

Seems like there has a bug coming out recently from linux kernel that about rng, should take some time to read [this](https://bugs.chromium.org/p/project-zero/issues/detail?id=1559).

### Introduction

Random numbers are useful in many kinds of application.  For example:

> Simulation
> 
> Sampling
> 
> Numerical analysis
> 
> Computer programming
> 
> Decision making

What the word "random" means???

> We speak a sequence of independent random numbers with a specific distribution, each number in that sequence was obtained by chane, having nothing to do with other other numbers of the sequence, and that each number has a specific probablity of falling in any given range of values.

Sequences generated in a deterministic (each number is determined by it's predecessor) way usually called pseudo-random.

#### Liner Congruential Method

We will use this equation to get a new sequence number iteratively from some random start point $X_0$ .

>  $X_{n+1}=(aX_n+c) \mod m$

Obviously we can see that, the result number totally depend on how do we choose $a, c, m$,  A lot of studies had been working on how to choose these numbers carefully to get high quality random numbers and also with high spped to calculate.



Some of the considerations are:

> $m$ value determines the repeation period of the sequence, of course, we want this period to be fairly larger in order to fullfill more wider application.  for a $e$ bits machine, the maximum number is $2^e$, the good value for $m$ can be $2^e-1$.
> 
> $a$ also has significant effect on the period of generated random numbers sequences, so also need to choose a value carefully.



In reality, most variants based on this method are widely used.

#### Generators

1. Number generator: is a function tath takes zero argumetns and returns a number.

2. Uniform Random Number Generator: provides a sequence of random numbrs *uniformly distributed* on a given range.

3. Non-deterministic uniform random generator: is a uniform random number generator that provides a sequences of truly-random numbers(*TODO how this actually worked???*). 

4. Presudo random number generator: provides a deterministic sequence of pseudo-random numbers, based on algorithm and intelnal state, Liner congrential method is a example of such algorithm.

5. Random distribution: produces numbers distributed according to some distribution, given uniformly distributed random value as input. The methods used for this transformation are 

   > [Transformation method](https://en.wikipedia.org/wiki/Inverse\_transform\_sampling?oldformat=true)
   > 
   > [Rejection method](https://en.wikipedia.org/wiki/Rejection_sampling?oldformat=true)



#### Programming tips

First and most important one: very, very suspicious useage of a system-suppiled rand() function.

If you want to generate a random interger between 1 and 10, you should always do it using high-order bits. as in:

  ```cpp
   j = 1 + (int) (10.0 * rand() / (RAND_MAX + 1.0));
  ```

Quick and dirty generator which generates a integer between jlo and jhi, inclusive. (im = 6075, ia=106, ic=1283)

  ```cpp
  unsigned long jran,ia,ic,im;
  jran = (jran * ia + ic) % im;
  j = jlo + ((jhi - jlo + 1 ) * jran) / im;
  ```

  ```cpp
   unsigned long jran,ia,ic,im;
   float ran;
   jran = (jran * ia + ic) % im;
   ran = (float) jran / (float) im;
  ```

Since c++11, there have built-in functions to handle random number generate correctly, we can find more on the offical documents.

### References:

The art of computer programming, second edition.

Numerical recipes in C, second edition.

http://www.boost.org/doc/libs/1_43_0/doc/html/boost_random/reference.html#boost_random.reference.concepts.introduction
