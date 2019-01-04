---
title: "All About Sed"
description: "sed is really fun"
date: 2017-06-09T10:59:49+08:00
tags: ["sed", "shell", "linux"]
topics: ["shell"]
draft: false
---
### Backgroud

Recently, I have been realized that the more familiar with shell commands, the more easier you can get your work done sometime.

But the most frustrating thing about shell commands is that one complex command maybe has tons of arguments. And the official documents kind of boring when you read it. When you need a specific function, the most common way for most people might be **_googling_**, and you will find a lot of pages on StackOverflow. If luck, you will find a specific command to solve the problem you are facing right now. But you may not understand what is really going on under the cover. Next time, when you need that function again, you might also need to _googling_ again.

For me, I think some of the commands are important because you are using these command very often and it worth spend some time to understand details about these commands. 
So here are all the common ways about sed, Just write it down for querying later.
### Usage
#### sed operators are line oriented
```bash
one two three, one two three
four three two one
one hundred
e.g. sed 's/one/ONE' < file
the result of above command will be only the first _one_ changed to _ONE_
```
#### The delimiter symbol can be anything you want
```bash
old and new below are redirection argumetns
sed 's_/usr/local/bin_/common/bin_' < old > new
sed 's:/usr/local/bin:/common/bin:' < old > new
sed 's|/usr/local/bin|/common/bin|' < old > new
```
#### substitution
```bash
s for substitution
always quote regular expression for less error 
signal quote means strong quote
e.g. echo sun | sed 's/sun/day'
```
#### BASIC REGULAR EXPRESSION
```bash
use & as matched pattern string
e.g. sed 's/pattern/(&)/g' will add () for every pattern matched
matching a specific number of sets with \{ and \}
e.g. [a-z]\{4,8\} match 4,5,6,7,8 lower case letters
matching words with \< and \>
e.g. the pattern to searh for the word "the" would be \<[tT]he\>
remembering patterns with \( and \)
can have 9 different remembered patterns 
e.g. \([a-z]\)\([a-z])\([a-z])[a-z]\2\1 match 5 letter palidrome
```
#### EXTENDED REGULAR EXPRESSION
```bash
important characters 
'?' matches 0 or 1 instances of the chracter set before
'+' matches 1 or more
also ( | ) chracter
e.g. (^| )the([^a-z]|$)   
```
#### Sed pattern flag
```bash
/g global replacement
/p print
/w filename write to file
/I Ignore case
/1, /2 specifying which occurrence
e.g. sed 's/AAA//2g' leave the first world alone, but change the second, third, etc
```
#### Multile command with -e command
```bash
e.g. sed -e 'cmd1' -e 'cmd2' < old >new
multiple lines sed commands in shell script
sed -e 'cmd1' \
    -e 'cmd2' \
    -e 'cmd3' <old >new
also we can quote multiple sed lines 
e.g.
sed '
s/a/A/g 
s/e/E/g 
s/i/I/g 
s/o/O/g 
s/u/U/g'  <old >new
filename on the command line
sed 's/^#.*//' | grep -v '^$' | wc -l
```
#### Sed options 
```bash
-n no-print execpt explict request to print out
sed /pattern/ 
sed has the ability to specify which lines are to be examined and or modified
e.g. sed '/pattern/p' also sed -n 'pattern/p'
-f sedscript
```
#### A sed interpreter script
```bash
e.g. save below code into capvowel.sed and have execute permission
#!/bin/sed -f
s/a/A/g
s/e/E/g
s/i/I/g
s/o/O/g
s/u/U/g
then we can type capvowel <old >new on terminal
passing argument into sed script
using sed in shell here-is document
```
#### address and range of text
```bash
operate only on some address or range of input texts
1) Pattern
e.g. sed '/pattern/ s/xxx/yyy/g'
e.g. sed '/^#/ s/[0-9][0-9]*//'  delete the first number on all lines that start with '#'
e.g. sed '\_/usr/local/bin_s_/usr/local_/comma/all_'
e.g. sed '/^g/ s_g_s_g'
2) ranges by line numbers
e.g. '1,100 s/A/a/'
e.g. '101,$ s/A/a/'
3) ranges by patterns
e.g. sed '/start/, /stop/ s/^#.*//' remove all comments between start and stop
```
#### Delete with d
```bash
e.g. sed '11,$ d' < file
e.g. sed '1,/^$/ d' < file
```
#### Quit with q
```bash
e.g. sed '11 q' quit when 11 line is reached 
```
#### Grouping with { and }
```bash
sed -n '
  1,100 {  # also can be !{ which means invert address
    /begin/,/end/ {
         s/#.*//
         s/[ ^I]*$//
         /^$/ d
         p
    }
  }
'
```
#### Reading in a file with r command
```bash
sed '/INCLUDE/ r file' <in >out
```
#### Coments is very good thing
```bash
#!/bin/sh
watch out for a '/' in the parameter
use alternate search delimiter
sed -e '\_#INCLUDE <'"$1"'>_{
  # read the file
  r '"$1"'
  # delete any characters in the pattern space
  # and read the next line in
  d
}'
```
#### Append a line with a
```bash
sed '
/WORD/ a\
Add this line after every line with WORD
'
```
#### Insert a new line with i
```
sed '
/WORD/ i\
Add this line after every line with WORD
'
```
#### Change a new line with c
```bash
sed '
/WORD/ c\
Add this line after every line with WORD
'
Add more than one line
Print line number with = 
Transform with y
Display control characters with I
And so on.....
There are more advance topics that i haven't read
```
#### Print line number with =
```bash
e.g. sed '/pattern/ = ' 
```
#### Working with multile lines
```bash
#!/bin/sh
sed '
look for a "#" at the end of the line
/#$/ {
Found one - now read in the next line
  N
delete the "#" and the new line character, 
  s/#\n//
}' $1
```
#### Reference
[Grymoire's awesome blog definitely check it out](http://www.grymoire.com/Unix/sed.html)