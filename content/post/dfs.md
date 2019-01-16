---
title: "Depth-first search"
date: 2017-12-08T20:05:16+08:00
tags: ["algo"]
draft: false
---

### 1. Depth-first search

The strategy followed by depth-first search is, as its name implies, to search “deeper” in the graph whenever possible.

Recusive algorithm:

```cpp
// Use dfs to explore a graph G
DFS(G)
1 for each vevtex u∈G.V
2   u.color = WHITE
3   u.π = NIL  // mark the predecessor of a vertex as nil
4   time = 0
5 for each vertex u∈G.V
6   if u.color == WHITE
7     DFS-VISIT(G, u)
```

```cpp
DFS-VISIT(G, u)
1 time = time+1
2 u.d = time // discovery time
3 u.color = GRAY
4 for each v∈G.Adj[u] // explore egde (u, v)
5   if v.color == WHITE
6     v.π = u
7     DFS-VISIT(G, v)
8 u.color = BLACK
9 time = time+1
10 u.f = time // finish time
```

Iterative algortihm:

```cpp
DFS-itervative(G, u)
1 Let s be a stack
2 S.push(u)
3 while S is not empty
4   v = S.pop()
5   if v is not labeled as visited
6     label v as visited
7     for each w in Adj[v]
8       S.push(w)
```

Running time: O(V+E)

During an execution of DFS-VISIT(G, u), the loop on lines 4-7 executes |Adj[v]| times, So total cost of executing of lines 4-7 in DFS(G) is $\sum_{v∈V}|Adj[v]|=\Theta(E)$. $\Theta(E)+\Theta(V)=\Theta(E+V)$ Since we dont know which one is donmination item in E and V.

#### Properties

>1. Predecessor subgraph G_π forms a forest of trees.
>2. Vertex v is a descendent of vertex u in the depth-first forset if v is discovered during the time in which u is gray.
>3. Discovery and finishing times have parenthesis structure.
>4. Classification of edges:
>   1. ___Tree edges___
>   2. ___Back edges___
>   3. ___Forward edges___
>   4. ___Cross edges___ 

<div style="text-align:center"><img src ="/media/post/img/dfs.png" /></div>

<div style="text-align:center"><p>Depth-first search</p></div>

<div style="text-align:center"><img src ="/media/post/img/dfs-1.png" /></div>

<div style="text-align:center"><p>Depth-first forest</p></div>

#### Depth-first forest: predecessor subgraph of depth-first search. 

**Definition:** $G_π=(V,E_π),$ where $E_π=[(v.π,v):v∈V$ and $v.π≠nil ]$ The predecessor subgraph of depth-first search forms a depth-first forest comprising several depth-first trees. The edges in $E_π$ are tree edges.

**Theorem:** (White-path theorem) In a depth-first forest of a (directd or undirected) graph G=(V,E), vertex v is a descendant of vertex u if and only if at the time u.d that the search discovers u there is path from u to v consisting entirely of white vertices.

**Theorem:** In a depth-first search of an undirected graph G, every edge of G is either a tree edge or a back edge.

### 2. Topological sort

A topological sort of a dag(directed acyclic graph) G=(V,E) is a linear ordering of all its vertices such that if G contains an edge (u,v), then u appears before v in the ordering.

Algorithm:

```cpp
Topological-Sort(G)
1 call DFS(G) to compute finishing times v.f for each vertex v
2 as each vertex is finished, insert it onto the front of a linked list
3 return the linked list of vertices
```

Running time: O(V+E)

### 3. Strongly connected components

A strongly connected components of a **directed graph** G=(V,E) is **maximal set of vertices** C⊆V such that for every pair vertices u and v in C, we have both u⟶v and v⟶u, that is, vertices u and v are reachable from each other.

**Transpose operation of a graph:** $G^T=(V,E^T),$ where $E^T=[(u,v):(v,u)∈E]$. That is, $E^T$ consists of the edges of G with their directions reversed.

G and $G^T$ have exactly the same strongly connected components.

Component Graph: $G^{SCC}=(V^{SCC},E^{SCC})$

<div style="text-align:center"><img src ="/media/post/img/dfs-2.png" /></div>

<div style="text-align:center"><img src ="/media/post/img/dfs-3.png" /></div>

<div style="text-align:center"><img src ="/media/post/img/dfs-4.png" /></div>

**Lemmas**

>1. Let C and C' be distant strongly connected components in directed graph G=(V,E), let u,v∈C, let u',v'∈C', and suppose that G contains a path from u to u'. Then G cannot also contain a path v'  to v'.
>2. If U⊆V, then we define d(U) = min_(u∈U){u.d} and f(U)=max_(u∈U){u.f}. That is, d(U) and f(U) are the earliest discovery time and latest finishing time, respectively. Let C and C' be distinct strongly connected components in directed graph G. Suppose that there is an edge (u,v)∈E, where u∈C and v∈C'. Then $f(C) > f(C')$. 

Algorithm:

```cpp
Strongly-Connected-Components(G)
1 call DFS(G) to compute finishing time u.f for each vertex u
2 compute G^T
3 call DFS(G^T), but in the main loop of DFS, consider the vertices in order of decreasing u.f
4 output the vertices of each tree in the depth-first forest formed in line 3 as a separate strongly connected component
```

**Proof**. Use induction method to prove above algorithm's correctness. The inductive hypothesis is that the first k trees produced in line 3 are strongly connected components.

### 4. Articulation point, bridges, and biconnected components

Let G=(V,E) be a connected, undirected graph.

> 1. Articulation point(cut point): A vertex whose removal will disconnect G
> 2. Bridge: A edge whose removal will disconnect G
> 3. Biconnected component: A **maxmial set of egdes** such that any two edges lie on a common simple cycle. An egde lies on a simple cycle means that this edge is a part of that cycle. 

<div style="text-align:center"><img src ="/media/post/img/dfs-5.png" /></div>

A vertex is a Articulation point if:

> 1. It is a root vertex of $G_π$ and has at least two children in $G_π$
>
>
> 2. It is nonroot vertex of $G_π$ and has a child s such that there is no back edge from s or from any descendant of s to a proper ancestor of it 

Algorithms:

$v.low=min(v.d,w.d)$ $(u,w)$ is a back edge from some descendant $u$ of $v$. That is, v.low is  the earilest egde we can access from a subtree rooted in v of $G_π$.

```cpp
Articulation-Points()
    // No any back edges for a tree rooted in u
  Idea: for each vertex u∈V, compute v.low for each child v of u, 
  if v.low≥u.d, this vertex is a articulation point.

Briges()
  Idea: for each vertex u∈V, compute v.low for each child v of u,
  if v.low>u.d, the edge (u,v) is a bridge.

Biconnected()
  Idea: remove all bridges from G, After that, 
  simply label each connected component that also 
  is a biconnectd component using one number.  
```
