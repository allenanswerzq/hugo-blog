---
title: "B Tree"
date: 2018-03-27T10:35:10+08:00
tags: ["algo"]
draft: true
---

#### Definition of B-tree
A B-tree T is a rooted tree having following properies:
1. Every node x has the following attributes:
  > (a. x.n, the number of keys currently stored in node x,
  > (b. the x.n keys themselves, x.key1, x.key2, ... x.keyx.n, stored in nondecreasing order, so that x.key1 <= x.key2 <= ... <= x.keyx.n,
  > (c. x.leaf, a boolean value that is TRUE if x is a leaf and FALSE if x is an internal node.

2. Each internal node x also contains x.n + 1 pointers x.C1, x.C2, ..., x.Cx.n+1 to its children. Leaf nodes have no children, and so their ci attributes are undefined.

3. The keys x:keyi separate the ranges of keys stored in each subtree: if ki is any key stored in the subtree with root x:ci, then k1 ! x:key1 ! k2 ! x:key2 ! "" " ! x:keyx: n ! kx: nC1 :

4. All leaves have the same depth, which is the tree’s height h.

5. Nodes have lower and upper bounds on the number of keys they can contain. We express these bounds in terms of a fixed integer t % 2 called the minimum degree of the B-tree:
  a. Every node other than the root must have at least t $ 1 keys. Every internal
  node other than the root thus has at least t children. If the tree is nonempty,
  the root must have at least one key.
  b. Every node may contain at most 2t $ 1 keys. Therefore, an internal node
  may have at most 2t children. We say that a node is full if it contains exactly



