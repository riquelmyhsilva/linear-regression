# ISLR Library

install.packages("ISLR")
library("ISLR")
rm(list=ls())

# ISLR::Credit

df_hitters <- ISLR::Hitters
head(df_hitters)

# null lm

null_hitters_lm <- lm(Salary ~ 1, data = df_hitters)
summary(null_hitters_lm)

# full lm

full_hitters_lm <- lm(Salary ~ AtBat + Hits +	HmRun +	Runs +	RBI +	Walks +	Years +	CAtBat +	CHits +	CHmRun	+ CRuns	+ CRBI + CWalks	+ League	+ Division +	PutOuts	+ Assists +	Errors + NewLeague, data = df_hitters)
summary(full_hitters_lm)

# forward lm

hitters_step_forward <- step(null_hitters_lm, scope=formula(full_hitters_lm), direction='forward', trace=0)
summary(hitters_step_forward)

# backward lm

hitters_step_backward <- step(full_hitters_lm, direction='backward', trace=0)
summary(hitters_step_backward)

# both lm

hitters_step_both <- step(full_hitters_lm, direction = "both", trace = 0)
summary(hitters_step_both)
