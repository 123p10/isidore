# Functions
## Preface
Functions are the backbone of any programming language. A function can take in any number of arguments. The function can then perform operations with those arguments and then the function returns some value. In Isidore currently all functions require a return.

## Writing your own functions
The syntax for writing an Isidore function is:

    <Type> <Name>(<var 1> <var 2>...){
        //List of statements
        return <return value>;
    }
Ex.

    void print_list(x y z){
        printd(x);
        printd(y);
        printd(z);
        return 0;
    }
*Note the keyword 'void' will change*

This function will print the 3 values provided as arguments. You can see some great examples of functions in the folder examples/Drawing which has new_box.isd and Triangle.isd.

## Calling Functions
Of course for every function you write you also have to call functions. Function calls are fairly standard. Given the function

    void increase_x(x){
        return x+1;
    }
we can call increase_x and use it in tons of different ways some examples are:

    var a = 1;
    a = increase_x(a);

or

    var x = 0;
    if(increase_x(x) == 1){

    }
    else{}