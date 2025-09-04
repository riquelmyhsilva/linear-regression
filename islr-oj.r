## ISLR::OJ price

df_oj <- ISLR::OJ
head(df_oj)

null_oj_lm <- lm(PriceDiff ~ 1, data = df_oj)
summary(null_oj_lm)

full_oj_lm <- lm(PriceDiff ~ StoreID + LoyalCH + Store7 + PctDiscMM + PctDiscCH + ListPriceDiff, data = df_oj)
summary(full_oj_lm)

oj_step_forward <- step(null_oj_lm, scope=formula(full_oj_lm), direction='forward', trace=0)
summary(oj_step_forward)

oj_step_backward <- step(full_oj_lm, direction='backward', trace=0)
summary(oj_step_backward)

oj_step_both <- step(full_oj_lm, direction = "both", trace = 0)
summary(oj_step_both)
