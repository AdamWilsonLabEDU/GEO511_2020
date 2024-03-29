library(ggplot2);library(knitr)
kable(head(mtcars))

plot(y=mtcars$mpg,x=mtcars$wt)

plot(mpg~wt,data=mtcars)

plot(mpg~wt,data=mtcars,
  ylab="Miles per gallon (mpg)",
  xlab="Weight (1000 pounds)",
  main="Fuel Efficiency vs. Weight",
  col="red"
  )

plot(mpg~wt,data=mtcars,
  type="l",
  ylab="Miles per gallon (mpg)",
  xlab="Weight (1000 pounds)",
  main="Fuel Efficiency vs. Weight",
  col="blue"
  )

?hist

hist(mtcars$mpg)

p <- ggplot(mtcars, aes(x=wt, y=mpg))
summary(p)
p

p + geom_point()

ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point()

p + 
  geom_point(aes(colour = factor(cyl)))
 

p + 
  geom_point(aes(shape = factor(cyl)))

p + 
  geom_point(aes(size = qsec))

p + 
  geom_point(aes(colour = factor(cyl),size = qsec))

p + 
  geom_point(aes(colour = factor(cyl),size = qsec,shape=factor(gear)))

p + geom_point() + 
  geom_smooth(method="lm")

p + geom_point() + 
  geom_smooth(method="loess")

p + geom_point(aes(colour = cyl)) + 
  scale_colour_gradient(low = "blue")

p + geom_point(aes(shape = factor(cyl))) + 
  scale_shape(solid = FALSE)

ggplot(mtcars, aes(wt, mpg)) + 
  geom_point(colour = "red", size = 3)

d <- ggplot(diamonds, aes(carat, price))
d + geom_point(alpha = 0.2)

d + 
  geom_point(alpha = 0.1)

d + 
  geom_point(alpha = 0.01)



p <- ggplot(mtcars, aes(factor(cyl), mpg))
p + geom_point()

p + 
  geom_jitter()

p + 
  geom_violin()

p + 
  geom_violin() + geom_jitter(position = position_jitter(width = .1))

library("MASS")
data(geyser)
m <- ggplot(geyser, aes(x = duration, y = waiting))

m + 
  geom_point()

m + 
  geom_point() +  stat_density2d(geom="contour")

m + 
  geom_point() +  stat_density2d(geom="contour") +
  xlim(0.5, 6) + ylim(40, 110)

m + stat_density2d(aes(fill = ..level..), geom="polygon") + 
  geom_point(col="red")



b=ggplot(mpg,aes(fl))+
  geom_bar( aes(fill = fl)); b

b + scale_fill_grey( start = 0.2, end = 0.8, 
                   na.value = "red")

a <- ggplot(mpg, aes(x=hwy,y=cty,col=displ)) + 
  geom_point(); a

a +  scale_color_gradient( low = "red", 
                          high = "yellow")

a + scale_color_gradient2(low = "red", high = "blue", 
                       mid = "white", midpoint = 4)

a + scale_color_gradientn(
  colours = rainbow(10))

b + 
  scale_fill_brewer( palette = "Blues")





set.seed(201)
n <- 100
dat <- data.frame(
    xval = (1:n+rnorm(n,sd=5))/20,
    yval = 10^((1:n+rnorm(n,sd=5))/20)
)

sp <- ggplot(dat, aes(xval, yval)) + geom_point()
sp

sp + scale_y_log10()

ggplot(diamonds, aes(clarity, fill=cut)) + geom_bar()


ggplot(diamonds, aes(clarity, fill=cut)) + geom_bar(position="dodge")


ggplot(mpg, aes(x = cty, y = hwy, color = factor(cyl))) +
  geom_point()+
  facet_wrap(~year)

ggplot(mpg, aes(x = cty, y = hwy, color = factor(cyl))) +
  geom_point()+
  facet_grid(year~cyl)

library(ggthemes)

p=ggplot(mpg, aes(x = cty, y = hwy, color = factor(cyl))) +
  geom_jitter() +
  labs(
    x = "City mileage/gallon",
    y = "Highway mileage/gallon",
    color = "Cylinders"
  )

p

p + theme_solarized()

p +  theme_solarized(light=FALSE)

p + theme_excel() 

p + theme_economist()

library(xkcd)

ggplot(mtcars, aes(mpg, wt)) + 
     geom_point() +
     geom_smooth()+
      ylab("Weight")+xlab("Miles per Gallon")+
      theme_xkcd() 


## ggsave(filename, plot = last_plot(), scale = 1, width, height)

## pdf(filename, width, height)  # open device
## ggplot()                      # draw the plot(s)
## dev.off()                     # close the device
