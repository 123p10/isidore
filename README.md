# Isidore
## Background
### Purpose
Every day there is a hip, new programming language. The recent trend for the past 5-10 years has been moving towards more "beautiful" languages like Python and Golang. Isidore attempts to redirect this focus from beautiful code towards clear, readable, maintainable code.

By enforcing code standards and best practices at the compiler level:
technical debt for tech companies will decrease, updates and code changes will be easier and bugs will become less frequent and easier to resolve.

### Name
The name of the language will most certainly change. The name comes from the story of Isidore of Seville, the "last scholar of the ancient world" for compiling an encyclopedia with works from the Ancient world. Just as this language is attempting to retain some of the constructs of older languages while utilizing modern features.

## Development
### Process
Every part of the system is built with the OOP principles in mind. The lexer module and ASTTree is built in pure vanilla C++. The code generation module, uses LLVM in C++ to generate LLVM IR and compile JIT.

### Building Isidore Programs

Isidore is currently under heavy development and is certainly not complete. The compiler has only been tested on a single Ubuntu machine. Seg-faults and non user friendly error messages may arise if you are not extremely careful.

#### How to Build Isidore Programs
To run an Isidore program you require llvm-9 and g++. For linux users it is probably easiest to do
`sudo apt-get install llvm` and `sudo apt-get install g++`. Once you have the dependencies installed you may proceed below.
1. Pull this repo
2. `cd` to the local repo
3. Run `make`
4. Run the output file main (Linux: ./main)

*Note: this will compile and run the isidore program "main.isd"*

*To run your own programs type `./main -f <relative path to .isd file>`*

*Ex. `./main -f examples/HelloWorld.isd`*

### Plan
The things I am working on in the near future are listed in TODO. I won't be posting what has been accomplished per say as it will take too much time. Documentation is currently in progress and available in the docs folder, examples are also available in the examples folder.

## Principles of Isidore
*Not all of these principles have been implemented*

1. Type inferencing should only be used with similar types at most. Static type definitions are important for clarity.
2. Constructs should be labeled simply, clearly and given unpretentious names. 
 
    * Dynamic arrays should not be called "vectors" they should be called lists

    * push_back() should be append() or insert()

    * You label foreach loops with foreach not for()

3. Curly braces should be used for most if not all blocks to clearly show the start and end of the blocks.
4. Number of built-in, core constructs should be limited. Allows new users and all readers of code to understand code completely without research.

    * One function to output to console

    * One type for dynamic arrays

    * No stupid operators like << or >>
5. Functions should be able to return multiple values, not by pass by reference in parameters.
6. Semicolons should be placed at end of every non block statement to clarify end of statement.
7. Global mutable variables have no use in modern programs.
    * Global constants are acceptable and important for code readibility