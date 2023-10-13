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

Our automated station can sense really big space rocks. Like, _sufficiently big_. In this case that means ones measuring `20 -bits. On each rock signal we encounter that is _`20` bits or greater_, we should send out a dynamo to have a look and possibly take some samples so that we can characterize the type and quality of the rocks. (Don't worry: that work is up _next_.)

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

### Lab: The Sifter

Once we get the rocks, we have to classify them. In our current operation, we collect `LUNAR` and `MARTIAN` rocks; then, we sort them into `HI` and `LOW` quality. Here're the rules:

|Number start (base 16)| Type |
|:---------------------|:-----|
|`00`                  |`LUNAR`|
|`55`                  |`MARTIAN`|

|Number end (base 16)| Quality |
|:---------------------|:-----|
|`FF`                  |`HIGH`|
|`00`                  |`LOW`|

> Hints: 
> * what are these numbers' decimal equivalents?
> * how can we get only the first `2` bytes and last `2` bytes alone?

### Assignment "Hacks"

See the `Suggestion` below to challenge yourself to implement a Hack. As always, you are allowed to develop
your own Hack to satisfy this stretch goal. Place the code for the Hack inline with the code in the corresponding
file.

In order to recieve credit for the Hack, you must fill out the [hack.md](docs/hack.md) file located in the
`docs` folder.

#### `dynamo`

Negative values denote _very dangerous_ space junk. We have a blaster to demolish it, but it needs some work. However, we're really only concerned
about negative values above _20 bits_. Anything else will just bounce off our station's force field.

**Note: you will need to use a new _signed number opcode_: `LDRSW`, which loads a _signed word_.**

```

```

Implement the blaster by replacing the `signals` array in `program.S` with the above and print that we've `blasted` the junk
using a similar format to our dynamo's dispatch message.

> Hint: you may need to engage with the `NEG` or other instruction; shifting may have unpredictable results!

#### `sifter`

Sometimes, as the saying (and reality) goes, sometimes junk gets lodged in a perfectly good space rock. Here, these scraps are denoted by negative numbers. However, sometimes, they contain technology that we might want to salvage -- especially if the most significant bits are `33`. If we encounter
a negative-signed sample, and it meets our criteria, we need to print the format string:

```assembly
    salvaged:     .asciz      "0x%08x\tSALVAGED."
```

Add the above to the `.data` section of the appropriate file.

**Note: you will need to use a new _signed number opcode_: `LDRSW`, which loads a _signed word_.**

##### New files

For any `Hack`, you may choose to create a new file to do this; if you do, make sure you add the new file name to the [CMakeLists.txt](CMakeLists.txt) file in the `add_executable` directive:

```cmake
add_executable(${PROJECT_NAME}
    program.S
    sifter.S
	your_file_here.S
)
```

#### Make it your own

You are free to develop your own "Hack" for this assignment. However, you'll need to be sure to justify the value of your hack clearly!

### Changes to files in `.vscode`

Based on your system setup (refer to your `hello-blinky` assignment), you will need switch out the `.vscode` folder in each exercise with the _last working copy_.

See our [wiki's entry  on "Configuring Assignments"](https://github.com/allegheny-college-cmpsc-200-fall-2023/course-materials/wiki/03-Configuring-Assignments)
for more inforamtion.
