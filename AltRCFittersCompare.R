
##Comparing Rogers-Castro model migration schedule fitters - January 2022

####################
####################
##READ THE DATA IN
####################
Data<-read.table(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/SPMMSData_AKExample.csv",header=TRUE,sep=",")
ages<-(Data$Age[1:90])
mx<-migprob<-(Data$AK2011to2015[1:90])
####################
####################



####################
####################
##rcbayes example
####################
##After installation, following: https://cran.r-project.org/web/packages/rcbayes/vignettes/intro_to_rcbayes.html
library(rcbayes)

rc_res1 <- mig_estimate_rc(
  ages, mx=mx,
  pre_working_age = TRUE,
  working_age = TRUE,
  retirement = TRUE,
  post_retirement = TRUE,
  # (optional) arguments for Stan
  chains = 4,
  iter = 2000,
  control = list(adapt_delta = 0.8, max_treedepth = 10)
)

rc_res2 <- mig_estimate_rc(
  ages, mx=mx,
  pre_working_age = TRUE,
  working_age = TRUE,
  retirement = TRUE,
  post_retirement = TRUE,
  # (optional) arguments for Stan
  chains = 4,
  iter = 2000,
  control = list(adapt_delta = 0.8, max_treedepth = 10)
)
####################
####################



####################
####################
##MMSRCode example (Eddie's "homespun")
####################
##Student peak function excluded, but all other initial settings unchanged
##Main current location for the code and info: https://github.com/AppliedDemogToolbox/Hunsinger_MMSRCode
##
##SIZES
#SIZE OF migprob (DATA BY AGE) USED
SIZE<-90
#NUMBER OF ITERATIONS - USED FOR FITTING - CAN LOWER (EG USE 100 (and then would take, say, .1 BEST) TO SPEED THINGS UP BUT THAT SEEMS TO MAKE IT MUCH LESS STABLE/RELIABLE
TRIES<-1000
#PROPORTION TO REPEAT DISTRIBUTION BOUND SELECTION WITH
BEST<-.015
#CONVERGENCE INDEX
FITTO<-1e-10
##########

##########
##STEP 1 INPUTS
#PROPORTIONALLY ADJUST DATA TO SUM TO 1 - NO PARAMETERS
##########

##########
##STEP 2 INPUTS
#NUMBER OF SMALLEST VALUES TO USE AVERAGE OF AS LEVEL TERM
level<-5
##########

##########
##STEP 3 INPUTS
#MIN AND MAX OF CHILDHOOD AGES TO FIT OVER
childmin<-0
childmax<-16

#HEIGHT OF THE CHILDHOOD CURVE
childparam1tries<-array(runif(TRIES,0,.1))

#RATE OF DESCENT OF THE CHILDHOOD CURVE
childparam2tries<-array(runif(TRIES,0,1))
##########

##########
##STEP 4 INPUTS
#MIN AND MAX OF LABOR FORCE AGES TO FIT OVER
labormin<-17
labormax<-50

#STUDENT AGES TO EXCLUDE - CURRENTLY MUST BE ADJACENT AGES - TO EXCLUDE STUDENT PEAK FROM MODEL CAN SET AS JUST '0'
studentages<-c(0) #studentages<-c(19,20) 

#HEIGHT OF THE LABOR FORCE CURVE
labparam1tries<-array(runif(TRIES,.001,.08))

#RATE OF DESCENT OF THE LABOR FORCE CURVE
labparam2tries<-array(runif(TRIES,.02,.10))

#POSITION OF THE LABOR FORCE CURVE ON THE AGE-AXIS
labparam3tries<-array(runif(TRIES,18,23))

#RATE OF ASCENT OF THE LABOR FORCE CURVE
labparam4tries<-array(runif(TRIES,.1,.5))
##########

##########
##STEP 5 INPUTS
#MIN AND MAX OF RETIREMENT AGES TO FIT OVER
retmin<-55
retmax<-75

#HEIGHT OF RETIREMENT CURVE
#TO APPROXIMATELY EXCLUDE RETIREMENT CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
retparam1tries<-array(runif(TRIES,.0,.01)) #retparam1tries<-array(runif(ITER,0,1e-10))

#RATE OF DESCENT OF RETIREMENT CURVE
#TO APPROXIMATELY EXCLUDE RETIREMENT CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
retparam2tries<-array(runif(TRIES,2.5,10)) #retparam2tries<-array(runif(ITER,0,1e-10))

#POSITION OF THE RETIREMENT CURVE ON THE AGE-AXIS
#TO APPROXIMATELY EXCLUDE RETIREMENT CURVE FROM MODEL CAN SET LOW AS '55' AND HIGH AS '55+1e-10'
retparam3tries<-array(runif(TRIES,55,65)) #retparam1tries<-array(runif(ITER,55,55+1e-10))
##########

##########
##STEP 6 INPUTS
#MIN AND MAX OF ELDERLY AGES TO FIT OVER
eldmin<-75
eldmax<-90

#HEIGHT OF THE ELDERLY CURVE
#TO APPROXIMATELY EXCLUDE ELDERLY CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
eldparam1tries<-array(runif(TRIES,0,.00005)) #eldparam1tries<-array(runif(ITER,0,1e-10))

#RATE OF ASCENT OF THE ELDERLY CURVE
#TO APPROXIMATELY EXCLUDE ELDERLY CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
eldparam2tries<-array(runif(TRIES,0,.1)) #eldparam2tries<-array(runif(ITER,0,1e-10))
##########

##########
##STEP 7 INPUTS
#MIN AND MAX OF STUDENT AGES TO FIT OVER - STUDENT AGES SET ABOVE UNDER STEP 4 INPUTS
stumin<-min(studentages)
stumax<-max(studentages+1)

#HEIGHT OF STUDENT CURVE
#TO APPROXIMATELY EXCLUDE STUDENT CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
stuparam1tries<-array((runif(TRIES,0,1e-10))) #stuparam1tries<-array(runif(TRIES,.00001,.1)) 

#RATE OF DESCENT OF STUDENT CURVE
#TO APPROXIMATELY EXCLUDE STUDENT CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
stuparam2tries<-array((runif(TRIES,0,1e-10))) #stuparam2tries<-array(runif(TRIES,0,5)) 

#POSITION OF THE STUDENT CURVE ON THE AGE-AXIS
#TO APPROXIMATELY EXCLUDE STUDENT CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
stuparam3tries<-array((runif(TRIES,0,1e-10))) #stuparam3tries<-array(runif(TRIES,17,21)) 

#RATE OF ASCENT OF STUDENT CURVE
#TO APPROXIMATELY EXCLUDE STUDENT CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
stuparam4tries<-array((runif(TRIES,0,1e-10))) #stuparam4tries<-array(runif(TRIES,0,3)) 
##########

source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.R")
MMSR1<-step7

source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.R")
MMSR2<-step7
####################
####################



####################
####################
##Following README from: https://github.com/elflacosebas/migraR
##After installation section: 
library(migraR)
library(dplyr)
library(tidyverse)

data1<- Data[1:90,c(1,7)]
colnames(data1) <- c("x","y")

# Fitting and Plotting data
#fitted.val.7  <- best_migramod(dataIn = data1, maxite = 200, profile = "seven")
#fitted.val.9  <- best_migramod(dataIn = data1, maxite = 200, profile = "nine")
#fitted.val.11 <- best_migramod(dataIn = data1, maxite = 200, profile = "eleven")
fitted.val.13 <- best_migramod(dataIn = data1, maxite = 200, profile = "thirteen")
migraR1<-fitted.val.13$modelClass$value(fitted.val.13$bestParam,data1)
fitted.val.13 <- best_migramod(dataIn = data1, maxite = 200, profile = "thirteen")
migraR2<-fitted.val.13$modelClass$value(fitted.val.13$bestParam,data1)
####################
####################



####################
####################
##Plot the results and data
plot(migprob,ylab = "migration rate", xlab = "age", ylim=c(.02,.12))
lines(rc_res1[["fit_df"]]$median, col = 1)
lines(rc_res2[["fit_df"]]$median, col = 2)
lines(rc_res1[["fit_df"]]$upper, col = "grey")
lines(rc_res1[["fit_df"]]$lower, col = "grey")
lines(rc_res2[["fit_df"]]$upper, col = "grey")
lines(rc_res2[["fit_df"]]$lower, col = "grey")
lines(MMSR1*sum(migprob),col=3)
lines(MMSR2*sum(migprob),col=5)
lines(migraR1,col=6)
lines(migraR2,col=7)
legend(42,.12, 
	legend=c("data", "rcbayes median 1", "rcbayes median 2", 
	"rcbayes upper and lower 1 and 2",
	"homespun 1", "homespun 2", 
	"migraR 1", "migraR 2"),
	col=c("black", 1, 2, "grey", 3, 5, 6, 7), 
	lty=c(NA,1,1,1,1,1,1,1),pch=c(1,NA,NA,NA,NA,NA,NA,NA),cex=.9)
title("Points are Alaska out-migration by age, 2011 to 2015 average annual",cex.main=.9)
####################
####################



####################
####################
##Summarize errors
medrcbayes1_sumofsquaredresiduals<-sum((rc_res1[["fit_df"]]$median-mx)^2)
homespun1_sumofsquaredresiduals<-sum((MMSR1*sum(migprob)-mx)^2)
migraR1_sumofsquaredresiduals<-sum((migraR1-mx)^2)
medrcbayes2_sumofsquaredresiduals<-sum((rc_res2[["fit_df"]]$median-mx)^2)
homespun2_sumofsquaredresiduals<-sum((MMSR2*sum(migprob)-mx)^2)
migraR2_sumofsquaredresiduals<-sum((migraR2-mx)^2)

medrcbayes1_sumofsquaredresiduals
medrcbayes2_sumofsquaredresiduals
homespun1_sumofsquaredresiduals
homespun2_sumofsquaredresiduals
migraR1_sumofsquaredresiduals
migraR2_sumofsquaredresiduals
####################
####################


