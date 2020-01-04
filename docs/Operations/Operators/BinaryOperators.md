# Built in Binary Operators
## Definition
Operators that perform an action utilizing two operands.

## Precedence Chart
Table. Precedence of binary operators. Precedence increasing from bottom to top

|Operator|
|:--------:|
|*|
|+ -|
|== >= <= > < !=|
|&& \| \| |
|= += -=|

## Arithmetic Operators
### Addition Operator (+)
Returns the sum of the two expressions on either side of the operator.

Ex.
    
    1 + 1
will resolve to 
    
    2

### Subtraction Operator (-)
Returns the difference of the two expressions on either side of the operator. The left hand operand subtract the right hand operand.

Ex.

    3 - 1
will resolve to

    2


### Multiplication Operator (*)
Returns the product of the two expressions on either side of the operator

Ex.

    2 * 3
will resolve to

    6

### Division Operator (/) (Not yet implemented)
Returns the quotient of the two expressions on either side of the operator.

Ex.

    9 / 3
will resolve to

    3


## Assignment Operators

### Direct Assignment Operator (=)
Sets the variable on the left hand of the operator to be equal to the expression on the right hand of the operator. If used as an expression, the variable will still be set and the evaluation of the expression will return the value it is set to.

Ex.

    var x = 1;

The variable x is now equal to 1

    if((x = 5) == 5){
        //If Body statement
    }
    else{
        //Else body statement
    };
In this situation the if body statement is evaluated by the compiler as x is set to be 5 and then returns 5. For information on the "==" operator see the Comparison Operators section

### Addition Assignment Operator (+=)
Sets the variable on the left hand of the operator to be equal to the sum of the current value of that variable and the right hand operand. If used as an expression, the variable will still be set and the evaluation of the expression will return the value it is set to.

Ex.

    var x = 3;
    x += 2;

This set x to be equal to 5.

    var x = 1;
    if((x += 2) == 3){
        //If Body
    }
    else{
        //Else Body
    }
The if body will be reached as we set x to be x + 2 which is 3.

The += operator is equivalent to x = x + a.
Thus
    
    x = x + 1;
is equivalent to
    
    x += 1;
### Subtraction Assignment Operator (-=)
Sets the variable on the left hand of the operator to be equal to the difference of the current value of that variable and the right hand operand. If used as an expression, the variable will still be set and the evaluation of the expression will return the value it is set to.

Ex.

    var x = 3;
    x -= 2;

This set x to be equal to 1.

    var x = 5;
    if((x -= 2) == 3){
        //If Body
    }
    else{
        //Else Body
    }
The if body will be reached as we set x to be x - 2 which is 3.

The -= operator is equivalent to x = x - a.
Thus
    
    x = x - 1;
is equivalent to
    
    x -= 1;

## Comparison Operators

### Equivalence Operator (==)
Returns true if the operands on either side of the expression are equivalent.

Ex.

    1 == 1
resolves to true

    var x = 2;
    if((x+2) == 4){
        //If Body
    }
    else{
        //Else Body
    }
The if body is reached as the left hand operand x+2 = 4 is equivalent to the right hand operand (4).

When dealing with numerical types the expression x == a is equivalent to
!(x > a) && !(x < a)

### Inequality Operator (!=)
Returns true if the operands on either side of the expression are not equivalent.

Ex.

    1 != 0
resolves to be true as 1 is not equal to 0

    1 != 1
resolves to be false as 1 is equal to 1

When dealing with numerical types the expression x != a is equivalent to (x > a) || (x < a) 

### Greater Than Operator (>)
Returns true if the left hand operand is numerically greater than the right hand operand.

Ex.

    2 > 1
will resolve to be true as 2 is greater than 1

### Less Than Operator (<)
Returns true if the left hand operand is numerically less than the right hand operator

Ex.

    1 < 2

will resolve to be true as 1 is less than 2

### Greater Than or Equivalence Operator (>=)
Returns true if the right hand operator is greater than or equal to the left hand operator.

Ex.

    3 >= 1
resolves to true as 3 is greater than 1.

    1 >= 1
resolves to true as 1 is equivalent to 1.

### Less Than or Equivalence Operator (<=)
Returns true if the right hand operator is less than or equal to the left hand operator

Ex.

    0 <= 1
resolves to true as 0 is less than 1.

    1 <= 1
resolves to true as 1 is equivalent to 1.


## Boolean Operators
*As a note all numbers != 0 will resolve to be true in boolean expressions*
### And Operator (&&)
This returns true if both the left hand operand and the right hand operand resolve to true. Note unlike other languages the keyword 'and' is not supported(and never will be on purpose).

Ex.

    (1 == 1) && (2 == 2)

will resolve to be true as both 1 is equal to 1 and 2 is equal to 2 are true statements.

    (1 == 1) && (1 == 2)

will resolve to be false as 1 is equal to 1 but 1 is not equal to 2

Table. && operator truth table

| Left Hand Operand        | Right Hand Operand           | &&  |
| ------------- |:-------------:| -----:|
| False      | False | False |
| True      | False      |   False |
| False | True      |    False |
| True | True      |    True |

### Or Operator ( || )
This returns true if at least one of either the left hand operand and the right hand operand resolve to true. Note unlike other languages the keyword 'or' is not supported(and never will be on purpose).

Ex.

    (1 == 1) || (2 == 2)

will resolve to be true as both 1 is equal to 1 and 2 is equal to 2 are true statements.

    (3 == 2) || (1 == 2)

will resolve to be false as 3 is not equal to 2 and 1 is not equal to 2

Table. || operator truth table

| Left Hand Operand        | Right Hand Operand           | \| \|  |
| ------------- |:-------------:| -----:|
| False      | False | False |
| True      | False      |   True |
| False | True      |    True |
| True | True      |    True |
