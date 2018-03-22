---
title: "Collection about Make"
date: 2017-12-12T15:12:27+08:00
draft: false
tags: ["make", "gnu", "linux"]
topics: ["software"]
---

### Overview
Basically, Make is a software that automatically builds executable program and libraries from source code by reading Makefiles which specify rules about how to do this thing.

And also a big feature of Make is to automatically update some files which have a dependency relationship with other files already been changed. There are many Make software variants out there, it all comes from the origin created by Stuart Feldman in April 1976 at Bell Labs. GNU Make is one of them mainly used in Linux and OSX.

The essential algorithm that used to determine process sequence to build target program is [Topological sorting](https://en.wikipedia.org/wiki/Topological_sorting). Each dependency relationship kinds like an edge in Graph, Each node denotes target we need to finish. and use Topological sorting we can get an appropriate sequence to build this up.

### Links 
Of course, the [offical document](https://www.gnu.org/software/make/manual/make.html) lists all the details about make and also this [wike page](https://en.wikipedia.org/wiki/Make_(software)) is also a good place to read.

Little tip: print any variable in makefile

usage: make print-TEST
```
print-%:
	@echo $* = $($*)
```

Too lazy to organize details from these links, just put all these links here. :-)

File name functions
[link](https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html)

Difference between = and :=
[link](https://www.gnu.org/software/make/manual/html_node/Flavors.html#Flavors)

What @ - + means? [link](https://stackoverflow.com/questions/3477292/what-do-and-do-as-prefixes-to-recipe-lines-in-make)

String functions [link](https://www.gnu.org/software/make/manual/html_node/Text-Functions.html)

Types of Prerequisites [link](https://www.gnu.org/software/make/manual/make.html#Prerequisite-Types)

Implicit Variable [link](https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html)

Automatic Variable [link](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html)

Static Pattern [link](https://www.gnu.org/software/make/manual/make.html#Static-Pattern)

Include [link](https://www.gnu.org/software/make/manual/html_node/Include.html)

