---
title: "Flush Buffer"
date: 2018-05-02T14:34:15+08:00
draft: false
---

There exist a output buffer (namely a file) between the program and the screen you are seeing. Everytime when you want to print something, it first goes into that buffer, and then it can be flushed out to the screen.

There are two ways to flush buffer, one way is to explicitly call some function to do this, and another way is when the program exits, it will flush ouput buffer.

Here is a simple example to show this:

```cpp
// Instead of printing dot immediately it will print all 5 dots after
// calling the last line of code that cout \n
int main () {
  for (int i=0; i<5; i++) {
    // But if we call this it will print dot one by one.
    // std::cout << "." << endl;
    std::cout << ".";
    sleep(1);
  }
  std::cout << "\n";
}
```