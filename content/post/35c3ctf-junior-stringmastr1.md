---
title: "35c3ctf Junior Stringmastr1"
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

{{% figure src="/media/posts/35c3ctf-junior-stringmastr1-asset/vuln.png"  title="vulnerability" class="zoomable" %}}



Here is my test code for testing c++ string features compared with c language.

```c++
#include <bits/stdc++.h>
using namespace std;


void test_basic() {
    string str = "abcd";
    ostringstream os;
    os << str;
    assert(os.str() == "abcd");
    assert(str.size() == 4);

    const char *p = str.c_str();
    assert(p[0] == 'a');
    assert(p[1] == 'b');
    assert(p[2] == 'c');
    assert(p[3] == 'd');
}

void test_null() {
    string str = "abcd";
    int n = str.size();
    assert(str[n] == '\x00');
}

void test_ending() {
    string str = "abcd";
    ostringstream os;
    os << str;
    assert(os.str() == "abcd");

    // Change the ending null to 'e'.
    int n = str.size();
    str[n] = 'e';
    assert(str[n] == 'e');
    // Here we alreay changed the ending null, but the string still seems
    // unchanged according this assert statement.
    ostringstream os1;
    os1 << str;
    assert(os.str() == "abcd");

    // Verify the internal char array.
    // Here we can see, the internal char array indeed changed.
    // Pretty interesting...
    const char *p = str.c_str();
    assert(p[n] == 'e');
}

void test_npos() {
    string str = "abcd";

    // Change the string::npos to 'e'.
    int n = str.size();
    str[string::npos] = 'e';
    assert(str[string::npos] == 'e');
    assert(str[n] != 'e');

    const char *p = str.c_str();
    assert(p[n] != 'e');
    assert(p[n] == '\x00');

    // Output disordered chars.
    cout << "str: " << str << endl;
}

int main() {
    test_basic();
    test_null();
    test_ending();
    test_npos();
}


```




