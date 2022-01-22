
##Comparing Rogers-Castro model migration schedule fitters - January 2022

####################
####################
##READ THE DATA IN AND SET THE YEAR
####################
Data<-read.table(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/SPMMSData_AKExample.csv",header=TRUE,sep=",")

##For rcbayes
ages<-Data$Age[1:90]
mx<-Data$AK2011to2015[1:90]

##For MMSRCode ("homespun")
migprob<-Data$AK2011to2015[1:90]

##For migraR
data1<- Data[1:90,c(1,7)]	#Column 1 is Age, column 2 is AK2011, column 3 is AK2012... , column 6 is AK2015, column 7 is AK2011to2015
colnames(data1) <- c("x","y")

##For plot label
YEAR<-"2011 to 2015 average annual"
####################
####################


####################
####################
##rcbayes
####################
set.seed(123)

##After installation, following: https://cran.r-project.org/web/packages/rcbayes/vignettes/intro_to_rcbayes.html
library(rcbayes)

rc_res1 <- mig_estimate_rc(ages, mx=mx, pre_working_age = TRUE, working_age = TRUE, retirement = TRUE, post_retirement = TRUE,
  # (optional) arguments for Stan
  chains = 4, iter = 2000, control = list(adapt_delta = 0.8, max_treedepth = 10))

rc_res2 <- mig_estimate_rc(ages, mx=mx, pre_working_age = TRUE, working_age = TRUE, retirement = TRUE, post_retirement = TRUE,
  # (optional) arguments for Stan
  chains = 4, iter = 2000, control = list(adapt_delta = 0.8, max_treedepth = 10))

rc_res3 <- mig_estimate_rc(ages, mx=mx, pre_working_age = TRUE, working_age = TRUE, retirement = TRUE, post_retirement = TRUE,
  # (optional) arguments for Stan
  chains = 4, iter = 2000, control = list(adapt_delta = 0.8, max_treedepth = 10))

rc_res4 <- mig_estimate_rc(ages, mx=mx, pre_working_age = TRUE, working_age = TRUE, retirement = TRUE, post_retirement = TRUE,
  # (optional) arguments for Stan
  chains = 4, iter = 2000, control = list(adapt_delta = 0.8, max_treedepth = 10))

rc_res5 <- mig_estimate_rc(ages, mx=mx, pre_working_age = TRUE, working_age = TRUE, retirement = TRUE, post_retirement = TRUE,
  # (optional) arguments for Stan
  chains = 4, iter = 2000, control = list(adapt_delta = 0.8, max_treedepth = 10))

rc_res6 <- mig_estimate_rc(ages, mx=mx, pre_working_age = TRUE, working_age = TRUE, retirement = TRUE, post_retirement = TRUE,
  # (optional) arguments for Stan
  chains = 4, iter = 2000, control = list(adapt_delta = 0.8, max_treedepth = 10))

rc_res7 <- mig_estimate_rc(ages, mx=mx, pre_working_age = TRUE, working_age = TRUE, retirement = TRUE, post_retirement = TRUE,
  # (optional) arguments for Stan
  chains = 4, iter = 2000, control = list(adapt_delta = 0.8, max_treedepth = 10))

rc_res8 <- mig_estimate_rc(ages, mx=mx, pre_working_age = TRUE, working_age = TRUE, retirement = TRUE, post_retirement = TRUE,
  # (optional) arguments for Stan
  chains = 4, iter = 2000, control = list(adapt_delta = 0.8, max_treedepth = 10))

rc_res9 <- mig_estimate_rc(ages, mx=mx, pre_working_age = TRUE, working_age = TRUE, retirement = TRUE, post_retirement = TRUE,
  # (optional) arguments for Stan
  chains = 4, iter = 2000, control = list(adapt_delta = 0.8, max_treedepth = 10))

rc_res10 <- mig_estimate_rc(ages, mx=mx, pre_working_age = TRUE, working_age = TRUE, retirement = TRUE, post_retirement = TRUE,
  # (optional) arguments for Stan
  chains = 4, iter = 2000, control = list(adapt_delta = 0.8, max_treedepth = 10))
####################
####################



####################
####################
##MMSRCode
####################
set.seed(123)

##Using MMSRCode (aka SPMMS R code, which includes student-peak) with young-age, 
##working-age, retirement-age, and post-retirement-age functions included - student-peak excluded
source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/AltRCFittersCompare_MMSRCodeInputParametersOrParameterRanges.R")
#Eddie modifying TRIES input, from 1000 to 10000
TRIES<-10000

source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.R")
MMSR1<-step7

source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.R")
MMSR2<-step7

source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.R")
MMSR3<-step7

source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.R")
MMSR4<-step7

source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.R")
MMSR5<-step7

source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.R")
MMSR6<-step7

source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.R")
MMSR7<-step7

source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.R")
MMSR8<-step7

source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.R")
MMSR9<-step7

source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.R")
MMSR10<-step7
####################
####################



####################
####################
##migraR
####################
set.seed(123)

##Following README from: https://github.com/elflacosebas/migraR
##After installation section: 
library(migraR)
library(dplyr)
library(tidyverse)

# Fitting and Plotting data 	#Eddie modified: set maxite to 2000 (default is (faster) 200) 
#fitted.val.7  <- best_migramod(dataIn = data1, maxite = 2000, profile = "seven")
#fitted.val.9  <- best_migramod(dataIn = data1, maxite = 2000, profile = "nine")
#fitted.val.11 <- best_migramod(dataIn = data1, maxite = 2000, profile = "eleven")
fitted.val.13 <- best_migramod(dataIn = data1, maxite = 2000, profile = "thirteen")
migraR1<-fitted.val.13$modelClass$value(fitted.val.13$bestParam,data1)

fitted.val.13 <- best_migramod(dataIn = data1, maxite = 2000, profile = "thirteen")
migraR2<-fitted.val.13$modelClass$value(fitted.val.13$bestParam,data1)

fitted.val.13 <- best_migramod(dataIn = data1, maxite = 2000, profile = "thirteen")
migraR3<-fitted.val.13$modelClass$value(fitted.val.13$bestParam,data1)

fitted.val.13 <- best_migramod(dataIn = data1, maxite = 2000, profile = "thirteen")
migraR4<-fitted.val.13$modelClass$value(fitted.val.13$bestParam,data1)

fitted.val.13 <- best_migramod(dataIn = data1, maxite = 2000, profile = "thirteen")
migraR5<-fitted.val.13$modelClass$value(fitted.val.13$bestParam,data1)

fitted.val.13 <- best_migramod(dataIn = data1, maxite = 2000, profile = "thirteen")
migraR6<-fitted.val.13$modelClass$value(fitted.val.13$bestParam,data1)

fitted.val.13 <- best_migramod(dataIn = data1, maxite = 2000, profile = "thirteen")
migraR7<-fitted.val.13$modelClass$value(fitted.val.13$bestParam,data1)

fitted.val.13 <- best_migramod(dataIn = data1, maxite = 2000, profile = "thirteen")
migraR8<-fitted.val.13$modelClass$value(fitted.val.13$bestParam,data1)

fitted.val.13 <- best_migramod(dataIn = data1, maxite = 2000, profile = "thirteen")
migraR9<-fitted.val.13$modelClass$value(fitted.val.13$bestParam,data1)

fitted.val.13 <- best_migramod(dataIn = data1, maxite = 2000, profile = "thirteen")
migraR10<-fitted.val.13$modelClass$value(fitted.val.13$bestParam,data1)
####################
####################



####################
####################
##Plot the results and data
####################
plot(migprob,ylab = "migration rate", xlab = "age", ylim=c(.02,.12))
lines(rc_res1[["fit_df"]]$median, col = 2)
lines(rc_res2[["fit_df"]]$median, col = 2)
lines(rc_res3[["fit_df"]]$median, col = 2)
lines(rc_res4[["fit_df"]]$median, col = 2)
lines(rc_res5[["fit_df"]]$median, col = 2)
lines(rc_res6[["fit_df"]]$median, col = 2)
lines(rc_res7[["fit_df"]]$median, col = 2)
lines(rc_res8[["fit_df"]]$median, col = 2)
lines(rc_res9[["fit_df"]]$median, col = 2)
lines(rc_res10[["fit_df"]]$median, col = 2)

lines(rc_res1[["fit_df"]]$upper, col = "grey")
lines(rc_res2[["fit_df"]]$upper, col = "grey")
lines(rc_res3[["fit_df"]]$upper, col = "grey")
lines(rc_res4[["fit_df"]]$upper, col = "grey")
lines(rc_res5[["fit_df"]]$upper, col = "grey")
lines(rc_res6[["fit_df"]]$upper, col = "grey")
lines(rc_res7[["fit_df"]]$upper, col = "grey")
lines(rc_res8[["fit_df"]]$upper, col = "grey")
lines(rc_res9[["fit_df"]]$upper, col = "grey")
lines(rc_res10[["fit_df"]]$upper, col = "grey")

lines(rc_res1[["fit_df"]]$lower, col = "grey")
lines(rc_res2[["fit_df"]]$lower, col = "grey")
lines(rc_res3[["fit_df"]]$lower, col = "grey")
lines(rc_res4[["fit_df"]]$lower, col = "grey")
lines(rc_res5[["fit_df"]]$lower, col = "grey")
lines(rc_res6[["fit_df"]]$lower, col = "grey")
lines(rc_res7[["fit_df"]]$lower, col = "grey")
lines(rc_res8[["fit_df"]]$lower, col = "grey")
lines(rc_res9[["fit_df"]]$lower, col = "grey")
lines(rc_res10[["fit_df"]]$lower, col = "grey")

lines(MMSR1*sum(migprob),col=3)
lines(MMSR2*sum(migprob),col=3)
lines(MMSR3*sum(migprob),col=3)
lines(MMSR4*sum(migprob),col=3)
lines(MMSR5*sum(migprob),col=3)
lines(MMSR6*sum(migprob),col=3)
lines(MMSR7*sum(migprob),col=3)
lines(MMSR8*sum(migprob),col=3)
lines(MMSR9*sum(migprob),col=3)
lines(MMSR10*sum(migprob),col=3)

lines(migraR1,col=5)
lines(migraR2,col=5)
lines(migraR3,col=5)
lines(migraR4,col=5)
lines(migraR5,col=5)
lines(migraR6,col=5)
lines(migraR7,col=5)
lines(migraR8,col=5)
lines(migraR9,col=5)
lines(migraR10,col=5)

legend(38,.12, 
	legend=c("data", "rcbayes median fits 1 to 10", 
	"rcbayes upper and lower fits 1 to 10",
	"homespun fits 1 to 10",
	"migraR fits 1 to 10"),
	col=c("black", 2, "grey", 3, 5), 
	lty=c(NA,1,1,1,1),pch=c(1,NA,NA,NA,NA),cex=.9)
title(paste(c("Points are Alaska out-migration by age, ",YEAR),collapse=""),cex.main=.9)
####################
####################



####################
####################
##Summarize errors
####################
medrcbayes_sumofsquaredresiduals<-c(
	medrcbayes1_sumofsquaredresiduals<-sum((rc_res1[["fit_df"]]$median-mx)^2),
	medrcbayes2_sumofsquaredresiduals<-sum((rc_res2[["fit_df"]]$median-mx)^2),
	medrcbayes3_sumofsquaredresiduals<-sum((rc_res3[["fit_df"]]$median-mx)^2),
	medrcbayes4_sumofsquaredresiduals<-sum((rc_res4[["fit_df"]]$median-mx)^2),
	medrcbayes5_sumofsquaredresiduals<-sum((rc_res5[["fit_df"]]$median-mx)^2),
	medrcbayes6_sumofsquaredresiduals<-sum((rc_res6[["fit_df"]]$median-mx)^2),
	medrcbayes7_sumofsquaredresiduals<-sum((rc_res7[["fit_df"]]$median-mx)^2),
	medrcbayes8_sumofsquaredresiduals<-sum((rc_res8[["fit_df"]]$median-mx)^2),
	medrcbayes9_sumofsquaredresiduals<-sum((rc_res9[["fit_df"]]$median-mx)^2),
	medrcbayes10_sumofsquaredresiduals<-sum((rc_res10[["fit_df"]]$median-mx)^2)
	)

homespun_sumofsquaredresiduals<-c(
	homespun1_sumofsquaredresiduals<-sum((MMSR1*sum(migprob)-mx)^2),
	homespun2_sumofsquaredresiduals<-sum((MMSR2*sum(migprob)-mx)^2),
	homespun3_sumofsquaredresiduals<-sum((MMSR3*sum(migprob)-mx)^2),
	homespun4_sumofsquaredresiduals<-sum((MMSR4*sum(migprob)-mx)^2),
	homespun5_sumofsquaredresiduals<-sum((MMSR5*sum(migprob)-mx)^2),
	homespun6_sumofsquaredresiduals<-sum((MMSR6*sum(migprob)-mx)^2),
	homespun7_sumofsquaredresiduals<-sum((MMSR7*sum(migprob)-mx)^2),
	homespun8_sumofsquaredresiduals<-sum((MMSR8*sum(migprob)-mx)^2),
	homespun9_sumofsquaredresiduals<-sum((MMSR9*sum(migprob)-mx)^2),
	homespun10_sumofsquaredresiduals<-sum((MMSR10*sum(migprob)-mx)^2)
	)

migraR_sumofsquaredresiduals<-c(
	migraR1_sumofsquaredresiduals<-sum((migraR1-mx)^2),
	migraR2_sumofsquaredresiduals<-sum((migraR2-mx)^2),
	migraR3_sumofsquaredresiduals<-sum((migraR2-mx)^2),
	migraR4_sumofsquaredresiduals<-sum((migraR3-mx)^2),
	migraR5_sumofsquaredresiduals<-sum((migraR4-mx)^2),
	migraR6_sumofsquaredresiduals<-sum((migraR5-mx)^2),
	migraR7_sumofsquaredresiduals<-sum((migraR6-mx)^2),
	migraR8_sumofsquaredresiduals<-sum((migraR7-mx)^2),
	migraR9_sumofsquaredresiduals<-sum((migraR8-mx)^2),
	migraR10_sumofsquaredresiduals<-sum((migraR10-mx)^2)
	)

medrcbayes_sumofsquaredresiduals
homespun_sumofsquaredresiduals
migraR_sumofsquaredresiduals
####################
####################


