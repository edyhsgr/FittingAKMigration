<pre>
EDDIE'S R CODE FOR FITTING THE ROGERS-CASTRO MODEL MIGRATION SCHEDULE WITH WILSON'S STUDENT PEAK, 
APPLIED TO ALASKA 2011 TO 2015 OUT-MIGRATION (ANNUAL AND AVERAGE ANNUAL FOR THE PERIOD)

-----
STEPS: Everything is run with the R code in ReadRunWriteByYear.R

It relies on:

(1) the input data - SPMMSData_AKExample.csv

(2) the R code with the input starting parameters/parameter ranges (just best guesses) - 
InputParametersOrParameterRanges.R

(3) the R code for fitting - Fitting.R

Each of these three items that ReadRunWriteByYear.R relies on is linked through the Internet, 
so you should be able to simply select-all, copy and paste ReadRunWriteByYear.R into an R command 
line to make it work. 

CombinedPlots.pdf and CombinedPlots.gif is output plots from ReadRunWriteByYear.R, all combined

-----
REFERENCES:
-ORIGINAL CODE WITH NOTES IS AT https://applieddemogtoolbox.github.io/Toolbox/#SPMMSRCode 

-INFO ON THE MODEL MIGRATION SCHEDULE WITH STUDENT PEAK, SEE: Wilson, T. (2010). 
"Model migration schedules incorporating student migration peaks." Demographic Research, 23(8): 191–222. 
AVAILABLE ONLINE: https://www.demographic-research.org/Volumes/Vol23/8/default.htm 
RELATED EXCEL WORKBOOK BY TOM WILSON (PROVIDED TERRIFIC INSTRUCTION): 
https://applieddemogtoolbox.github.io/Toolbox/#SPMMS

-ON THE ROGERS-CASTRO MODEL: Rogers A & Castro LJ (1981). Model Migration Schedules. 
IIASA Research Report. IIASA, Laxenburg, Austria: RR-81-030 
AVAILABLE ONLINE: http://pure.iiasa.ac.at/id/eprint/1543/

-----
SOME NOTES: I just used very broad possible parameter bounds to fit all to, and included all parameters 
(no matter overfitting etc), but ~fun to see/think about. 
All parameters/ranges I used are as given in InputParametersOrParameterRanges.R. 
It's very slow, and I'm thinking it could probably use some apply()'s and cleanup, and warning messages 
(esp for when bounds are not wide enough), plus review for problems/errors, but ~neat/fun in any case. 
Copies of the code with some application of and comparison to R's nls() and lm() functions, 
and to more ~plain Monte Carlo, are available here:
https://github.com/AppliedDemogToolbox/Hunsinger_SPMMSRCode/tree/master/FittingComparisons. 
-Eddie Hunsinger, September 2018 (updated December 2018)

-----
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
</pre>
