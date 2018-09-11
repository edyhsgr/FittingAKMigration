EDDIE'S R CODE FOR FITTING THE MODEL MIGRATION SCHEDULE WITH STUDENT PEAK APPLIED TO ALASKA 2011 TO 2015 OUT-MIGRATION

-----

STEPS: Everything is run with the R code in ReadRunWriteByYear.txt

ReadRunWriteByYear.txt just needs its directory paths updated. It relies on:

(1) the input data - SPMMSData_AKExample.csv

(2) the R code with the input starting parameters/parameter ranges (just best guesses) - 
InputParametersOrParameterRanges.txt

(3) the R code for fitting - Fitting.txt

CombinedPlots.pdf is output plots from ReadRunWriteByYear.txt, all combined

-----

REFERENCES:

-ORIGINAL CODE WITH NOTES IS AT http://www.demog.berkeley.edu/~eddieh/toolbox.html#SPMMSRCode

-FOR MORE INFO ON THE MODEL MIGRATION SCHEDULE WITH STUDENT PEAK, SEE: Wilson, T. (2010). "Model migration schedules incorporating student migration peaks." Demographic Research, 23(8): 191–222. 
AVAILABLE ONLINE: https://www.demographic-research.org/Volumes/Vol23/8/default.htm 
RELATED EXCEL WORKBOOK BY TOM WILSON: http://www.demog.berkeley.edu/~eddieh/toolbox.html#SPMMS

-GREAT RESOURCE ON THE ROGERS-CASTRO MODEL: Rogers A & Castro LJ (1981). Model Migration Schedules. IIASA Research Report. IIASA, Laxenburg, Austria: RR-81-030 
AVAILABLE ONLINE: http://pure.iiasa.ac.at/id/eprint/1543/

-----

SOME NOTES: I just used very broad possible parameter bounds to fit all to, and included all parameters (no matter overfitting etc), but ~fun to see/think about. It's very slow, and I'm thinking it could probably use some apply()'s and cleanup, and warning messages (esp if bounds are not wide enough), plus review for problems/errors, but ~neat/fun in any case. -Eddie Hunsinger, September 2018
