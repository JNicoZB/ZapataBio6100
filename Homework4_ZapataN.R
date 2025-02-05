# Homwework 4

#1
x <- 1.1
a <- 2.2
b <- 3.3 

z <- x^(a^b)
print(z)
z <- (x^a)^b
print(z)
z <- 3*(x^3)+2*(x^2)+1
print(z)

#2

my_vector1 <- c(seq(from=1 , to=8), seq(from=7, to=1)) 
print(my_vector1)
my_vector2 <- c(rep(1:5,1:5))
print(my_vector2)
my_vector3 <- c(rep(5:1,1:5))
print(my_vector3)

#3
vector3 <- runif(2)
print(vector3)
asin(vector3)
acos(vector3)
atan(vector3)


#4
#agregar 
queue <- c("sheep", "fox", "owl", "ant")
print(queue)
queue <- c(queue, "serpent")
print(queue)
queue <- queue[queue !="sheep"]
print(queue)
#other way
queue[c(1,2)]
queue[-c(1)]
print(queue)

queue <- c("donkey", queue)
print(queue)
queue <- queue[queue !="serpent"]
print(queue)
queue <- queue[queue !="owl"]
print(queue)
queue <- c(queue[1:2], "aphid", queue[3])  
print(queue)
position <- which(queue == "aphid")
print(position)
