---
title: "Should know about caches"
date: 2017-08-24T16:37:23+08:00
tags: ["algo"]
draft: false
---

### Introduction

So i was always curious about the cpu cache stuff, how they really work? what are the effects of the cache for a specific program? what should i aware when i write a code or design a algorithm? After dug internet for a while, i want to write down some of the notes i have learned so for.

### Structure of the cpu caches

Here a nice picture will show the internal structure of the one cpu core memory and caches, for multiple cpu cores the structure is a little different.

<div style="text-align:center"><img src ="/media/posts/img/image.png" /></div>

We can clearly see that between the cpu and the main memory there are three level caches exist, and there have the wire connection between any two adjacent levels. It means there can have data transformation between each other. Also the more darker green color means more slower speed access to it from cpu. So L1 level is the fastest cache. The difference here for L1 cache is that it splits the data and instruction cache, and other level caches dont distinguish them.

### Spatial and temporary locality 

For a program, they are saying that it might have two kinds of localities, one is spatial locality and the other is temporary locality. It shows the fact that the data you are accessing right now maybe is very adjacent to the data you will access in the future, we call this spatial locality, for temporary locatlity it shows that the part of code you are executing right now maybe will be excuted again in a very short time, because there might have a lot of loops in that program.

Knowing this concept is very important to understand how cache works.

### Simple explanation of how it works

We know that cache is just copy a backup of one main memory block inside itself, instead of accessing from a solwer main memory block, we will always access cache first if there have the data we needed.

For the sake of simplicity, just ignore all the very specific details like **cache entry structure** which is used for storing actual data fetched from main memory and  **associativity** which determines how to map one main memory chunk to one cache block. for these details we can find more information on the [Internet](https://en.wikipedia.org/wiki/CPU_cache?oldformat=true). 

When we access **(here means read or write)** a data, first we check cache, if it's alreay in there, we will directly access the data on cache which is very fast, we count this as a **cache hit**. if it's not in cache we need bring one block or chunk data from main memory that containg the data we want to access to cache which is counted as one **cache miss**, and the we access that data from cache. 

Since cache size is limited, so there is concept that we must need to kick some of the chunk out if we want to bring new chunk in. There are some algorithm doing this, most   common algorithm is called **LRU**, and this process called **eviction**.

 Since there are three level caches, what is the way to transfer data between them???

Well, turns out there are two different ways for this questions, one if ___exclusive cache___ which mainly used by AMD and the other is ___inclusive cache___ which used by Intel.

For exclusive cache an eviction from L1d pushes the one cache chunk (also called cache line) down into L2. This of course means room has to be made in L2. If L2 has no room for this chunk, it will push the content into L3 and ultimately into the main memory. For inclusive cache where each each line in L1d is also present in L2, Therefore eviciting from L1d is much faster. The disadvantage of this way is that it wastes cache memory for holding the same content in two different places.

### Tests

Check the size of caches:

```bash
/vagrant git:master ❯ lscpu | grep cache
<_____________
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              4096K
```

Verify it through code: randomly access one array which has different workset size and measure the time cost.

```cpp
// Define array struct
struct elem {
   struct elem *next;
}array[SIZE];

// Randomly access this array for N time which is a big number.
// Before access we also need to randomly shuffle the array.
// Since cpu has the prefetching technique.
gettimeofday(&start, NULL);
struct elem *i = array;
for (size_t n = 0; n < N; ++n) { 
    dummy += (int64_t)i;
    i = i->next;
}
gettimeofday(&end, NULL);
usec = usec_diff(&start, &end);
```

<div style="text-align:center"><img src ="/media/posts/img/image-1.png" /></div>

Check the size of one cache chunk (cache line):

```bash
/vagrant git:master ❯ getconf LEVEL1_DCACHE_LINESIZE; getconf LEVEL2_CACHE_LINESIZE
<_____________
64
64
```

Verify it use code: we can access one data every step size and measure the time cost.

```cpp
int64_t* array = (int64_t*)calloc(SIZE, sizeof(int64_t));
clock_t t0 = clock();
for (size_t i = 0; i < SIZE; i += STEP) {
    array[i] &= 1;  // Do something.
}
clock_t t1 = clock();
```

The full code can be found on my [github](https://github.com/landcold7/magic-caches).

### Thoughts

For now, I have learned is that if we want our programs have better performance, we should try to make them cache-friendly meaning is that our program should have better spatial locality and temporary locality.

### References
https://en.wikipedia.org/wiki/CPU_cache?oldformat=true

https://meribold.github.io/2017/10/20/survey-of-cpu-caches/#listing-1

http://igoro.com/archive/gallery-of-processor-cache-effects/
