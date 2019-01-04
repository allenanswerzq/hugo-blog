---
title: "Disjoint Set"
date: 2018-05-04T10:53:28+08:00
draft: true
---

### 1. Disjoint sets

A disjoint-set data structure maintains a collection $Π=\{S_1,S_2,…,S_k\}$ of disjoint dynamic sets.

We indetify each set by a **representative**, which is some member of the set. We care only that if we ask for the representitave of a dynamic set twice without modifying the set between the requests, we get the same answer both time.

We wish a data structure to support following operations:

>1. Make-Set(x) create a new set whose only member is x which is a number. x shouldn't already be in some other set.
>2. Union(x,y) unites the dynamic sets that cotains x and y, say S_x and S_y into a new set which is the union of these two sets. The representative of the resulting set is any number of $S_x\cup S_y$
>3. Find-Set(x) returns a pointer to the representative of the (uniqe) set containing x.

### 2. Example application

Determin the connected component of an undirected graph

<div style="text-align:center"><img src ="../img/disjoint.png" /></div>

<div style="text-align:center"><img src ="../img/disjoint-1.png" /></div>

Algorithm

```cpp
Connected-Components(G)
1 for each vertex u∈G.V
2   Make-Set(u)
3 for each egde (u,v)∈G.E
4   if Find-Set(u) ≠ Find-set(v)
5     Union(u,v)
```

### 3. Linked-list representation of disjoint sets

Each object in the list contains a set member (number), a pointer to the next object in the list, and a pointer back to the set object (for finding the representative which is the first object's value in the list pointed by head pointer).

<div style="text-align:center"><img src ="../img/disjoint-2.png" /></div>

<div style="text-align:center"><img src ="../img/disjoint-3.png" /></div>

Make-Set(x): O(1)

Find-Set(x): O(1)

**Simple Union(x,y):**

We perform Union(x,y) by appending y's list onto the end of x's list. the representative of x's list becomes the respresentative of the resulting set. We have to update the pointer to the set object for each object originally on y's list, which take time linear in the length of y's list. 

Constuct a sequence of n Make-Set operations followed by n-1 Union operations that requires Θ(n) time.

The amortized time for each operation is Θ(n).

<div style="text-align:center"><img src ="../img/disjoint-4.png" /></div>

**A weighted-union:**

The above implementation of the Union procedure requires an average of Θ(n) time per call because we may be appending a longer list onto a shorter list; We can always append the shorter list onto the longer, with this simple change, a sequence of m Make-Set, Union and Find-Set operations, n of which are Make-Set operations, takes O(m+nlgn) time.

###4. Disjoint-set forset implementation

We represent sets by rooted trees, with each node containing one member (number) and each tree representing one set.

<div style="text-align:center"><img src ="../img/disjoint-5.png" /></div>

Operations:

> 1. Make-Set(x) simply creates a tree with just one node
> 2. Find-Set(x) following x's parent pointer until we find the root of the tree 
> 3. Union(x, y) causes the root of one tree point to the root of other

If no any changes, we have not improved on the linked-list implementation, because a sequence of Union operations may create a tree that is jsut a linear chain of n nodes which means the Find-Set operation needs linear time.

Changes to improve running time:

> 1. union by rank: We make the root with smaller rank value point to the root with larger rank
> 2. path compression: Make each node on the find path point directly to the root, path compression doesn't change any ranks

Algorithm:

```cpp
Make-Set(x)
1 x.p = x
2 x.rank = 0

Union(x, y)
1 Link(Find-Set(x), Find-Set(y))
    
Link(x,y)
1 if x.rank > y.rank	// union by rank
2   y.parent = x
3 else 
4   x.parent = y
5 if x.rank == y.rank
6   y.rank = y.rank+1
    
Find-Set(x)
1 if x≠x.parent
2   x.parent = Find-Set(x.parent) // path compression
3 return x.parent
```

**The Find-set is two-pass method:** as it recurses, it makes one pass up the find path to find the root, and as the recusion returns, it makes a second pass back down to find path to update each node to point directly to the root

Use both union by rank and path compression, the worst-case running time is O(ma(n)) for m disjoint-set operations on n elements, where a(n) is a very slowly growing function. We can view the running time as linear in m in all practical situation, **which means amortized cost for each operation is O(1).**