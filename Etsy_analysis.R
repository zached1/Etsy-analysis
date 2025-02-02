library(dplyr) #data manipulation

#First I import the data in, I like file.choose because it always works
etsy <- read.csv(file.choose())

#this lets us take a look at the data we just imported
View(etsy)

#we have three quantitative variables: cost, review and crowd
summary(etsy)
# based on some descriptive statistics, all the reviews seem exceptionally high
# The average cost of an item is a little less than 20$
# Average crowd is 537 while the median is 64, clearly not normally distributed

