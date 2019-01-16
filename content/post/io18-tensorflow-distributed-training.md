---
title: "Io18 Tensorflow Distributed Training"
date: 2018-05-12T20:36:19+08:00
draft: false
---

### Overview

Tonight, I am kind of tired to do my algorithm practices like what i have been doing recently.  So the good rest might be watch some videos on youtube to practice my english listening. Also google io18 seems just opening in recent days.  So i found two videos that talked about tensorflow distributed traning and kubernetes(Wow, so hard to spell and pronunciation and also don't know what's that means) learned a lot. So write down some of the stuff i have learned.

### Why distributed training???

Timing is important for faster testing ideas, you can't wait for like a couple of weaks of couple of monthes to see the result for just one experiment. So here instead of training on one machine with one cpu or gpu, they created a way of trarning on one computer with multi-cpu or multi-gpu or even training on multiple machines.

### Two kinds of parallelisms

For spliting like one big task into pieces for distributing, there must be some ways to split. In this trarning task, there are two ways to split one big problem into small part to train, one is called **Data parallelism** and the other one called **Model parallelism**.

<div style="text-align:center"><img src ="/media/post/img/io18.png" /></div>

Bascially what data parallelism does is that it splits the data into pieces and put one small pieces for one worker to train. And what model parallelism is that it splits one big model into pieces and use a small one to train for one worker. Woker here can specify many things, like devices cpu, cpu or gpu, also like cpu cores.

<div style="text-align:center"><img src ="/media/post/img/io18-model.png" /></div>

Since most machines have big amount of memory can hold most of the models, so this way is less common to use.

### How to update grandients

They introduced two approaches to update grandient in a dirstribute setup. First one is called **Async Parameter Server** and the other is called **Sync Allreduce Architecture**.

<div style="text-align:center"><img src ="/media/post/img/io18-aps.png" /></div>

Here, in the picture above, the blue one denotes the parameter servers which are used for storing parameters, and all workers need to communicate with these servers to pull down parameters when every workers do their own training process and push parametes back to servers when their done its own training process. The grandients update step happens on parameter severs.

The approach is suitable for multi-machine dirstributed training situation. The downside of this approach is like the talker said can delay the convergence.

<div style="text-align:center"><img src ="/media/post/img/io18-saa.png" /></div>

The second approach doesnt have the special parameter servers, each woker has a copy of parameters. Each woker computed grandients and loss based one subset of training sample. Once the computation is done, there is process that need to synchronize all the parameters and update the parameters.

If there are faster accelators, the communication cost between two worker can be small, and thus the performance will be good. This approach leads to faster convergence. Think of a scenario that one machine with multi gpus can be very good  for this approach, bacause the communcation cost between two gpus are small since they all connected to the same motherboard.

### Last words

There are a lot videos about this year's google io18, I think i need to watch more. And also I think google really is a high tech company, it has the best people to work there and try to solve the most significant problems. Really hope that some day i can have the chance to work for such kind of places.





