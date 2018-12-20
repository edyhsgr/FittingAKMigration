##############################################################################################################################
##EDDIE'S R CODE FOR FITTING THE ROGERS-CASTRO MODEL MIGRATION SCHEDULE WITH WILSON'S STUDENT PEAK
##APPLIED TO ALASKA 2011 TO 2015 OUT-MIGRATION
##
##REFERENCES:
##ORIGINAL CODE AND NOTES ARE AT http://www.demog.berkeley.edu/~eddieh/toolbox.html#SPMMSRCode 
##
##INFO ON THE MODEL MIGRATION SCHEDULE WITH STUDENT PEAK, SEE: Wilson, T. (2010). "Model migration schedules incorporating student migration peaks." Demographic Research, 23(8): 191–222.
##AVAILABLE ONLINE: https://www.demographic-research.org/Volumes/Vol23/8/default.htm
##RELATED EXCEL WORKBOOK BY TOM WILSON (PROVIDED TERRIFIC INSTRUCTION): http://www.demog.berkeley.edu/~eddieh/toolbox.html#SPMMS 
##
##ON THE ROGERS-CASTRO MODEL: Rogers A & Castro LJ (1981). Model Migration Schedules. IIASA Research Report. IIASA, Laxenburg, Austria: RR-81-030
##AVAILABLE ONLINE: http://pure.iiasa.ac.at/id/eprint/1543/
##############################################################################################################################

##############################
##INPUTS
##############################

##########
##SIZES
#SIZE OF migprob (DATA BY AGE) USED
SIZE<-90
#NUMBER OF ITERATIONS - USED FOR FITTING - CAN LOWER (EG USE 100 (and then would take, say, .1 BEST) TO SPEED THINGS UP BUT THAT SEEMS TO MAKE IT MUCH LESS STABLE/RELIABLE
ITER<-1000
#PROPORTION TO REPEAT DISTRIBUTION BOUND SELECTION WITH
BEST<-.01
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
childparam1tries<-array(runif(ITER,0,.1))

#RATE OF DESCENT OF THE CHILDHOOD CURVE
childparam2tries<-array(runif(ITER,0,1))
##########


##########
##STEP 4 INPUTS
#MIN AND MAX OF LABOR FORCE AGES TO FIT OVER
labormin<-17
labormax<-50

#STUDENT AGES TO EXCLUDE - CURRENTLY MUST BE ADJACENT AGES - TO EXCLUDE STUDENT PEAK FROM MODEL CAN SET AS JUST '0'
studentages<-c(19,20) #studentages<-c(0) 

#HEIGHT OF THE LABOR FORCE CURVE
labparam1tries<-array(runif(ITER,.001,.08))

#RATE OF DESCENT OF THE LABOR FORCE CURVE
labparam2tries<-array(runif(ITER,.02,.10))

#POSITION OF THE LABOR FORCE CURVE ON THE AGE-AXIS
labparam3tries<-array(runif(ITER,18,23))

#RATE OF ASCENT OF THE LABOR FORCE CURVE
labparam4tries<-array(runif(ITER,.1,.5))
##########


##########
##STEP 5 INPUTS
#MIN AND MAX OF RETIREMENT AGES TO FIT OVER
retmin<-55
retmax<-75

#HEIGHT OF RETIREMENT CURVE
#TO APPROXIMATELY EXCLUDE RETIREMENT CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
retparam1tries<-array(runif(ITER,.0,.01)) #retparam1tries<-array(runif(ITER,0,1e-10))

#RATE OF DESCENT OF RETIREMENT CURVE
#TO APPROXIMATELY EXCLUDE RETIREMENT CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
retparam2tries<-array(runif(ITER,2.5,10)) #retparam2tries<-array(runif(ITER,0,1e-10))

#POSITION OF THE RETIREMENT CURVE ON THE AGE-AXIS
#TO APPROXIMATELY EXCLUDE RETIREMENT CURVE FROM MODEL CAN SET LOW AS '55' AND HIGH AS '55+1e-10'
retparam3tries<-array(runif(ITER,55,65)) #retparam1tries<-array(runif(ITER,55,55+1e-10))
##########


##########
##STEP 6 INPUTS
#MIN AND MAX OF ELDERLY AGES TO FIT OVER
eldmin<-75
eldmax<-90

#HEIGHT OF THE ELDERLY CURVE
#TO APPROXIMATELY EXCLUDE ELDERLY CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
eldparam1tries<-array(runif(ITER,0,.00005)) #eldparam1tries<-array(runif(ITER,0,1e-10))

#RATE OF ASCENT OF THE ELDERLY CURVE
#TO APPROXIMATELY EXCLUDE ELDERLY CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
eldparam2tries<-array(runif(ITER,0,.1)) #eldparam2tries<-array(runif(ITER,0,1e-10))
##########


##########
##STEP 7 INPUTS
#MIN AND MAX OF STUDENT AGES TO FIT OVER - STUDENT AGES SET ABOVE UNDER STEP 4 INPUTS
stumin<-min(studentages)
stumax<-max(studentages+1)

#HEIGHT OF STUDENT CURVE
#TO APPROXIMATELY EXCLUDE STUDENT CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
stuparam1tries<-array(runif(ITER,.00001,.1)) #stuparam1tries<-array((runif(ITER,0,1e-10))) 

#RATE OF DESCENT OF STUDENT CURVE
#TO APPROXIMATELY EXCLUDE STUDENT CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
stuparam2tries<-array(runif(ITER,0,5)) #stuparam2tries<-array((runif(ITER,0,1e-10))) 

#POSITION OF THE STUDENT CURVE ON THE AGE-AXIS
#TO APPROXIMATELY EXCLUDE STUDENT CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
stuparam3tries<-array(runif(ITER,17,21)) #stuparam3tries<-array((runif(ITER,0,1e-10))) 

#RATE OF ASCENT OF STUDENT CURVE
#TO APPROXIMATELY EXCLUDE STUDENT CURVE FROM MODEL CAN SET LOW AS '0' AND HIGH AS '1e-10'
stuparam4tries<-array(runif(ITER,0,3)) #stuparam4tries<-array((runif(ITER,0,1e-10))) 
##########

