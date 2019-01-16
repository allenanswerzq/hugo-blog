---
title: "Breadth-first search"
date: 2018-03-28T20:05:10+08:00
tags: ["algo"]
draft: false
---

### 1. Breadth-first search

Given a graph G=(V,E) and a distinguished source vertex s, breadth-fist search explores the edges of G to discover every vertex that is reachable from s, It computes the distance from s to each reachable vertex. For any vertex v reachable from s, the simple path in the breadth-first tree from s to v corresponds to a shortest path from s to v in G, that is, a path containing the smallest number of edges. The algorithm works on both directed and undirected graph.

Algorithm:

```cpp
BFS(G,s)
1 for each vertex u∈G.V-{s}
2   u.color=WHITE
3   u.d=∞
4   u.π=nil
5 s.color=GRAY
6 s.d=0
7 s.π=nil
8 Q=empty
9 Enqueue(Q, s)
10 while Q is not empty
11   u = Dequeue(Q)
12   for each v∈G.adj[u]
13    if v.color＝WHITE
14     v.color=GRAY
15     v.d=u.d+1
16     v.π=u
17     Enqueue(Q, v)
18   u.color=BLACK
```

Running time: O(V+E)

### 2. Breadth-first trees

The procedure BFS builds a breadth-first tree as it searches the graph. The tree corresponds to the π attributes, More formally, for a G=(V,E) with source s, we define the predecessor subgraph of G as $G_π=(V_π,E_π)$, where $V_π=[v∈V:v.π=nil]∪[s]$ and $E_π=[(v.π,v):v∈V_π-[s]]$.

The predecessor subgraph of G_π is a breadth-first tree if $V_π$ consists of the vertices reachable from s and, for all v∈V_π, the subgraph G_π contains a unique simple path from s to v that is also a shortest path from s to v in G.

The following procedure prints out the vertice on a shortest path from s to v, assuming that BFS has already computed a breath-first tree:

```cpp
Print-Path(G,s,v)
1 if v＝s
2   print s
3 elseif v.π＝nil
4   print “no path from s to v exists”
5 else 
6   Print-Path(G,s,v.π)
7   print v
```



### 3. Questions suitable for solving use BFS

Problems that use BFS usually ask to find the **fewest number of steps (or the shortest path) needed to reach a certain end point (state) from the starting one**. Besides this, certain ways of passing from one point to another are offered, **all of them having the same cost of 1 (sometimes it may be equal to another number)**. Often there is given a N x M table (formed of N lines and M columns) where certain cells are passable and others are impassable, and the target of the problem is to find the shortest time/path needed to reach the end point from the start one. Such tables may represent mazes, maps, cities, and other similar things. These may be considered as classical BFS problems. Because BFS complexity is in most cases linear (sometimes quadratic, or N logN), constraints of N (or M) could be high – even up to 1 million.
