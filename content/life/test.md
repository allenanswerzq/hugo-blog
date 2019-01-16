---
title: "AAAAAAAAAAAAAAA"
author: "Landcold7"
tags: ["ctf", "pwn"]
date: 2019-01-07T21:10:38+08:00
draft: false
---

35c3ctf Junior Stringmastr1 problem

<!--more-->

**Description**:

nc 35.207.132.47 81

[Source](https://gist.github.com/landcold7/97a4189b334a915bec2d4b199ba401ab)

Difficulty estimate: Medium



**Solver**:

Here the vulnerability is that bound checking is weak, it's only checked the case that *index* is greater or equal to 0, but ignore the case that for a string, the *index* must also less than its size, thus causes the leak of the *stack*, so we can rewrite the return address of *play* function using *swap* and *replace* funtions to execute a shell. And the fix should be easy as only as we checking the lower and higher bound for *index*, this vlunerability will be gone.

{{% figure src="../35c3ctf-junior-stringmastr1-asset/vuln.png"  title="vulnerability" class="zoomable" %}}


