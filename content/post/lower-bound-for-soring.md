---
title: "Lower Bound for Sorting"
date: 2017-09-05T08:36:49+08:00
draft: false
---

### Lower bounds for sorting

In a comparions sort, we perform one of the tests In a comparison sort, we perfrom one of the test $a_i≤a_j,a_i\<a_j,a_i=a_j,a_i≥a_j,$or $a_i>a_j$ to determine their realtie order. we cant obtain the order information in any other way.

**The decision-tree model**

We can view comparison sort abstractly in terms of decision trees, A decision tree is a full binary tree that represents the comparions between elements that are performed by a particular sorting algorithm on an input of a given size. 

<div style="text-align:center"><img src ="../img/decision.png" /></div>

Because any correct sorting algorithm must be able to produce each permutation of its input, each of the n! permutations on n elements must appear as one of the leaves of the decision tree for a comparison sort to be correct. Futhermore, each of these leaves must be reachable from the root by a downward path corresponding to an actual execution of the comparison sort. Thus, we shall condsider only decision trees in which each permutation apperas as a reachable leaf.

**A lower bound for worst case**

The length of the longest simple path fro the root of a decision tree to any of its reachable leaves represents the worst-case number of comparisons that the corresponding sorting algorithm performs, Consequently, the worst-case number of comparisons for a given comparison sort algorithm equalsthe height of its decision tree.

**Theorem.** Any comparison sort algorithm requires $Ω(nlgn)$ comparisons in the worst case. 

**Proof.** Consider a decision tree of height h with l reachable leaves corresponding to a comparison sort on n elements. Because each of the n! permutations of the input appers as some leaf, we have n!<l, Also since a binary treee of height h has no more than $2^h$ leaves, we have$n!≤l≤2^h$, which gives us $h≥lg(n!)=Ω(nlgn)$. 

