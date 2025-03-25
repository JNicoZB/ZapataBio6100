# class 13 feb
#simple inequalities




5 ==3
5 != 3
FALSE & FALSE
FALSE & TRUE
TRUE & TRUE 

5 > 3 & 1!=2
1==2 & 1!=2

# use | for OR
FALSE | FALSE
FALSE | TRUE
TRUE | TRUE 
1==2 | 1==2

a <- 1:10
b <- 10:1

a > 4 & b > 4

xor(FALSE,FALSE)
xor(FALSE,TRUE)
xor(TRUE,TRUE)
a <- c(0,0,1)
b <- c(0,1,1)
xor(a,b)
a | b

# boolean algebra on sets of atomic vectors (logical,numeric, cjaracter strings) 

a <- 1:7
b <- 5:10
# union to get all elements
union(a,b)
c(a,b)
unique(c(a,b))

# intersect to get comon elements
intersect(a,b)

# setdiff to get distinct elements in a 
setdiff(a,b)

setdiff(b,a)

# setequal to check for identical elements
setequal(a,b)

z <- matrix(1:12,nrow=4,byrow = TRUE)
z1 <- matrix(1:12,nrow=4,byrow = FALSE)

# This just compares element by element
z==z1

# Use identical for entire structures
identical(z,z1)
z1 <- z
identical(z,z1)
d <- 12
d %in% union(a,b)

is.element(d,union(a,b))

d <- c(10,12)
d %in% union(a,b)
d %in% a

d %in% a

if (condition) {expresion1}

if (condtion) {espresion1} else {expression2}

if (condition1) {expresion1} else
   if (condition2) {expression2} else 