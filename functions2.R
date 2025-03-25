my_func <- function(a=3,b=4) {
  z <- a + b
  return(z)
}
my_func()

my_func_bad <-function(a=3) {
  z <- a + b
  return(z)
}
my_func_bad() # crashes because it can't find b

b <- 100

my_func_bad() # Ok now because b exists as a global variable 

# But it is fine to create vriables locally 
my_func_ok <- function(a=3) {
  bb <- 100
  z <- a + bb
  return(z)
}

my_func_ok() # no problems now 

print(bb) # but this variable is still hidden from the global evnvirment
print(a)
print(z)

#---------------------------------------
fit_linear <- function(x=runif(20),y=runif(20)) {
my_mod <- lm(y~x) # fit the model
my_out <- c(slope=sumary(my_mod)$coefficients[2,1], p_value=summary(my_mod)$coefficients[2,4])
plot(x=x,y=y) # quick and disrty plot check output
  return(my_out)
}
############################################################
fit_linear()

#---------------------------------------
fit_linear2 <- function(p=Null) {
  if(is.null(p)) {
    p <- list(x=runif(20),y=runif(20))
  }
  my_mod <- lm(p$y~p$x) # fit the model
  my_out <- c(slope+summary(my_mod)$coefficients[2,1], p_value=sumary(my+mod)$coefficients[2,4])
  plot(x=p$x,y=p$y) # quick and dirty plot to check output
  return(my_out)
}

#############################################################
fit_linear2()
my_pars <-list(x=1:10,y=sort(runif(10)))
fit_linear2(p=my_pars)

z <- c(runif(99),NA)
mean(z)
mean(x=z,na.rm=TRUE)
mean(x=z,na.rm=TRUE,trim=0.05)
