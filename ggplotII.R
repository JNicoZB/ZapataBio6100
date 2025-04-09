# ggplot II
# 1 April 2025
# NZ 

library(ggplot2)
library(ggthemes)
library(patchwork)

g1 <- ggplot(data=d) +
  aes(x=displ,y=cty) +
  geom_point() +
  geom_smooth() 
print(g1)

g2 <- ggplot(data=d) +
  aes(x=fl) +
  theme(legend.position = "none")
print(g2)

# g3



g4 <- ggplot(data=d) +
  aes(x=fl,y=cty,fill=fl) +
  geom_boxplot() +
  theme(legend.position = "none")
print(g4)

# place two plots horizontally
g1 + g2

# place 3 plots vertically 
g1 + g2 + g3 + plot_layout(ncol = 1) 

# change relartive area of each plot
g1 + g2 + plot_layout(ncol = 1,heights = c(2,1)) 

g1 + g2 + plot_layout(ncol= 2, widths = c(1,2)) 

# add a spacer plot
g1 + plot_spacer() + g2 

# use nested layouts
g1 + {
  g2 + {
    g4 + 
      plot_layout(ncol = 1)
  }
} + 
  plot_layout(ncol=1) 

# - operator for subtrack placement
g1 + g2 + g4 + plot_layout(ncol = 1)


# / and | for intuitive layouts
(g1 | g2 )/ g4

# Add title, etc. to a parchwork 
g1 + g2 + plot_annotation('This is a title', caption = 'made with parchwork')

# Change styling of patchwork elements 
### completar! g1 + g2 + plot_annotation(title = 'This is a title', caption = 'made with parchwork', theme = theme(plot.title = ))

# Add tags to plots

g4a <- g4 + scale_x_reverse()
g4b <- g4 + scale_y_reverse()
g4c <- g4 + scale_x_reverse() + scale_y_reverse() 

            




# ggsave(filname="MyPlot.pdf", plot = g3, device="pdf", width=20,height = 20,
       
 
# mapping of a discrete variable to point color 
m1 <- ggplot(data = mpg) +
  aes(x=displ,y=cty,color=class) +
  geom_point(size=3)
print(m1) 

# mapping of a discrete variable to point shape (<= 6) 
m1 <- ggplot(data = mpg) +
  aes(x=displ,y=cty,shape=class) +
  geom_point(size=3)
print(m1) 

# mapping of a discrete variable to point size (not advised)
m1 <- ggplot(data = mpg) +
  aes(x=displ,y=cty,size=class) +
  geom_point()
print(m1)

# mapping a continous variable to point size 
m1 <- ggplot(data = mpg) +
  aes(x=displ,y=cty,size=hwy) +
  geom_point()
print(m1)

# mapping a continus variable to point color
m1 <- ggplot(data = mpg) +
  aes(x=displ,y=cty,color=hwy) +
  geom_point(size=5)
print(m1)

# mapping two varoable to different aesthetics
m1 <- ggplot(data = mpg) +
  aes(x=displ,y=cty,shape=class,color=hwy) +
  geom_point(size=5)
print(m1)

# use all 3 (size, shape, color) to indicate 5 attributes! 
m1 <- ggplot(data = mpg) +
  aes(x=displ,y=cty,shape=drv,color=fl,size = hwy) +
  geom_point()
print(m1)

# mapping a variable to the same aesthetic in two different geoms
m1 <- ggplot(data = mpg) +
  aes(x=displ,y=cty,color=drv,) +
  geom_point(size=2) +
  geom_smooth(method = "lm")
print(m1)

# basic faceting with variables split by row, colum, or both
m1 <- ggplot(data = mpg) +
  aes(x=displ,y=cty) +
  geom_point()

m1 + facet_grid(class~fl)

m1 + facet_grid(class~fl, scales="free_y")

m1 + facet_grid(class~fl, scales = "free")
m1 + facet_grid(.~class) 
m1 + facet_grid(class~.) 
m1 + facet_grid(.~class) 
m1 + facet_wrap(~class)
m1 + facet_wrap(~class + fl) 
m1 + facet_wrap(~class + fl, drop=FALSE) 
m1 + facet_grid(class~fl) 

# use facet with other aesthetic mapping within rows or columns

m1 <- ggplot(data=mpg) +
      aes(x=displ,y=cty,color=drv) +
      geom_point()
m1 + facet_grid(.~class) 

# easy to switch to other geoms
m1 <- ggplot(data=mpg) +
  aes(x=displ,y=cty,color=drv) +
  geom_smooth(se=FALSE,method="lm")
m1 + facet_grid(.~class)

# fitting


# add a group and fill mapping for subgroups 
m1 <- ggplot(data=mpg) +
  aes(x=displ,y=cty,group=drv,fill=drv) +
  geom_boxplot()
m1 + facet_grid(.~class)

# standard plot with all data
p1 <- ggplot(data=d) +
  aes(x=displ,y=hwy) +
  geom_point() + 
  geom_smooth()
print(p1)

# break out the drive types


# now use aesthetic mappings within wach geom to over-ride defaults 
#subset the data frame to pull out whay you need

p1 <- ggplot(data=d) +
  aes(x=displ,y=hwy,col=drv) +
  geom_point(data=d[d$drv=="4",]) + 
  geom_smooth()
print(p1)

# instead of subsetting, just map an aesthetic
p1 <- ggplot(data=d) +
  aes(x=displ,y=hwy) +
  geom_point(aes(color=drv)) + 
  geom_smooth()
print(p1)

# Conversely, map the smoother, but not the points
p1 <- ggplot(data=d) +
  aes(x=displ,y=hwy) +
  geom_point() + 
  geom_smooth(aes(color=drv))
print(p1)

# also, subset in the first layer to eliminate some data entirely 
#instead of subsetting, just map an aesthetic
p1 <- ggplot(data=d[d$drv!="4",]) +
  aes(x=displ,y=hwy) +
  geom_point(aes(color=drv)) + 
  geom_smooth()
print(p1)
