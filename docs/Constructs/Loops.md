# Loops
## For Loop
A for loop in Isidore is usually made up of 3 parts: initial statement, condition statement and loop statement. The initial statement is the statement which occurs right before execution of the loop. The loop then runs until the condition statement resolves true. At the end of each loop in the block the loop statement will run.
Ex.

    for(var i = 1;i < 10;i+=1){
        putchard(42);
    };

Ex 2.

    var x = 5;
    for(0;x > 0;x -= 3){
        putchard(*);
    }



## Recursion
Recursion is allowed in Isidore. Recursion is simply a function calling itself until some break condition is reached.

Ex.

    void factorial(x){
        if(x == 1){
            return 1;
        };
        return x * factorial(x-1);
    }