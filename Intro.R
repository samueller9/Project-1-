
# mpg data frame found in ggplot2 ----
library(ggplot2)
ggplot2::mpg
str(mpg)
?mpg # or 
help(mpg)

# To plot mpg, we put displ on the x-axis and hwy on the y-axis ----
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()


# Alternate method
mpg %>% ggplot(aes(x = displ, y = hwy)) + #shortcut for pipe shift + command + m 
  geom_point()

# Question! ----
# A group of points fall outside of the linear trend with higher mileage
# How can you explain these cars?

# Answer ----
## map the colors of points to the class variable to reveal the class of each car
ggplot(mpg, aes(x = displ, y = hwy, color = class)) + 
  geom_point()

# alpha aesthetic controls the transparency of the points
ggplot(mpg, aes(x = displ, y = hwy, alpha = class)) + 
  geom_point()

# split your plot into facets (subplots) ----
# each facet display one subset of the data
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  facet_wrap(~ class, nrow = 2)

# facet plot on the combination of two variables add facet_grid()
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  facet_grid(drv ~ cyl)

# Geometric Objects: smooth geom, a smooth line fitted to the data ----
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_smooth()

# different line type for each unique value of the mapped variable
ggplot(mpg, aes(x = displ, y = hwy, linetype = class)) + 
  geom_smooth()

# or color
ggplot(mpg, aes(x = displ, y = hwy, color = drv)) + 
  geom_smooth()

# display multiple geoms in the same plot
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

# add color manually
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(color ="blue") + 
  geom_smooth(color = "red")

# different color and a separate trend-line for each class
ggplot(data = mpg, aes(x = displ, y = hwy, color = class)) + 
  geom_point() + 
  geom_smooth()

# same graph without standard error 
ggplot(data = mpg, aes(x = displ, y = hwy, color = class)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

# different color for each class with a single trend-line for entire data set
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes(color = class)) + 
  geom_smooth(se = FALSE)

# Geometric Objects: Scales, let's start with a simple graph ----
ggplot(mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point()

# let's reverse scales
ggplot(mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point() +
  scale_x_reverse() +
  scale_y_reverse()

# Color Sclase
# We can use palette from the RColorBrewer package
ggplot(mpg, mapping = aes(x = displ, y = hwy, color = class)) + 
  geom_point() +
  scale_color_brewer() # Applies a Brewer color palette to the color scale. 
# distinguishable color scheme for the levels of the "class" variable.

# Color Palettes
ggplot(mpg, mapping = aes(x = displ, y = hwy, color = class)) + 
  geom_point() +
  scale_color_brewer(palette = "Set1") 

# Geometric Objects: Bar Graphs and histograms
# bar graph based on a categorical variable (e.g. class) ----
ggplot(mpg, aes(x = class)) + 
  geom_bar()
# count is a new value obtained through statistical transformation

# Bar graph with flipped bars
ggplot(mpg, aes(x=class)) +
  geom_bar() +
  coord_flip()

# create a bar graph based on a continuous variable (e.g. hwy)
ggplot(mpg, aes(x = hwy)) + 
  geom_histogram()

# create a stacked bar graph for class var. separated by drv var. (categorical)
ggplot(mpg, aes(x = class, fill = drv)) + 
  geom_bar()

# Cartesian Coordinate System ----
# Limit X Axis
ggplot(mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() + 
  coord_cartesian(xlim=c(0,5))

# Labels and Annotations ----
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  labs(title = "Fuel Efficiency by Engine Volume",
       subtitle = "Fuel Economy Data from 1998 to 2008 for 38 Popular Car Models",
       x = "Engine Volume (Liters)",
       y = "Fuel Efficiency (Miles per Gallon",
       color = "Car Type")

# Facet Wrap creates subplots based on one categorical variable
ggplot(mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() + 
  facet_wrap(~ cyl)

# Facet Grid creates subplots based on two categorical variable
ggplot(mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() + 
  facet_grid(cyl ~ fl)

# ctrl + shift + 6 (Maximize Plot Window)