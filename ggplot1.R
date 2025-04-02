## ggplot graphics 1
# NZ
# 27 March 2025

library(ggplot2)
library(ggthemes)
library(patchwork)

# p1 <- ggplot(data= <DATA>) + aes(<MAPPINGS>) + <GEOM_FUNCTION>(aes(<MAPPINGS>), stat=<STAT>,position=<POSITION>) + <COORDINATE_FUNCTION> + <FACET_FUNCTIOM>
# print(p1) 

# ggsave(plot=p1, filename+ "MyPlot", width=5, height=3, units="in", device="pdf') 

d <- mpg # use built in mpg data frame
str(d) 
table(d$fl)

# basic histogram plot
ggplot(data = d) +
  aes(x=hwy) +
   geom_histogram()

ggplot(data=d) +
  aes(x=hwy) +
  geom_histogram(fill="khaki",color="black")

## basic density plot
ggplot(data=d) +
  aes(x=hwy) +
  geom_density(fill="mintcream",color="blue")

# basic scatter plot
ggplot(data=d) +
  aes(x=displ,y=hwy) +
  geom_point() +
geom_smooth() +
  geom_smooth(method="lm",col="red")

# basic boxplot
ggplot(data=d) +
  aes(x=fl, y=cty) +
  geom_boxplot() 

# basic bosplot
ggplot(data=d) +
  aes(x=fl, y=cty) +
  geom_boxplot(fill="thistle")

# basic barplot (long format)

ggplot(data = d) +
 aes(x=fl) +
  geom_bar(fill="thistle", color="black")

# bar plot with specified counts or meansw
x_treatment <- c("Control","Low","High")
y_response <- c(12,2.5,22.9)
summary_data <- data.frame(x_treatment,y_response) 

ggplot(data = sumary_data) +
  aes(x=x_treatment,y=y_response) +
  geom_col(fill=c("grey50","goldenrod","goldenrod"),col="black")

# basic curves and functions
my_vec <- seq(1,100,by=0.1)

# plot 



# plot probability functions
d_frame <- data.frame(x=my_vec,y=dgamma(my_vec,shape=5, sacale=3))
ggplot(data=d_frame) +
  aes(x=x,y=y) +
  geom_line()


# plot user-defined functions





p1 <- ggplot(data=d) +
      (mappinng=aes(x=displ,y=cty)) +
      geom_point()
print(p1)

p1 + theme_classic() # no gird lines
p1 + theme_linedraw() # black frame
p1 + theme_dark() # good for brightly colored points
p1 + theme_base() # mimics base R
p1 + theme_par() # marches current par settings in base
p1 + theme_void() # shows data only
p1 + theme_solarized() # good for web pages
p1 + theme_

p1

p1 + theme_classic(base_size=30,base_family = "serif")

# defaults: theme_grey, base_size=16, base_family="Helvetica") 
# font families (Mac): Times, Ariel, Monaco, Courier, Helvetica, serif, sans 
# code for adding additional fronts 

library(extrafont)
font_import() # imports all system fonts (run once)

fonts()
p1 + theme_classic(base_size = 35,base_family = "Chalkduster")

# user cordinate_flip to invert entiere plot 

p2 <- ggplot(data=d) +
  aes(x=fl,fill=fl) +
  geom_bar()

print(p2)

p2 + coord_flip() + theme_grey(base_size=20, base_family = "sans") 

p1 <- ggplot(data=d) +
  aes(x=displ,y=cty) +
  geom_point() +
  labs(title= "My graph title here", subtitle = "An extended sutitle") +
  theme_bw(base_size=25,baser_family="Monaco") 

print(p1) 

# use attributes for poin size shape, color
p1 <- ggplot(data=d) +
  aes(x=displ,y=cty) +
  geom_point(size=4, shape=21, color="black", fill="cyan") +
  theme_bw() 
print(p1)

# use x and/or limits to clip data set
p1 <- ggplot(data=d) +
  aes(x=displ,y=cty) +
  geom_point(size=4, shape=21, color="black", fill="cyan") +
  xlim(4,7) + ylim(-10,40) + 
  theme_bw(base_size = 25,base_family = "Monaco")
print(p1)

