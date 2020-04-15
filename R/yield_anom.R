

# set up function to calculate almond yield anomaly

# define variables and parameters
# tn is minumum temperature (t) of the month(n)
# tx is the maximum temperature (t) of the month(x)
# p is precip

# function in paper : Y = -0.015tn,2 - 0.0046t(^2)n,2 - 0.07P1 + 0.0043P(^2)1 +0.28


yield_anom = function(tn1 = -0.015, tn2 = -0.0046, p1 = -0.07, p2 = 0.0043, int = 0.28, min_month_temp, precip){
  
  # solve for yield
  yield_anom = (tn1*min_month_temp) + (tn2*(min_month_temp^2)) + (p1*precip) + (p2*(precip^2))+ int
  
  
  # solve for max
  max = 
  
  # solve for min 
  min = 
  
  
  return(list(yield_anom, max, min))
  
}



# to plot yield anom, you can make the first part of the output into a dataframe to plot


