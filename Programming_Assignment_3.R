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
 outcome_tbl_strip <- select(outcome_tbl, )
 # selecting outcome. better than just variable placement
 outcome_tbl_selected <-  select(outcome_tbl, c(2,7), contains("Heart.Failure"),
                                 starts_with ("Comparison", ignore.case = FALSE ))

## Start of Function
outcomeSelection  <- function(Outcome = "Pneumonia"){

        outcome_tbl_selected <-  select(outcome_tbl, c(2,7), contains(Outcome),
                                        -starts_with("Comparison"),
                                        -starts_with("Footnote"))
        print(outcome_tbl_selected)
}


