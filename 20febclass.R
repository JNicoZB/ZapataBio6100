# 20 feb class

#star
16/5
16 %% 5
16 %% 5

# what if we want to work with onlu the odd number elements?

z <- 1:20
for (i in 1:length(z)) {
  if(i %% 2 !=0) next.      ### aqui se puede cambiar ==0 o !=0 depende de lo que preferimos
   print(i)
}  
  
# Another method, probablu faster (why?)
z <- 1:20
zsub <- z[z %% 2!=0]  #contrast with logical expression in previous of statement!
length(zsub)
print(zsub)


for (i in seq_along(zsub)) 
  cat("i = ",
      

      
############################################
#FUNCTION: ran_walk
# stochastic random walk
# input: time= number of time steps
#         n1 = initial population size (=n[1])
#         lambda = finite rate of increase 
#         noise_sd = sd of a normal distribution with mean 0 
# output: vector n with population sizes > 0 
#.           until extinction, then NA
#--------------------------------------------------------------

library(ggplot2)
ran_walk <- function(times=100,n1=50,lambda=1.00,noise_sd=10) {
  n <- rep(NA,times) # create output vector
  n[1] <- n1 # initialize with starting population size
  noise <- rnorm(n=times,mean = 0,sd=noise_sd) # create noise vector
  for(i in 1:(times-1)) {
    n[i + 1] <- lambda*n[i] + noise[i]
    if(n[i + 1] <=0) {
      n[i + 1] <- NA
      cat("Population extinction at time",i+1,"\n") 
      break}
  }
  
   return(n)
} 

ran_walk()

qplot(x=1:100,y=ran_walk(),geom="line")   

qplot(x=1:100,y=ran_walk(noise_sd = 0),geom ="line")  

qplot(x=1:100,y=ran_walk(noise_sd = 0,lambda = 1.1),geom ="line")  
qplot(x=1:100,y=ran_walk(noise_sd = 0,lambda = 0.98),geom ="line")

qplot(x=1:100,y=ran_walk(),geom="line")
qplot(x=1:100,y=rnorm(n=100,mean = 50),geom = "line")

# loop over rows
# falta completar.. m <-
for (i in 1:nrow(m)) { # could use for (i in seq_len(nrow(m)))
  m[i,] <- m[i,] + i
}
print(m)
  
}

# loop over columns
m <- matrix(round(runif(20),digits = 2),nrow = 5)
for (j in 1:ncol(m)) {
  m[,j] <- m[,j] + j
}
print(m)

# loop over rows and columns
## completar.. m <- matrix(round(runif(20),digits=20,nrow=5)
            
            
            
            
###############################################
# function: SpeciesAreaCurve
# creates power function relationship for S and A 
# input: A is a vector of island areas
#        c is the intercept constant
#        z is the slope constant
# output" S is a vector of species richness values 
# --------------------------------------------------
species_area_curve <- function(A=1:5000,c= 0.5,z=0.26){
  
   S <- c*(A^z)
   return(S)
}
head(species_area_curve())

#########################################################
# function: species_area_plot
# plot species area curves with parameter values
# input: A = vector of areas
#        c = single value for c parameter
#        z + single value for z parameter
# output : smoothed curve with paramets in graph
# -----------------------------------------------------
species_area_plot <- function(A=1:5000,c= 0.5,z=0.26) {
  plot(x=A,y=species_area_curve(A,c,z),type="l",xlab="Island Area",ylab="S",
       
       

# global variables
c_pars <- c(100,150,175)
z_pars <- c(0.10, 0.16, 0.26, 0.3)
par(mfrow=c(3,4))
for (i in seq_along(c_pars)) {
  for (j in seq_along(z_pars)) {
    species_area_plot(c=c_pars[i],z=z_pars[j])
  }
}




