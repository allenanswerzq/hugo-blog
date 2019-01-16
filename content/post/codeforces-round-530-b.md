---
title: "Codeforces Round 530 B"
author: "Landcold7"
tags: ["algo", "codeforces"]
date: 2019-01-07T16:15:12+08:00
draft: false
---

Codeforces round #530 b problem

<!--more-->

**B. Squares and Segments**

Little Sofia is in fourth grade. Today in the geometry lesson she learned about segments and squares. On the way home, she decided to draw 𝑛n squares in the snow with a side length of $ 1 $. For simplicity, we assume that Sofia lives on a plane and can draw only segments of length $ 1 $, parallel to the coordinate axes, with vertices at integer points.

In order to draw a segment, Sofia proceeds as follows. If she wants to draw a vertical segment with the coordinates of the ends $ (x,y) $ and $ (x,y+1) $. Then Sofia looks if there is already a drawn segment with the coordinates of the ends $ (x′,y) $ and $ (x′,y+1) $ for some $ x $. If such a segment exists, then Sofia quickly draws a new segment, using the old one as a guideline. If there is no such segment, then Sofia has to take a ruler and measure a new segment for a long time. Same thing happens when Sofia wants to draw a horizontal segment, but only now she checks for the existence of a segment with the same coordinates $ x $, $ x+1 $and the differing coordinate 𝑦y.

For example, if Sofia needs to draw one square, she will have to draw two segments using a ruler:

![img](/media/posts/codeforces-round-530-b-asset/6828c65bae13ed02707cf640aefff2b431c2e421.png)

After that, she can draw the remaining two segments, using the first two as a guide:

![img](/media/posts/codeforces-round-530-b-asset/67386c6f7dd570c81a116603e173d7b5690a61d2.png)

If Sofia needs to draw two squares, she will have to draw three segments using a ruler:

![img](/media/posts/codeforces-round-530-b-asset/87b87a98836e80eaf356df1ed07f694d8d0f4384.png)

After that, she can draw the remaining four segments, using the first three as a guide:

![img](/media/posts/codeforces-round-530-b-asset/a87ef39735eb57801724db3d75ec5b0647e20986.png)

Sofia is in a hurry, so she wants to minimize the number of segments that she will have to draw with a ruler without a guide. Help her find this minimum number.

**Input**

The only line of input contains a single integer $ n $ $ 1 \le n \le 10^{9} $, the number of squares that Sofia wants to draw.

**Output**

Print single integer, the minimum number of segments that Sofia will have to draw with a ruler without a guide in order to draw 𝑛n squares in the manner described above.

**Examples**

```
input
1
output
2
input
2
output
3
input
4
output
4
```

![img](/media/posts/codeforces-round-530-b-asset/solver.jpeg)

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

void solve() {
    int n; cin >> n;
    int ret;
    int p = 1;
    while (p * p < n) {
        ++p;
    }
    --p;
    // trace(n, p);
    int x = p * p;
    ret = 2 * p;
    if (n - x <= p) {
        ret += 1;
    } else {
        ret += 2;
    }
    output(ret);
}

int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    solve();
    return 0;
}
```

