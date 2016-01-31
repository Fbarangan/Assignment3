library(dplyr)
# Notes these are the columns needed   c(2,7,11:15,17:21,23:27,29:33,35:39,41:45)
#Validating State
validState <- function(StateID = c("KY")) {

        # if state ID is in the list of State ID in the state.abb
        # then save it as "validStateID
        if (StateID %in% state.abb) {
                validStateID <- StateID
                print(validStateID)
        }
        else{
                cat("Please enter a valid 2 letter State ID")

        }
}
# -End of function: validState
# Preparing the csv file
#
outcome <- read.csv("outcome-of-care-measures.csv")
# converting into tbl_df
# Extracting only columns needed
 outcome_tbl <- tbl_df(outcome)
 outcome_Sorted <- arrange(outcome_tbl,Hospital.Name)


## Start of Function
## Purpose of this function is to extract needed variable by users input
outcomeSelection  <- function(Outcome = "Pneumonia"){

        outcome_tbl_selected <-  select(outcome_Sorted, c(2,7), contains(Outcome),
                                        -starts_with("Comparison"),
                                        -starts_with("Footnote"))
        outcome_tbl_selected <<- outcome_tbl_selected
        names(outcome_tbl_selected)
         # temp .Dont run this by itself. will give "all"

                #temp
       # arrange_outcome_tbl_selected <- arrange(outcome_tbl_selected, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack) #
                # when Hospital name is prearranged, it is already ok when there is a tie
       # View(arrange_outcome_tbl_selected) # temp

}

## Order table
## need to figure out how to removed missing data select(outcome_tbl_selected,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure =="Not Available")
## summarise (filter(by_date),
##               med = median(dep_delay, na.rm = TRUE))
##

# How to give give user selection

