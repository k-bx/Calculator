# Calculator

A simple string calculator

Features
--
* Operations `+ - * / % ^`
* Parentheses support
* Scientific number notation support
* Embedded constants `pi` and `e`
* Embedded functions `sin cos tan asin acos atan log exp sqrt abs`
* If conditions with a following syntax `if(<cond_expression>,<expression1>,<expression2>)`
* Lazy evaluation of function arguments
* Comparison functions `lt gt le ge eq ne`
* Comparison operators `< > <= >= == /=`
* Optimisations like `log(exp(x)) = x`
* Automatic detection of division operation in `atan` argument
* Variable `_` stores result of the previous calculation
* A variable can be defined using syntax `<name> = <expression>`
* A user defined function can be defined using syntax `<name>(<arg1>[,<arg2>[,<arg3>...]]) = <expression>`
* A user defined operator can be defined using syntax `<name>(<priority>,<associativity>) = <expression>`
* The available symbols for operators are `+-/*%^!~&|=><`
* Arguments `x y` are default for user defined operators
* A priority of the user defined operator can be `1 2 3 or 4`
* An associativity of the user defined operator is left if `associativity` equals `0` of right otherwise
* A function or operator can take other functions as arguments
* Outer variables' values are captured inside user defined functions
* A signature of the user defined function consists of a name and arity
