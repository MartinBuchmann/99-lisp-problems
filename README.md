<!-- -*- Mode: markdown -*- -->

# 99-lisp-problems
==========

Similar to
[Joao Meidanis](http://www.ic.unicamp.br/~meidanis/courses/mc336/2006s2/funcional/L-99_Ninety-Nine_Lisp_Problems.html)
I started using Werner Hett's
[99 Prolog Problems](https://sites.google.com/site/prologsite/prolog-problems)
as a way to learn some Common Lisp some years ago.  After quite a gap without
finding time for playing around I recently got into CL again.

Although, I know there are similar repositories around, I still think it will be
fun to additionally learn something about git and give others the possibility
to comment on my code directly. 

I created a package *99-lisp-problems* to wrap my functions in their own
namespace and a asdf-system called *99-lisp-problems*.  Futhermore, I am using
*lisp-unit* to provide some simple unit tests.  I will upload new solution as I
find the time.

Simply type:

```
> (asdf:load-system :99-lisp-problems)

> (in-package :99-lisp-problems)

> (run-tests)
```

in your REPL after downloading the files in a proper place.

If you are interessted in more profound solutions you should check
[Pascal Bourguignon's Web Page](http://www.informatimago.com/develop/lisp/l99/).
Especially the different versions of recursive, tco and iterative solutions are
very nice.
