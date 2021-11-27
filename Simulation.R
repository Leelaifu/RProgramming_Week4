#Generating Random Numbers From a Linear 
 #simulate the following linear model " y = £]0 + £]1x + £` ", where £]0 = 0.5 and £]1 = 2:
  set.seed(20)
  x <- rnorm(100)
  e <- rnorm(100, 0, 2)
  y <- 0.5 + 2 * x + e
  summary(y)
  # Min. 1st Qu. Median
  # -6.4080 -1.5400 0.6789 0.6893 2.9300 6.5050
  plot(x, y)
  
 #If x is binary:
  set.seed(10)
  x <- rbinom(100, 1, 0.5)
  e <- rnorm(100, 0, 2)
  y <- 0.5 + 2 * x + e
  summary(y)
  # Min. 1st Qu. Median
  # -3.4940 -0.1409 1.5770 1.4320 2.8400 6.9410
  plot(x, y)
  
 #simulate from a Poisson model "Poisson(£g)", log £g = £]0 + £]1x  where £]0 = 0.5 and £]1 = 0.3.
  set.seed(1)
  x <- rnorm(100)
  log.mu <- 0.5 + 0.3 * x
  y <- rpois(100, exp(log.mu))
  summary(y)
  # Min. 1st Qu. Median Mean 3rd Qu. Max.
  # 0.00 1.00 1.00 1.55 2.00 6.00
  plot(x, y)
  
 #sample function draws randomly from a specified set of (scalar) objects
  set.seed(1)
  sample(1:10, 4)
  sample(1:10, 4)
  sample(letters, 5)
  sample(1:10) ## permutation
  sample(1:10)
  sample(1:10, replace = TRUE) ## Sample w/replacement
  
  
  
  
  
  