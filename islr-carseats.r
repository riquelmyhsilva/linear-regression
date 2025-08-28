# ISLR Library

install.packages("ISLR")
library("ISLR")
rm(list=ls())

# ISLR::Carseats

df_carseats<- ISLR::Carseats
head(df_carseats)

# null lm

null_carseats_lm <- lm(Sales ~ 1, data = df_carseats)
summary(null_carseats_lm)

# full lm

full_carseats_lm <- lm(Sales ~ CompPrice + Income + Advertising + Population + Price + ShelveLoc + Age + Education + Urban + US, data = df_carseats)
summary(full_carseats_lm)

# forward lm

carseats_step_forward <- step(null_carseats_lm, scope=formula(full_carseats_lm), direction='forward', trace=0)
summary(carseats_step_forward)

# backward lm

carseats_step_backward <- step(full_carseats_lm, direction='backward', trace=0)
summary(carseats_step_backward)

# both lm

carseats_step_both <- step(full_carseats_lm, direction = "both", trace = 0)
summary(carseats_step_both)
