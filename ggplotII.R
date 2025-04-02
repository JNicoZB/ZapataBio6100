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

