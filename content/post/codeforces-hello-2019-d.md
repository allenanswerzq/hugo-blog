---
title: "Codeforces Hello 2019 D"
author: "landcold7"
tags: ["algo", "codeforces"]
date: 2019-01-06T14:05:28+08:00
draft: false
---

Codeforces Hello 2019 D problem

<!--more-->

**D. Makoto and a Blackboard**


Makoto has a big blackboard with a positive integer $ n $ written on it. He will perform the following action exactly 𝑘k times:

Suppose the number currently written on the blackboard is $ u $. He will randomly pick one of the divisors of $ u $ (possibly 11 and $ u $) and replace $ u $ with this divisor. As Makoto uses his famous random number generator (RNG) and as he always uses 5858 as his generator seed, each divisor is guaranteed to be chosen with equal probability.

He now wonders what is the expected value of the number written on the blackboard after 𝑘k steps.

It can be shown that this value can be represented as $ \frac{P}{Q} $ where $ P $ and $ Q $ are coprime integers and $ Q \not\equiv 0 \pmod{10^9+7} $. Print the value of $ P \cdot Q^{-1} $ modulo $ 10^9+7 $.

**Input**

The only line of the input contains two integers $ n $ and $ k $ ($ \leq n \leq 10^{15} $, $ 1 \leq k \leq 10^4 $).

**Output**

Print a single integer — the expected value of the number on the blackboard after 𝑘k steps as $ P \cdot Q^{-1} \pmod{10^9+7} $ defined above.

**Examples**

```
input
6 1
output
3
input
6 2
output
875000008
input
60 5
output
237178099
```

Note

In the first example, after one step, the number written on the blackboard is 11, 22, 33 or 66 — each occurring with equal probability. Hence, the answer is $ \frac{1+2+3+6}{4}=3 $.

In the second example, the answer is equal to $ 1 \cdot \frac{9}{16}+2 \cdot \frac{3}{16}+3 \cdot \frac{3}{16}+6 \cdot \frac{1}{16}=\frac{15}{8} $

{{% figure src="/media/posts/img/cf-hello-2019-d.jpeg"  title="cf-hello-2019-d" class="zoomable" %}}
