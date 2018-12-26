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
#2011 READ DATA AND RUN, PLOT, WRITE
##############################
##READ THE DATA IN
Data<-read.table(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/SPMMSData_AKExample.csv",header=TRUE,sep=",")
migprob<-(Data$AK2011[1:90])

##RUN THE FITTING CODE (PARAMETERS BOUNDS AND INFO ARE IN THE CODE)
source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/InputParametersOrParameterRanges.R")
source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.txt")

##PLOT ACCUMULATED FIT
plot(step1,xlab="Age",ylab="Migration Rate (proportional)",ylim=c(-.005,.025),pch=1)
lines(step7,col="black",lwd=3)

##PLOT INDIVIDUAL STEP FITTING
lines(step7-step6,col="yellow2",lwd=2,lty=2)
lines(step6-step5,col="orange",lwd=2,lty=2)
lines(step5-step4,col="purple",lwd=2,lty=2)
lines(step4-step3,col="green",lwd=2,lty=2)
lines(step3-step2,col="blue",lwd=2,lty=2)
lines(step2,col="red",lwd=2,lty=2)

##PLOT RESIDUALS
lines(step7-step1,col="dark grey")

##PLOT LABELS
legend(55,.025, 
legend=c("Scaled data", "Full model curve", "Level", "Childhood curve", "Labor force curve", "Retirement curve", "Elderly curve", "Student curve", "Full model residuals"), 
col=c("black", "black", "red", "blue", "green", "purple", "orange", "yellow2", "grey"), 
lwd=c(1,2,2,2,2,2,2,2,1), lty=c(NA,1,2,2,2,2,2,2,1), pch=c(1,NA,NA,NA,NA,NA,NA,NA,NA), cex=0.8)
title("Points are Alaska out-migration by age, 2011",cex.main=1)
mtext(side=3,line=.5,text="Lines are fitted Rogers-Castro model curves with Wilson's student peak",font=2,cex=1)

##RESIDUALS INDEX
squaredsumoffullmodelresiduals

##WRITE THE DATA
#write.table(###, file="C:/###/###.csv", sep=",")
#dev.copy2pdf(file="C:/###/###/2011.pdf") 



##############################
#2012 READ DATA AND RUN, PLOT, WRITE
##############################
##READ THE DATA IN
Data<-read.table(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/SPMMSData_AKExample.csv",header=TRUE,sep=",")
migprob<-(Data$AK2012[1:90])

##RUN THE FITTING CODE (PARAMETERS BOUNDS AND INFO ARE IN THE CODE)
source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/InputParametersOrParameterRanges.R")
source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.txt")

##PLOT ACCUMULATED FIT
plot(step1,xlab="Age",ylab="Migration Rate (proportional)",ylim=c(-.005,.025),pch=1)
lines(step7,col="black",lwd=3)

##PLOT INDIVIDUAL STEP FITTING
lines(step7-step6,col="yellow2",lwd=2,lty=2)
lines(step6-step5,col="orange",lwd=2,lty=2)
lines(step5-step4,col="purple",lwd=2,lty=2)
lines(step4-step3,col="green",lwd=2,lty=2)
lines(step3-step2,col="blue",lwd=2,lty=2)
lines(step2,col="red",lwd=2,lty=2)

##PLOT RESIDUALS
lines(step7-step1,col="dark grey")

##PLOT LABELS
legend(55,.025, 
legend=c("Scaled data", "Full model curve", "Level", "Childhood curve", "Labor force curve", "Retirement curve", "Elderly curve", "Student curve", "Full model residuals"), 
col=c("black", "black", "red", "blue", "green", "purple", "orange", "yellow2", "grey"), 
lwd=c(1,2,2,2,2,2,2,2,1), lty=c(NA,1,2,2,2,2,2,2,1), pch=c(1,NA,NA,NA,NA,NA,NA,NA,NA), cex=0.8)
title("Points are Alaska out-migration by age, 2012",cex.main=1)
mtext(side=3,line=.5,text="Lines are fitted Rogers-Castro model curves with Wilson's student peak",font=2,cex=1)

##RESIDUALS INDEX
squaredsumoffullmodelresiduals

##WRITE THE DATA
#write.table(###, file="C:/###/###.csv", sep=",")
#dev.copy2pdf(file="C:/###/###/2012.pdf") 



##############################
#2013 READ DATA AND RUN, PLOT, WRITE
##############################
##READ THE DATA IN
Data<-read.table(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/SPMMSData_AKExample.csv",header=TRUE,sep=",")
migprob<-(Data$AK2013[1:90])

##RUN THE FITTING CODE (PARAMETERS BOUNDS AND INFO ARE IN THE CODE)
source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/InputParametersOrParameterRanges.R")
source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.txt")

##PLOT ACCUMULATED FIT
plot(step1,xlab="Age",ylab="Migration Rate (proportional)",ylim=c(-.005,.025),pch=1)
lines(step7,col="black",lwd=3)

##PLOT INDIVIDUAL STEP FITTING
lines(step7-step6,col="yellow2",lwd=2,lty=2)
lines(step6-step5,col="orange",lwd=2,lty=2)
lines(step5-step4,col="purple",lwd=2,lty=2)
lines(step4-step3,col="green",lwd=2,lty=2)
lines(step3-step2,col="blue",lwd=2,lty=2)
lines(step2,col="red",lwd=2,lty=2)

##PLOT RESIDUALS
lines(step7-step1,col="dark grey")

##PLOT LABELS
legend(55,.025, 
legend=c("Scaled data", "Full model curve", "Level", "Childhood curve", "Labor force curve", "Retirement curve", "Elderly curve", "Student curve", "Full model residuals"), 
col=c("black", "black", "red", "blue", "green", "purple", "orange", "yellow2", "grey"), 
lwd=c(1,2,2,2,2,2,2,2,1), lty=c(NA,1,2,2,2,2,2,2,1), pch=c(1,NA,NA,NA,NA,NA,NA,NA,NA), cex=0.8)
title("Points are Alaska out-migration by age, 2013",cex.main=1)
mtext(side=3,line=.5,text="Lines are fitted Rogers-Castro model curves with Wilson's student peak",font=2,cex=1)

##RESIDUALS INDEX
squaredsumoffullmodelresiduals

##WRITE THE DATA
#write.table(###, file="C:/###/###.csv", sep=",")
#dev.copy2pdf(file="C:/###/###/2013.pdf") 



##############################
#2014 READ DATA AND RUN, PLOT, WRITE
##############################
##READ THE DATA IN
Data<-read.table(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/SPMMSData_AKExample.csv",header=TRUE,sep=",")
migprob<-(Data$AK2014[1:90])

##RUN THE FITTING CODE (PARAMETERS BOUNDS AND INFO ARE IN THE CODE)
source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/InputParametersOrParameterRanges.R")
source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.txt")

##PLOT ACCUMULATED FIT
plot(step1,xlab="Age",ylab="Migration Rate (proportional)",ylim=c(-.005,.025),pch=1)
lines(step7,col="black",lwd=3)

##PLOT INDIVIDUAL STEP FITTING
lines(step7-step6,col="yellow2",lwd=2,lty=2)
lines(step6-step5,col="orange",lwd=2,lty=2)
lines(step5-step4,col="purple",lwd=2,lty=2)
lines(step4-step3,col="green",lwd=2,lty=2)
lines(step3-step2,col="blue",lwd=2,lty=2)
lines(step2,col="red",lwd=2,lty=2)

##PLOT RESIDUALS
lines(step7-step1,col="dark grey")

##PLOT LABELS
legend(55,.025, 
legend=c("Scaled data", "Full model curve", "Level", "Childhood curve", "Labor force curve", "Retirement curve", "Elderly curve", "Student curve", "Full model residuals"), 
col=c("black", "black", "red", "blue", "green", "purple", "orange", "yellow2", "grey"), 
lwd=c(1,2,2,2,2,2,2,2,1), lty=c(NA,1,2,2,2,2,2,2,1), pch=c(1,NA,NA,NA,NA,NA,NA,NA,NA), cex=0.8)
title("Points are Alaska out-migration by age, 2014",cex.main=1)
mtext(side=3,line=.5,text="Lines are fitted Rogers-Castro model curves with Wilson's student peak",font=2,cex=1)

##RESIDUALS INDEX
squaredsumoffullmodelresiduals

##WRITE THE DATA
#write.table(###, file="C:/###/###.csv", sep=",")
#dev.copy2pdf(file="C:/###/###/2014.pdf") 



##############################
#2015 READ DATA AND RUN, PLOT, WRITE
##############################
##READ THE DATA IN
Data<-read.table(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/SPMMSData_AKExample.csv",header=TRUE,sep=",")
migprob<-(Data$AK2015[1:90])

##RUN THE FITTING CODE (PARAMETERS BOUNDS AND INFO ARE IN THE CODE)
source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/InputParametersOrParameterRanges.R")
source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.txt")

##PLOT ACCUMULATED FIT
plot(step1,xlab="Age",ylab="Migration Rate (proportional)",ylim=c(-.005,.025),pch=1)
lines(step7,col="black",lwd=3)

##PLOT INDIVIDUAL STEP FITTING
lines(step7-step6,col="yellow2",lwd=2,lty=2)
lines(step6-step5,col="orange",lwd=2,lty=2)
lines(step5-step4,col="purple",lwd=2,lty=2)
lines(step4-step3,col="green",lwd=2,lty=2)
lines(step3-step2,col="blue",lwd=2,lty=2)
lines(step2,col="red",lwd=2,lty=2)

##PLOT RESIDUALS
lines(step7-step1,col="dark grey")

##PLOT LABELS
legend(55,.025, 
legend=c("Scaled data", "Full model curve", "Level", "Childhood curve", "Labor force curve", "Retirement curve", "Elderly curve", "Student curve", "Full model residuals"), 
col=c("black", "black", "red", "blue", "green", "purple", "orange", "yellow2", "grey"), 
lwd=c(1,2,2,2,2,2,2,2,1), lty=c(NA,1,2,2,2,2,2,2,1), pch=c(1,NA,NA,NA,NA,NA,NA,NA,NA), cex=0.8)
title("Points are Alaska out-migration by age, 2015",cex.main=1)
mtext(side=3,line=.5,text="Lines are fitted Rogers-Castro model curves with Wilson's student peak",font=2,cex=1)

##RESIDUALS INDEX
squaredsumoffullmodelresiduals

##WRITE THE DATA
#write.table(###, file="C:/###/###.csv", sep=",")
#dev.copy2pdf(file="C:/###/###/2015.pdf") 



##############################
#2011 TO 2015 READ DATA AND RUN, PLOT, WRITE
##############################
##READ THE DATA IN
Data<-read.table(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/SPMMSData_AKExample.csv",header=TRUE,sep=",")
migprob<-(Data$AK2011to2015[1:90])

##RUN THE FITTING CODE (PARAMETERS BOUNDS AND INFO ARE IN THE CODE)
source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/InputParametersOrParameterRanges.R")
source(file="https://raw.githubusercontent.com/edyhsgr/fittingAKmigration/master/Fitting.txt")

##PLOT ACCUMULATED FIT
plot(step1,xlab="Age",ylab="Migration Rate (proportional)",ylim=c(-.005,.025),pch=1)
lines(step7,col="black",lwd=3)

##PLOT INDIVIDUAL STEP FITTING
lines(step7-step6,col="yellow2",lwd=2,lty=2)
lines(step6-step5,col="orange",lwd=2,lty=2)
lines(step5-step4,col="purple",lwd=2,lty=2)
lines(step4-step3,col="green",lwd=2,lty=2)
lines(step3-step2,col="blue",lwd=2,lty=2)
lines(step2,col="red",lwd=2,lty=2)

##PLOT RESIDUALS
lines(step7-step1,col="dark grey")

##PLOT LABELS
legend(55,.025, 
legend=c("Scaled data", "Full model curve", "Level", "Childhood curve", "Labor force curve", "Retirement curve", "Elderly curve", "Student curve", "Full model residuals"), 
col=c("black", "black", "red", "blue", "green", "purple", "orange", "yellow2", "grey"), 
lwd=c(1,2,2,2,2,2,2,2,1), lty=c(NA,1,2,2,2,2,2,2,1), pch=c(1,NA,NA,NA,NA,NA,NA,NA,NA), cex=0.8)
title("Points are Alaska out-migration by age, 2011 to 2015 average annual",cex.main=1)
mtext(side=3,line=.5,text="Lines are fitted Rogers-Castro model curves with Wilson's student peak",font=2,cex=1)

##RESIDUALS INDEX
squaredsumoffullmodelresiduals

##WRITE THE DATA
#write.table(###, file="C:/###/###.csv", sep=",")
#dev.copy2pdf(file="C:/###/###/2011to2015.pdf") 
