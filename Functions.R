# feb 11 2025
# working with functions and creating user-defined functions
# NZ

sum(3,2) # a "prefix" function
3 + 2 # an "operator", but it is actually a function
`+`(3,2) 

y <- 3
print(y)
`<-`(yy,3)
print(y)


sd # shows the code
sd(c(3,2)) # call the function with parameters
sd() # call function with default values for paramets

functionName <- function(parX=defaultX,parY=defaultY,parZ=defaultZ) {
  
# curly bracket open marks the start of the function body 
  
  # Body of the function goes here
  # Lines of R code and annotations
  # May also call functions
  # May also create functions
  # May also create local variables
  
retun(z) # returns from the function a single element (z could be a list) 
  
  # curly bracket close marks 
  
  
  
  
  
  
  
  
  
  functionName(parX=myMatrix,parY="Order")
##################################
# FUNCTION: HardyWeinberg
# input: an allele frequency p (0,1)
# output: p and the frequencies of the 3 genotypes AA, AB, BB
# ----------------------------------------------------
HardyWeinberg <- function(p=runif(1)) { 
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signif(c(p=p,AA=fAA,AB=fAB,BB=fBB),digits=3) 
return(vecOut) 
}
HardyWeinberg()

pp <- 0.6 # variable pp is stored in global enviroment
HardyWeinberg(p=pp)

#####################################################
# FUNCTION: HardyWeinberg2
# input: an allele frequency p (0,1)
# output: p and the frequencies of the 3 genotypes AA, AB, BB
#----------------------------
HardyWinber2<- function(p=runif(1)) {
  if (p > 1.0 | p <0.0) {
    return("Function failure: p must be  >= 0.0 nad <= 1.0")
  }
 q <- 1 - p
 fAA <- p^2
 fAB <- 2*p*q
 fBB <- q^2
 vecOut <- signif(c(p=p,AA=fAA,AB=dAB,BB=fBB),digits = 3) 
 return(vecOut)
}
##############################
HardyWinber2()



