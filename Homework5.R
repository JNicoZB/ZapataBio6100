#Homework 5

n_dims <- 8
print(n_dims)

my_vector1 <- 1:(n_dims^2)
print(my_vector1)

sample(my_vector1)

m <- matrix(data = my_vector1, nrow = 4)
print(m)

m <-matrix(data= my_vector1, ncol = 4)
print(m)


transposed_matrix <- t(m)
print(transposed_matrix)

m[1:2, ]
m[1, ]  
m[4, ]
m[ ,1]
m[rowSums(m[ ,1])] 
rowSums(m) == m[ ,1]
