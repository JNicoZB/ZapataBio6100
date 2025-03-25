# class 18 FEB


z <- signif(runif(1),digits=2)
print(z)
z > 0.5
if (z > 0.5) cat(z, "is a bigger than average number","\n")

if(z > 0.8) {cat(z, "is a large number","\n")} else
 if (z < 0.2) {cat(z,"is a small number","\n")} else
                 {cat(z, "is a number of typical size","\n")
                 cat("z^2=",z^2,"\n")}

z <- 1:10

# this does not do anythig
if (z > 7) 
print(z)

# probably not what you want
if (z < 7) 
print(z)


# Suppose we have an insect...

# However, ....

tester <- runif(1000) # start with random uniform elements
eggs <- ifelse(tester>0.35,rpois(n=1000,lambda = 10.2),0) 
hist(eggs) 

pVals <- runif(1000)
z <- ifelse(pVals<=0.025,"lowerTail","nonSig")
z[pVals>=0.975] <- "upperTail"
table(z)

z1 <- rep("nonSig",length(pVals))
z1[pVals<=0.025] <- "lowerTail"
z1[pVals>=0.975] <- "upperTail"
table(z1)

