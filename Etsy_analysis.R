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

cor(etsy$cost,etsy$review)
#[1] -0.02705298

cor(etsy$cost,etsy$crowd)
#[1] 0.01709155

cor(etsy$review,etsy$crowd)
#[1] 0.09263965
#nothings seems overly correlated, so I would not expect much from this data

#I will run a basic regression model first to see how the data models
model <- lm(cost~review+crowd, data = etsy)
summary(model)
# Call:
#   lm(formula = cost ~ review + crowd, data = etsy)
# 
# Residuals:
#   Min     1Q Median     3Q    Max 
# -109.2  -34.4  -23.8   -5.8 5957.7 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 57.291812  11.070655   5.175 2.47e-07 ***
#   review      -3.312544   2.383263  -1.390    0.165    
# crowd        0.001717   0.001805   0.951    0.342    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 177.4 on 2333 degrees of freedom
# Multiple R-squared:  0.001119,	Adjusted R-squared:  0.000263 
# F-statistic: 1.307 on 2 and 2333 DF,  p-value: 0.2708

#well nothings is significant