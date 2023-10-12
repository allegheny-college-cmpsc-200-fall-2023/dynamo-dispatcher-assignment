# CMPSC 200: Dynamo Dispatcher

| Date              |          |
|:------------------|:---------|
| 12 October 2023 | Assigned  |
| 20 October 2023| Due, end of lab       |
| Status           | [![GatorGrader](../../actions/workflows/main.yml/badge.svg)](../../actions/workflows/main.yml) |


## Learning objectives

* Describe the various functions of the stack and the link register
* Enumerate the call stack for a given set of functions using "Last In, First Out" principles
* Deploy bit shifting as a technique to qualify numeric data
* Use the stack and link register to create dynamic, multi-function programs

## Introduction

### Branching out, stacking up, and other meaningless phraseology

But, _very meaningful Assembly instructions_.

#### Adding it up

Complete this work in [adder/program.S](adder/program.S).

This exercise replicates our class discussion of the basic stack frame using the following Python addition routine as a basis including a couple of new instructions: `BL` (`b`ranch and `link`), and `BX` (`b`ranch and e`x`ecute):

```python
def add(a: int, b: int) -> int:
	c = a + b
	return c

s = add(2, 3)
print(s)
```

#### Dynamo Dispatcher

Complete this work in [dynamo/program.S](dynamo/program.S).

Our automated station can sense really big space rocks. Like, _sufficiently big_. In this case that means ones measuring `20`-bits. On each rock signal we encounter that is _`20` bits or greater_, we should send out a dynamo to have a look and possibly take some samples so that we can characterize the type and quality of the rocks. (Don't worry: that work is up _next_.)

However, it's inefficient to do all of this in a long string of instructions. We've got to use what we've learned about the `link register` (`LR`) and stack to make this process as smooth as possible. 

An example outcome should look like:

```
(966081) DYNAMO RELEASED!
(753047) DYNAMO RELEASED!
(537691) DYNAMO RELEASED!
(686535) DYNAMO RELEASED!
(843909) DYNAMO RELEASED!
...
```

### Changes to files in `.vscode`

Based on your system setup (refer to your `hello-blinky` assignment), you will need switch out the `.vscode` folder in each exercise with the _last working copy_.

See our [wiki's entry  on "Configuring Assignments"](https://github.com/allegheny-college-cmpsc-200-fall-2023/course-materials/wiki/03-Configuring-Assignments)
for more inforamtion.
