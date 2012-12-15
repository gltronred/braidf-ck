BraidF*ck
=========

Turing tarpit full of math, fun and alien technologies. Designed especially to be computable with your fingers!

(NOTE: language authors aren't responsible for results of computations on incompatible fingers!)

version 0.1

Motivation
----------

As all of you know, good language should be based on a lot of very specialized mathematics, such as category theory and of course should have some monoids (like Haskell :) ). It also should be based on some unknown alien technology (like Lisp :) ). And, of course, it should be very simple (like HQ9+ ;) for example).

*BraidF-ck* is good language. It is based on deep mathematics of braid groups and braided categories. It is simple because you can execute programs with your palm and fingers. It is surely based on unknown alien technology (if you have enough fingers and fingertips to execute non-trivial *BraidF-ck* program, you **surely have** some alien technology)

Semantics
---------

Technically, every *BraidF-ck* program is just some braid on `n` points

    w = \sigma_{i_1}^{k_1} \sigma_{i_2}^{k_2} \ldots \sigma_{i_m}^{k_m}

where `k_j` equal to `-1` or `1` and `i_j` lies between `1` and `n-1`

It is executed as follows. 

First of all it is simplified (braid ends are tighted and we get normalized form)

Then on word consisting of `n` elements `x_i` of group `S_4`  braid `w` acts as follows:

    \sigma_i <x_1, \ldots, x_{i-1}, x_i, x_{i+1}, x_{i+2}, \ldots, x_n> = 
		= <x_1, \ldots, x_{i-1}, x_{i+1}, x_i^{-1} x_{i+1} x_i, x_{i+2}, \ldots, x_n>
		
That is, `\sigma_i` exchanges `x_i` and `x_{i+1}` elements and `x_i` is twisted 
by the inner authomorphism corresponding to `x_{i+1}`.

Technically, input is one of small English letter, except `y` and `z`

Each letter encodes corresponding permutation in `S_4` in lexicographical order:

    a = (0 1 2 3)  g = (1 0 2 3)  m = (2 0 1 3)  s = (3 0 1 2)
	b = (0 1 3 2)  h = (1 0 3 2)  n = (2 0 3 1)  t = (3 0 2 1)
	c = (0 2 1 3)  i = (1 2 0 3)  o = (2 1 0 3)  u = (3 1 0 2)
	d = (0 2 3 1)  j = (1 2 3 0)  p = (2 1 3 0)  v = (3 1 2 0)
	e = (0 3 1 2)  k = (1 3 0 2)  q = (2 3 0 1)  w = (3 2 0 1)
	f = (0 3 2 1)  l = (1 3 2 0)  r = (2 3 1 0)  x = (3 2 1 0)

Input of length `m` is feeded to upper `m` strands; following `k` strands are work space and 
the remaining `n` strands are output. Output is encoded as input

Syntax
------

Every *BraidF-ck* program is written as some **palm position** after **header** of program:

	# comment
	# more comment
	Braid 0.1
	# even more comments
	Palm 2 2 1
     _______________
    |               }
	>---------------
	|               }
	>---------------
	|               }
	>---------------
	|               }
	>---------------
	|_______________}

Header can have of one or several lines of comments that begins with # symbol.

First non-comment line must contain word `Braid` with next word being version of language. 
First non-comment line must not contain more than one `Braid` word (in such capitalization). 

Second non-comment line must contain syntax name (`Palm` for casual syntax, `Lines` for syntax sugar 
and `L33t` for mathematical over-simplified l33t syntax) with length of input, work space and output. 
Length of output must be greater than zero, length of input and workspace must be greater or equal to zero.

Previous image shows **identity program** -- program that returns nothing.

	Braid 0.1
	Palm 2 2 1
     ______  _______
    |      \/       }
	>-----\ \/------
	|      \        }
	>------/\-------
	|               }
	>---------------
	|               }
	>---------------
	|_______________}

This image demonstrates base concept of braids: **crossing**.

Finger-count could be not equal to five (we will accept alien civilizations too)

Simplified syntax sugar
-----------------------

	Braid 0.1
    Lines 1 0 1
    --\ /----------------
	-/ \-----------------
	
Note that first strand goes *over* second

Oversimplified mathematical 1337 (l33t) syntax
----------------------------------------------

Lines:

	Braid 0.1
	L33t 1 1 1
    1 2 -1 2

equals to

	Braid 0.1
	Lines 1 1 1
    --\ /------\ /-------
	-/ \---\ /--/ \--\ /-
	------/ \-------/ \--

Introduction to braid groups
----------------------------

Turing completeness of BraidF-ck
--------------------------------

Hello world
-----------

TODO
----

1. Internal representation
2. Parser of math syntax
3. Interpreter
4. Converter to lines and palm syntax
5. Parser of lines syntax
6. Parser of palm syntax
7. Compiler


count on the fingers of one hand
cross fingers
fingers were made before forks
