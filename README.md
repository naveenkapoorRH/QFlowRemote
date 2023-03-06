Time stamp: March 5 2023
Name: Naveen
**completed #1, #2 
In process: #3,
TBD: #4- #7**
# Changes:
## 1) Rules parsing from the parameters file have been changed in the sub flow for uploading params files
### 1.1) XLS Spreadsheet should look like this.
BALANCING ERROR CONDITION	UNIT TYPE	TOTAL	DETAIL 1	DETAIL 2
TRUCK_NUM_TOT != sum(TRUCK_WD_NUM,TRUCK_WOD_NUM)		TRUCK_NUM_TOT	TRUCK_WD_NUM	TRUCK_WOD_NUM
TRUCK_NUM_TOT != sum(TRUCK_WD_NUM,TRUCK_WOD_NUM)	KAU	TRUCK_NUM_TOT	TRUCK_WD_NUM	TRUCK_WOD_NUM

There are 14 columns in the spreadsheet. Add all DETAIL 1, DETAIL...14 and make it equal to an action like so:

[{TOTAL":"TRUCK_NUM_TOT"},{"SUM_DET":"TRUCK_WD_NUM + TRUCK_WOD_NUM"}]

## 2) csv column for actionString instead of FAILURE1 or FAILURE{#} its all converted to FAILURE for each row in the params csv file
ACTION	ACTIONSTRING
SET FAILURE FLAG	naics00 = naics
SET FAILURE FLAG	FAILED=1
SET FAILURE FLAG	FAILED=1

RULES are parsed and saved with new action items..


## 3) Check if the cb_flags are set properly and pass only those flow variables that have cb checked
## 4) Iterate with a timer on the reporting_ids
## 5) Test with facts files
## 6) Add Balance Module
## 7) Add router from http in and route by topic/switch to go to the correct flow








QFlow
=====
Time stamp: 3:37 Monday 27 Feb
QFlow Functionality: Managing Datasets, Parameters and Rules Flow Processing

### About

This project will be comprised of main and sub flows:

Main flows objective is to process parameter files (ie dynamic rules) and merge them with data that can
be passed via the ui components:
1) DATASETS - User can select from:
a) facts {}, factsArray[]:Define some criterion to pick data sets like level_type, or name, or id or matching ids: and it will return an array ofdatasets
b) addOnFacts{}: Datasets can be appended to a) above for additional data to force rules to pass/fail: addOnFacts
addOnFacts can be a spreadsheet 

2) RULES - Can be dynamic(csv import file of conditions) or/and rules by ruleType
a1) Import the parameters file and save the contents in a ui table
a2) Use backend to pass an array of csv data to convert them to rules. 
a3) Backend: Convert strings to arrays of rules and will return the original strings concatenated with if the condition and rule result could be computed
a4) Results are sent back to the ui table for parameters based rules: PBRs. 
a5) User may accept the rules interpretation from PBR above and if so merge datasets and rules

3) MERGE DATA & RULES:
a) Wait for 1 and 2 to finish
b) Take each row from 1 and rules from 2 and call QBES and get the Workflow ID.


4) Workflow:
a) Display each workflowIDs derived values, success or failure status, rules fired and count of rules valid and invalid
b) Get a ui Table for 4.a) to display the key values. Make an entry in the spad table that will assemble all the datasets outputs in one spad flow.





