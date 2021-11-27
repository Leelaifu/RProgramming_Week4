rm(list = setdiff(ls(), lsf.str()))
setwd("C:/Users/88695/Documents/110-1/Coursera/R_programming/week4/Assignment")
getwd()

#1.Plot the 30-day mortality rates for heart attack
  #Read the outcome data
   outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
   head(outcome)
  #make a simple histogram of the 30-day death rates from heart attack (column 11)
   outcome[, 11] <- as.numeric(outcome[, 11])## You may get a warning about NAs being introduced; that is okay
   hist(outcome[, 11])
  
#2.Finding the best hospital in a state
   best<- function(state, outcome) {
       ## Read outcome data
       data <- read.csv("outcome-of-care-measures.csv")
       
       ## Check that state and outcome are valid
       states <- levels(data[, 7])[data[, 7]]
       state_flag <- FALSE
       for (i in 1:length(states)) {
           if (state == states[i]) {
               state_flag <- TRUE
           }
       }
       if (!state_flag) {
           stop ("invalid state")
       } 
       if (!((outcome == "heart attack") | (outcome == "heart failure")
             | (outcome == "pneumonia"))) {
           stop ("invalid outcome")
       }
       
       ## Return hospital name in that state with lowest 30-day death rate
       col <- if (outcome == "heart attack") {
           11
       } else if (outcome == "heart failure") {
           17
       } else {
           23
       }
       
       data[, col] <- suppressWarnings(as.numeric(levels(data[, col])[data[, col]]))
       data[, 2] <- as.character(data[, 2])
       statedata <- data[grep(state, data$State), ]
       orderdata <- statedata[order(statedata[, col], statedata[, 2], na.last = NA), ]
       orderdata[1, 2]
   }
   
#3.Ranking hospitals by outcome in a state
   rankhospital<- function(state, outcome, num = "best")
   {
       outcome1 <- read.csv("outcome-of-care-measures.csv",
                            colClasses = "character")
       if(!any(state == outcome1$State)){
           stop("invalid state")}
       else if((outcome %in% c("heart attack", "heart failure",
                               "pneumonia")) == FALSE) {
           stop(print("invalid outcome"))
       }
       outcome2 <- subset(outcome1, State == state)
       if (outcome == "heart attack") {
           colnum <- 11
       }
       else if (outcome == "heart failure") {
           colnum <- 17
       }
       else {
           colnum <- 23
       }
       outcome2[ ,colnum] <- as.numeric(outcome2[ ,colnum])
       outcome3 <- outcome2[order(outcome2[ ,colnum],outcome2[,2]), ]
       outcome3 <- outcome3[(!is.na(outcome3[ ,colnum])),]
       if(num == "best"){
           num <- 1
       }            
       else if (num == "worst"){
           num <- nrow(outcome3)
       }      
       return(outcome3[num,2])
   }   
   
#4.Ranking hospitals in all states
   rankall <- function(outcome, num = "best") {
       ## Read outcome data
       data <- read.csv("outcome-of-care-measures.csv")
       
       ## Check that outcome is valid
       if (!((outcome == "heart attack") | (outcome == "heart failure")
             | (outcome == "pneumonia"))) {
           stop ("invalid outcome")
       }
       
       ## For each state, find the hospital of the given rank
       col <- if (outcome == "heart attack") {
           11
       } else if (outcome == "heart failure") {
           17
       } else {
           23
       }
       
       data[, col] <- suppressWarnings(as.numeric(levels(data[, col])[data[, col]]))
       data[, 2] <- as.character(data[, 2])
       
       # Generate an empty vector that will be filled later, row by row, to 
       # generate the final output.
       output <- vector()
       
       states <- levels(data[, 7])
       
       for(i in 1:length(states)) {
           statedata <- data[grep(states[i], data$State), ]
           orderdata <- statedata[order(statedata[, col], statedata[, 2], 
                                        na.last = NA), ]
           hospital <- if(num == "best") {
               orderdata[1, 2]
           } else if(num == "worst") {
               orderdata[nrow(orderdata), 2]
           } else{
               orderdata[num, 2]
           }
           output <- append(output, c(hospital, states[i]))
       }
       
       ## Return a data frame with the hospital names and the (abbreviated) 
       ## state name
       output <- as.data.frame(matrix(output, length(states), 2, byrow = TRUE))
       colnames(output) <- c("hospital", "state")
       rownames(output) <- states
       
       output
   }
   
   
   
   
   
   