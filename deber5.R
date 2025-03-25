# deber cinco 

# First part
n_dims <- sample(3:10, 1) 


vector_integers <- 1:(n_dims^2)

reshuffled_vector <- sample(vector_integers) 

matrix_square <- matrix(reshuffled_vector, nrow = n_dims, ncol = n_dims) 

print(matrix_square)

transposed_matrix <- t(matrix_square) 

print(transposed_matrix) 

suma_row1 <- sum(matrix_square[1, ])
print(suma_row1)
media_row1 <- mean(matrix_square[1, ])
print(media_row1)
suma_rowlast <- sum(matrix_square[n_dims, ])
print(suma_rowlast)
media_rowlast <- mean(matrix_square[n_dims, ]) 
print(media_rowlast)

eigen_values_vectors <- eigen(matrix_square) 
print(eigen_values_vectors$values)
print(eigen_values_vectors$vectors)

values_type <- typeof(eigen_values_vectors$values) 
print(values_type)
vectores_type <- typeof(eigen_values_vectors$vectors) 
print(vectores_type)




