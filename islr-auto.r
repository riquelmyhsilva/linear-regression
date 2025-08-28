# ISLR Library

install.packages("ISLR")
library("ISLR")
rm(list=ls())

# ISLR::Auto

df_auto <- ISLR::Auto
df_auto$cylinders <- factor(df_auto$cylinders)
df_auto$origin <- factor(df_auto$origin)
head(df_auto)

# null lm

null_auto_lm <- lm(mpg ~ 1, data = df_auto)
summary(null_auto_lm)

# full lm

full_auto_lm <- lm(mpg ~ cylinders + displacement + horsepower + weight + acceleration + year + origin, data = df_auto)
summary(full_auto_lm)

# forward lm

auto_step_forward <- step(null_auto_lm, scope=formula(full_auto_lm), direction='forward', trace=0)
summary(auto_step_forward)

# backward lm

auto_step_backward <- step(full_auto_lm, direction='backward', trace=0)
summary(auto_step_backward)

# both lm

auto_step_both <- step(full_auto_lm, direction = "both", trace = 0)
summary(auto_step_both)
