# Future study. how to ask user to enter a result
}
selected_Outcome <- function()
{
        names(outcome_tbl_selected)
        n <- readline(prompt="Enter an integer: ")
        n <- as.integer(n)
        if (is.na(n)){
                n <- readinteger()
        }
        return(n)
}
