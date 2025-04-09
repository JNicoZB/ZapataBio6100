## ggplot III
# 3 April 2025
# NZ

devtools::install_github("wilkelab/cowplot")
install.packages("colorspace", repos= "http://R-Forge.R-project.org")
devtools::install_github("clauswilke/colorblindr")

library(ggplot2)
library(ggthemes)
library(colorblindr)
library(colorspace)
library(wesanderson)
library(ggsci)


d <- mpg

p1 <- ggplot(d) +
   aes(x=drv,fill=fl) +
  geom_bar()
print(p1)







d_tiny <- tapply(X=d$hwy, 
                 INDEX=as,factor(d$fl), 
                 FUN=mean) 
print(d_tiny)
str(d_tiny)
d_tiny <-data.frame(hwy=d_tiny) 

