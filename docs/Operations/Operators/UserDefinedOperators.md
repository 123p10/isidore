# Defining Your own Operators
## Preface
Defining your own operators may be helpful for improving code beauty and make code simpler. This feature is not advised as it may cause confusion but it is left in to allow users to extend this very small, simple language. It may be deprecated in future versions.

## Binary

You may declare your own operator in the same method you declare a function.
The format is:

    <Type> binary <Operator> <Precedence>(<var 1> <var 2>){
        //Insert statements here
        return <return value>
    }
Type is the return value, operator is the operator you will use, I have limited what you can use as an operator to really some standard operators, the list will be expanding but this features is experimental and not recommended.

Ex.

    void binary : 1 (LHS RHS){
        return LHS*LHS + RHS*RHS;
    }
    3:2;
the last expression will resolve to be 13 as it is 3\*3 + 2\*2 which is 13.

## Unary
You may declare your own operator in the same method you declare a function.
The format is:

    <Type> unary <Operator> (<var 1>){
        //Insert statements here
        return <return value>
    }
Type is the return value, operator is the operator you will use, I have limited what you can use as an operator to really some standard operators, the list will be expanding but this features is experimental and not recommended.

Ex.

    void unary | (op){
        return op*op;
    }
    |4;
the last expression will resolve to be 16 as it is 4\*4 which is 16.
