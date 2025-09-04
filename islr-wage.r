## ISLR::Wage

df_wage <- ISLR::Wage
head(df_wage)

null_wage_lm <- lm(wage ~ 1, data = df_wage)
summary(null_wage_lm)

full_wage_lm <- lm(wage ~ year + age + maritl +	race + education + jobclass + health + health_ins +	logwage, data = df_wage)
summary(full_wage_lm)

wage_step_forward <- step(null_wage_lm, scope=formula(full_wage_lm), direction='forward', trace=0)
summary(wage_step_forward)

wage_step_backward <- step(full_wage_lm, direction='backward', trace=0)
summary(wage_step_backward)

wage_step_both <- step(full_wage_lm, direction = "both", trace = 0)
summary(wage_step_both)
