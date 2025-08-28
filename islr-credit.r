# ISLR Library

install.packages("ISLR")
library("ISLR")
rm(list=ls())

# ISLR::Credit

df_credit <- ISLR::Credit
head(df_credit)

# null lm

null_credit_lm <- lm(Balance ~ 1, data = df_credit)
summary(null_credit_lm)

# full lm

full_credit_lm <- lm(Balance ~ Income + Limit + Rating + Cards + Age + Education + Gender + Student + Married + Ethnicity, data = df_credit)
summary(full_credit_lm)

# forward lm

credit_step_forward <- step(null_credit_lm, scope=formula(full_credit_lm), direction='forward', trace=0)
summary(credit_step_forward)

# backward lm

credit_step_backward <- step(full_credit_lm, direction='backward', trace=0)
summary(credit_step_backward)

# both lm

credit_step_both <- step(full_credit_lm, direction = "both", trace = 0)
summary(credit_step_both)
