---
title: "Poj 3169 Layout"
author: "landcold7"
tags: ["algo", "poj"]
date: 2019-01-14T21:53:40+08:00
draft: true
---

Poj 3169 Layout problem

<!--more-->

**Description**

Like everyone else, cows like to stand close to their friends when queuing for feed. FJ has N (2 <= N <= 1,000) cows numbered 1..N standing along a straight line waiting for feed. The cows are standing in the same order as they are numbered, and since they can be rather pushy, it is possible that two or more cows can line up at exactly the same location (that is, if we think of each cow as being located at some coordinate on a number line, then it is possible for two or more cows to share the same coordinate).

Some cows like each other and want to be within a certain distance of each other in line. Some really dislike each other and want to be separated by at least a certain distance. A list of ML (1 <= ML <= 10,000) constraints describes which cows like each other and the maximum distance by which they may be separated; a subsequent list of MD constraints (1 <= MD <= 10,000) tells which cows dislike each other and the minimum distance by which they must be separated.

Your job is to compute, if possible, the maximum possible distance between cow 1 and cow N that satisfies the distance constraints.

**Input**

Line 1: Three space-separated integers: N, ML, and MD.

Lines 2..ML+1: Each line contains three space-separated positive integers: A, B, and D, with 1 <= A < B <= N. Cows A and B must be at most D (1 <= D <= 1,000,000) apart.

Lines ML+2..ML+MD+1: Each line contains three space-separated positive integers: A, B, and D, with 1 <= A < B <= N. Cows A and B must be at least D (1 <= D <= 1,000,000) apart.

**Output**

Line 1: A single integer. If no line-up is possible, output -1. If cows 1 and N can be arbitrarily far apart, output -2. Otherwise output the greatest possible distance between cows 1 and N.

**Sample Input**

```
4 2 1
1 3 10
2 4 20
2 3 3
```

**Sample Output**

```
27
```

**Hint**

Explanation of the sample:

There are 4 cows. Cows #1 and #3 must be no more than 10 units apart, cows #2 and #4 must be no more than 20 units apart, and cows #2 and #3 dislike each other and must be no fewer than 3 units apart.

The best layout, in terms of coordinates on a number line, is to put cow #1 at 0, cow #2 at 7, cow #3 at 10, and cow #4 at 27.


```c++
#include <bits/stdc++.h>
using namespace std;

#define pb push_back
#define pend cout << '\n'
#define pvar(x) cout << #x << ": "
#define sz(x) ((int)(x).size())
#define all(x) (x).begin(), (x).end()
#define mst(x, y) memset(x, y, sizeof(x))
#define fora(e, c) for (auto &e : c)
#define fori(i, a, b) for (int i = (a); i < (b); ++i)
#define ford(i, a, b) for (int i = (a); i > (b); --i)
#define output(v) cout << (v) << '\n'
#define codejam(ix, v) cout << "Case #" << (ix) << ": " << (v) << '\n'
#define pvi(x, v) if (v) pvar(x); fora(a, x) cout << a << " "; pend
#define par(x, n, v) if (v) pvar(x); fori(a, 0, n) cout << x[a] << " "; pend

#define trace(...) _f(#__VA_ARGS__, __VA_ARGS__)
template <typename T>
void _f(const char* name, T&& arg) {
    cout << fixed << name << ": " << arg << '\n';
}

template <typename T, typename... Args>
void _f(const char* names, T&& arg, Args&&... args) {
    const char* split = strchr(names + 1, ',');
    cout.write(names, split - names) << ": " << arg << " |";
    _f(split, args...);
}

typedef long long ll;
typedef long double ld;
typedef vector<int> vi;
typedef vector<ll> vl;
typedef vector<vi> vvi;
typedef vector<string> vs;
typedef vector<vs> vvs;
typedef pair<int, int> pii;
typedef vector<pii> vpii;

// Sloving difference constraints via shortest paths
typedef struct Edge {
    int u, v, w;
} Edge;

const int maxn = 1e3 + 7;
const int inf = 0x3f3f3f3f;

vector<Edge> gg[maxn];
int n, ml, md;
int que[maxn];
int dist[maxn];
int visit[maxn];
int cnt[maxn];

void add_edge(int u, int v, int w) {
    gg[u].pb({u, v, w});
}

bool spfa(int src, int n) {
    mst(visit, 0);
    mst(dist, 0x3f);

    int front = 0, rear = 0;
    que[rear++] = src;
    dist[src] = 0;
    visit[src] = 1;

    while (front != rear) {
        int u = que[front++];
        fora (edge, gg[u])  {
            int v = edge.v, w = edge.w;
            if (dist[v] > dist[u] + w) {
                dist[v] = dist[u] + w;
                if (!visit[v]) {
                    visit[v] = 1;
                    que[rear++] = v;
                    if (rear == maxn) rear = 0;
                    if (++cnt[v] > n) return 0;
                }
            }
        }
        visit[u] = 0;
        if (front == maxn) front = 0;
    }
    return 1;
}

void solve() {
    cin >> n >> ml >> md;
    fori (i, 0, ml) {
        int u, v, c; cin >> u >> v >> c;
        if (u > v) swap(u, v);
        add_edge(u, v, c);
    }

    // For a difference constraint v - u < w, we can make an edge
    // u --> v with weight w
    fori (i, 0, md) {
        int u, v, c; cin >> u >> v >> c;
        if (u < v) swap(u, v);
        add_edge(u, v, -c);
    }

    bool ret = spfa(1, n);
    if (!ret) {
        // Cycle exists.
        output(-1);
    } else if (dist[n] == inf) {
        output(-2);
    } else {
        output(dist[n]);
    }
}

int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    solve();
    return 0;
}
```
