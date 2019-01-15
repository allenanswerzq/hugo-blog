---
title: "Hdu 3038 How Many Answers Are Wrong"
author: "landcold7"
tags: ["algo", "union-find", "hdu"]
date: 2019-01-15T22:10:15+08:00
draft: false
---

Hdu 3038 How Many Answers Are Wrong

<!--more-->

**Problem Description**

TT and FF are ... friends. Uh... very very good friends -________-b

FF is a bad boy, he is always wooing TT to play the following game with him. This is a very humdrum game. To begin with, TT should write down a sequence of integers-_-!!(bored).

Then, FF can choose a continuous subsequence from it(for example the subsequence from the third to the fifth integer inclusively). After that, FF will ask TT what the sum of the subsequence he chose is. The next, TT will answer FF's question. Then, FF can redo this process. In the end, FF must work out the entire sequence of integers.

Boring a very very boring game!!! TT doesn't want to play with FF at all. To punish FF, she often tells FF the wrong answers on purpose.

The bad boy is not a fool man. FF detects some answers are incompatible. Of course, these contradictions make it difficult to calculate the sequence.

However, TT is a nice and lovely girl. She doesn't have the heart to be hard on FF. To save time, she guarantees that the answers are all right if there is no logical mistakes indeed.

What's more, if FF finds an answer to be wrong, he will ignore it when judging next answers.

But there will be so many questions that poor FF can't make sure whether the current answer is right or wrong in a moment. So he decides to write a program to help him with this matter. The program will receive a series of questions from FF together with the answers FF has received from TT. The aim of this program is to find how many answers are wrong. Only by ignoring the wrong answers can FF work out the entire sequence of integers. Poor FF has no time to do this job. And now he is asking for your help~(Why asking trouble for himself~~Bad boy)

 

**Input**

Line 1: Two integers, N and M (1 <= N <= 200000, 1 <= M <= 40000). Means TT wrote N integers and FF asked her M questions.

Line 2..M+1: Line i+1 contains three integer: Ai, Bi and Si. Means TT answered FF that the sum from Ai to Bi is Si. It's guaranteed that 0 < Ai <= Bi <= N.

You can assume that any sum of subsequence is fit in 32-bit integer.

 

**Output**

A single line with a integer denotes how many answers are wrong.

 

**Sample Input**

```
10 5
1 10 100
7 10 28
1 3 32
4 6 41
6 6 1
```

 

**Sample Output**

```
1
```



```c++
#include <iostream>
#include <vector>
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

// #define trace(...) _f(#__VA_ARGS__, __VA_ARGS__)
// template <typename T>
// void _f(const char* name, T&& arg) {
//     cout << fixed << name << ": " << arg << '\n';
// }

// template <typename T, typename... Args>
// void _f(const char* names, T&& arg, Args&&... args) {
//     const char* split = strchr(names + 1, ',');
//     cout.write(names, split - names) << ": " << arg << " |";
//     _f(split, args...);
// }

typedef long long ll;
typedef long double ld;
typedef vector<int> vi;
typedef vector<ll> vl;
typedef vector<vi> vvi;
typedef vector<string> vs;
typedef vector<vs> vvs;
typedef pair<int, int> pii;
typedef vector<pii> vpii;

struct UF {
    // sum[i] denotes the sum following the path from node i up to the root.
    // As long as two nodes are linked to a same root, we can get the their
    // difference by sum[v] - sum[u]
    vi e, sum;
    int count;
    UF(int n) : e(n + 1, -1), sum(n + 1, 0), count(0) {}

    int find(int x) {
        if (e[x] < 0) return x;
        // Path compression.
        int root = find(e[x]);
        sum[x] += sum[e[x]];
        e[x] = root;
        return root;
    }

    void join(int u, int v, int w) {
        int t1 = find(u);
        int t2 = find(v);
        if (t1 != t2) {
            // Add link by rank gives WA.
            // if (e[t1] > e[t2]) swap(t1, t2);
            // e[t1] += e[t2];
            e[t2] = t1;
            // Hard to understand.
            sum[t2] = sum[u] - sum[v] + w;
        } else {
            if (sum[v] - sum[u] != w) {
                ++count;
            }
        }
    }

    int answer() {
        return count;
    }
};

int n, m;
void solve() {
    UF uf(n);
    fori (i, 0, m) {
        int u, v, w; cin >> u >> v >> w;
        uf.join(u - 1, v, w);
    }
    output(uf.answer());
}

int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    while (cin >> n >> m) {
        solve();
    }
    return 0;
}

```

