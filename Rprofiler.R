#Profiling is a systematic way to examine how much time is spend in different parts of a program.
  # General Principles of Optimization:
   #Design first, then optimize
   #Remember: Premature optimization is the root of all evil
   #Measure (collect data), don¡¦t guess.

 #1.system.time(expr, gcFirst = TRUE), CPU Time Used
    system.time(readLines("https://www.ntu.edu.tw/")) ##Elapsed time > user time
  
   #Timing Longer Expressions 
    system.time({
        n <- 1000
        r <- numeric(n)
        for (i in 1:n) {
            x <- rnorm(n)
            r[i] <- mean(x)
        }
     })
 #2.Rprof(), runs the profiler for performance of analysis of R code.
     
 #3.summaryRprof(), summarizes the output of Rprof(). 


