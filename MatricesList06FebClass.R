# Mtrices and Lists





my_vec <- 1:12
m <- matrix(data=my_vec,nrow=4)
print(m)

m <- matrix(data=my_vec,ncol=3)
print(m)

m <- matrix(data=my_vec,ncol=3,byrow=TRUE)
print(m)


# Lists are artomic vectors but each element can hold things of different types and different sizes



my_list <- list(1:10, 
                matrix(1:8,nrow=4,byrow=TRUE),
                letters[1:3],
                pi)
str(my_list)
print(my_list)

# using [] gives you a single item, which is of type list
my_list[4]
my_list[4] - 3 # no, can't subtract a number from a list

# single brackets gives you only the elemnet in that slot, which is always of type list

# to grab the object itself, use[[]]
my_list[[4]]
my_list[[4]] - 3 #now we have the contents

# if a list has 10 elements it is like a train with 10 cars
# [[5]] gives you the contents of car #5 
##[c(4,5,6)] gives you a little train with cars 4, 5, and 6 

# once the double bracket is called, you can access individual elements as before

my_list[[2]]
my_list[[2]][4,1]

# name list items when they are created

my_list2 <- list(tester=FALSE,little_m=matrix(1:9,nrow=3))

my_list2$little_m[2,3] # get row 2, column3
my_list2$little_m # show whole matrix
my_list2$little_m[2,] # show second raw, all columns
my_list2$little_m[,2] # show second columns, all rows
my_list2$little_m[,]
my_list2$little_m[]
my_list2$little_m[2] # what dos this give you?

# The "unlist" strings everything back into a single atomic vector; coercion is used if there are mixed data types
unrolled <- unlist(my_list2)
print(unrolled)

library(ggplot2)
y_var <- runif(10)
x_var <- runif(10)
my_model <- lm(y_var~x_var)
qplot(x=x_var,y=y_var)

# look at output in myModel
print(my_model)

# full results are in summary
print(summary(my_model))

str(summary(my_model))
summary(my_model)$coefficients

summary(my_model)$coefficients["x_var","Pr(>|t|)"]
summary(my_model)$coefficients[2,4]

u <- unlist(summary(my_model))
print(u)

my_slope <- u$coefficients2
my_pval <- u$coefficients8

var_a <- 1:12
var_b <- rep(c("Con","LowN","HighN"),each=4)
var_c <- runif(12)
d_frame <- data.frame(var_a,var_b,var_c)
print(d_frame)
str(d_frame)

# add another row with rbind
# make sure you add a list, with each item corresponding to a column

# newData <- data.frame(list(varA=13,varB="HighN",varC=0.668),stringsAsFactors=FALSE)
new_data <- list(var_a=13,var_b="HighN",var_c=0.668)
print(new_data)
str(new_data)

d_frame <- rbind(d_frame,new_data) 
str(d_frame)
tail(d_frame)

# adding another column is a little easier

#newVar <- data.frame(varD=runif(3))
new_var <- runif(14)
d_frame <- cbind(d_frame,new_var)
head(d_frame)

# create a matrix and data frame with same structures
z_mat <- matrix(data=1:30,ncol=3,byrow=TRUE)
z_dframe <- as.data.frame(z_mat) # coerce it

str(z_mat)   # an atomic vector with 2 dimensions
str(z_dframe) # note horizontal layout of variables!

head(z_dframe) # note automatic variable names
head(z_mat) # note identical layout

# element referencing is the same in both
z_mat[3,3]
z_dframe[3,3]

z_mat[,3]
z_dframe[,3]
z_dframe$V3

z_mat[3]
z_dframe[3,]  # note variable names and row number shown

# what happens if we reference only one dimension?

z_mat[2] # takes the second element of atomic vector (column fill) 
print(z_mat)
z_dframe[2] # takes second atomic vector (= column) from list

z_dframe["V2"]
z_dframe$V2

zd <- runif(10)
print(zd)
zd[c(5,7)] <- NA
print(zd)

complete.cases(zd)
zd[complete.cases(zd)] #clean them out
which(!complete.cases(zd)) # find NA slots 

# use with a matrix

m <- matrix(1:20,nrow=5)
m[1,1] <- NA
m[5,4] <- NA
print(m)

m[complete.cases(m),] 

# now get complete cases for only certain columns! 
m[complete.cases(m[,c(1,2)]),] # drops row 1
m[complete.cases(m[,c(2,3)]),] # no drops
m[complete.cases(m[,c(3,4)]),] # drops row 4
m[complete.cases(m[,c(1,4)]),] # drops 1&4


m <- matrix(data=1:12,nrow=3)
dimnames(m) <- list(paste("Species",LETTERS[1:nrow(m)],sep=""),paste("Site",1:ncol(m),sep=""))
print(m)

# subsetting based on elements
m[1:2,3:4]
# same subsetting based on character strings (but no negative elements)
m[c("SpeciesA","SpeciesB"), c("Site3","Site4")] 

# use blanks before or after comma to indicate full rows or columns
m[1:2, ]

m[ ,3:4]

# first try this logical
colSums(m) > 15
m[ , colSums(m) > 15] 

# e.g. select all rows for which the row total is 22 
m[rowSums(m)==22, ]

# note == for logical equal and != for logical NOT equal
m[rowSums(m)!=22, ] 


# e.g. chooose all rows for which numbers for site 1 are less than 3 AND choose all columns for which the numbers for species A are less than 5

# first, try out this logical for rows
m[ ,"Site1"]<3
m[m[ , "Site1"]<3, ]
# and rey this logical for columns
m["SpeciesA", ]<5

#add this in and select with all rows
m[ ,m["SpeciesA", ]<5]


# now combine both
m[m[ ,"Site1"]<3,m["SpeciesA", ]]

# and compare with full m
print(m)

#caution! simple subscripting to a vector changes the data type!
z <- m[1,]
print(z)
str(z)

z2 <- m[1, ,drop=FALSE]
print(z2)
str(z2)

m2 <- matrix(data=runif(9),nrow=3)
print(m2)
m2[2, ]

# but now this will just pull the second element
m2[2]

#probably should specify row and column indicators
m2[2,1]

m2[m2>0.6] <- NA 
print(m2)


data <-read.csv(file="antcountydata.csv",header=TRUE,sep=",")
str(data)

data[3,2]

data_names <- data[c("state","country")]
str(data_names)

data_names <- data[ ,c("country", "ecoregion")]
str(data_names)

## feb 11 class exercises

# code for reading in a data frame a .csv
my_data <- read.table(file="ToyData.csv", header = TRUE, sep = ",", comment.char = "#")

# inspect object
str(my_data)

# now add a column
my_data$newVar <- runif(4)
head(my_data)
write.table(x=my_data, file = "SampleOutputFile.csv", sep=",")
saveRDS(my_data, file="my_data.RDS") # RDS suffix is not required, but good for clarity
restored_my_data <- readRDS("my_data.RDS)
