# Externs
Externs are a very basic features that may be deprecated once the language is more mature. Externs allow users to call functions from C in your isidore file. 

## Calling Externs
To reference externs you simply type
    
    extern <Function Name>(<Arguments>);
before you call the function
Ex.
    
    extern printd(x);

You can then call these external functions just like they are standard functions. I can do 

    printd(3);
and it will print the value 3 to the console.
## Making you own Extern
I handle externs very, very poorly right now as they will be removed eventually. 
Right now you can put in your own C functions in extern/extern.h and extern/extern.cpp if you want functionality not provided by Isidore.

## Built-in Externs
### putchard(double ch)
putchard takes a double and attempts to cast that double to some ASCII character value and prints it to the console.

### printd(double val)
printd takes a double and prints that exact double value to the console.