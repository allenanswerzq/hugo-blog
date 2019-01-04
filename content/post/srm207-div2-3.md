---
title: "Topcoder srm207-Div2-3 problem"
date: 2018-05-05T11:14:13+08:00
draft: false
---

Basically, the problem statement says in a cheese game find the minimum number of steps that a knight has to jump so that it captures both the queen and the rook.

  So the important concept here should be what algorithm do we use to solve this problem? At first look this may seem like dynamic programming or backtracking problem. Turns out BFS also is a very suitable algorithm for this problem.

  **Notice that the most revealing hint about the BFS solution is the cost of 1 for any jump or state transformation.**

Also at the first, I was thinking I can find the shortest distances from knight to rook and from knight to queue and also record the paths. Then find a way to figure out the minimum number of steps. Turns out there are too many cases to handle.

```cpp
#include<bits/stdc++.h>
using namespace std;

#define pb push_back
#define pend cout << endl
#define pvar(x) cout << #x << ": "
#define sz(x) ((int)(x).size())
#define all(x) (x).begin(), (x).end()
#define mst(x, y) memset(x, y, sizeof(x))
#define fora(e, c) for (auto &e : c)
#define fori(i, a, b) for (int i = (a); i < (b); ++i)
#define ford(i, a, b) for (int i = (a); i > (b); --i)
#define outret(v) cout << (v) << endl
#define output(ix, v) cout << "Case #" << (ix) << ": " << (v) << endl
#define pvi(x, v) if(v) pvar(x); fora(a, x) cout << a << " "; pend
#define par(x, n, v) if(v) pvar(x); fori(a, 0, n) cout << x[a] << " "; pend

#define trace(...) _f(#__VA_ARGS__, __VA_ARGS__)
template <typename T>
void _f(const char* name, T&& arg) {
  cout << name << ": " << arg << endl;
}

template <typename T, typename... Args>
void _f(const char* names, T&& arg, Args&&... args) {
  const char* split = strchr(names + 1, ',');
  cout.write(names, split - names) << ": " << arg << " |";
  _f(split, args...);
}

typedef long long ll;
typedef vector<int> vi;
typedef vector<ll> vl;
typedef vector<vi> vvi;
typedef vector<string> vs;
typedef vector<vector<string>> vvs;
typedef pair<int, int> pii;
typedef vector<pii> vpii;

int dist[9][9]; 
class CaptureThemAll { 
public: 
  int doit(string from, string to) { 
    vector<vi> dir = {{-2,-1}, {-2,1}, {2,-1}, {2,1}, {-1,-2}, {1,-2},
                      {-1,2}, {1,2}};
    queue<string> dq;
    dq.push(from);
    fori (i, 0, 10)
      fori (j, 0, 10)
        dist[i][j] = 1000;

    // Note: index 
    dist[from[0] - 'a' + 1][from[1]-'0'] = 0;
    int tc = to[0] - 'a' + 1;
    int tr = to[1] - '0';

    while (!dq.empty()) {
      string top = dq.front(); dq.pop();
      if (top == to)
        return dist[tc][tr];
        int c = top[0] - 'a' + 1;
        int r = top[1] - '0';
        fora (d, dir) {
          int nc = c + d[0]; int nr = r + d[1];
          if (0 < nc && nc < 9 && 0 < nr && nr < 9) {
            if (dist[c][r] + 1 < dist[nc][nr]) {
              dist[nc][nr] = dist[c][r] + 1;
              string nxt_state;
              nxt_state += (char)('a' + nc - 1);
              nxt_state += (char)('0' + nr);
              dq.push(nxt_state);
            }
          }
        }
    }
    return -1;
  }

  int fastKnight (string knight, string rook, string queen) {
    int a = doit(knight, rook) + doit(rook, queen);
    int b = doit(knight, queen) + doit(queen, rook);
    // int c = 2*doit(knight, rook) + doit(knight, queen);
    // int d = 2*doit(knight, queen) + doit(knight, rook);
    // cout << a << " " << b << " " << c << " " << d << '\n';
    // return min(min(a, min(b, c)), d);
    return min(a, b);
  }
};

void test(string aa, string bb, string cc) {
  CaptureThemAll go;
  int r = go.fastKnight(aa, bb, cc);
  output(r);
}

int main(int argc, char** argv) {
  std::ios_base::sync_with_stdio(false);
  test("a1", "b3", "c5");
  test("b1", "c3", "a3");
  test("a1", "a2", "b2");
  test("a5", "b7", "e4");
  test("h8", "e2", "d2");
  return 0;
}

```

 
