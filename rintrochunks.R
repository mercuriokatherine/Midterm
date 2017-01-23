1.4 R and the window system
The most convenient way to use R is at a graphics workstation running a windowing system.
This guide is aimed at users who have this facility. In particular we will occasionally refer to
the use of R on an X window system although the vast bulk of what is said applies generally to
any implementation of the R environment.

In using R under UNIX the suggested procedure for the first occasion is as follows:
  1. Create a separate sub-directory, say work, to hold data files on which you will use R for
this problem. This will be the working directory whenever you use R for this particular
problem.
$ mkdir work
$ cd work