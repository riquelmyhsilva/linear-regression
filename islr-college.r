## ISLR::College outstate

df_college <- ISLR::College
head(df_college)

null_college_lm <- lm(Outstate ~ 1, data = df_college)
summary(null_college_lm)

full_college_lm <- lm(Outstate ~ Private + Apps + Accept + Enroll + Top10perc + Top25perc + F.Undergrad + P.Undergrad + Room.Board + Books + Personal + PhD + Terminal + S.F.Ratio + perc.alumni + Expend + Grad.Rate, data = df_college)
summary(full_college_lm)

college_step_forward <- step(null_college_lm, scope=formula(full_college_lm), direction='forward', trace=0)
summary(college_step_forward)

college_step_backward <- step(full_college_lm, direction='backward', trace=0)
summary(college_step_backward)

college_step_both <- step(full_college_lm, direction = "both", trace = 0)
summary(college_step_both)
