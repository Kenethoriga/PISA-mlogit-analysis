* Check current working directory
pwd

* Load the dataset
use "PISA 2018 teachers(1).dta", clear

* Describe the dataset to see the structure and variables
describe

* Display variable names and labels
foreach var of varlist _all {
    display "`var': `: variable label `var''"
}

* Start logging to save the output
log using "output.log", text replace

* Run the multinomial logit model
mlogit TC045Q04NA TC208Q03HA TC001Q01NA TC020Q03NA TCEDUSHORT

* Install outreg2 if it is not already installed (only needed once)
ssc install outreg2

* Export results to an Excel file in a clean table format
outreg2 using "results.xlsx", excel replace

* Close the log file
log close
