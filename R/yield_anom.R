

# set up function to calculate almond yield anomaly

# define variables and parameters
# tn is minumum temperature (t) of the month(n)
# tx is the maximum temperature (t) of the month(x)
# p is precip

#add error checking for year, month etc how things are labled in toehr climate data 

# function in paper : Y = -0.015tn,2 - 0.0046t(^2)n,2 - 0.07P1 + 0.0043P(^2)1 +0.28


yield_anom = function(tn1 = -0.015, tn2 = -0.0046, p1 = -0.07, p2 = 0.0043, int = 0.28, clim_data){
  
  clim_monthly <- clim_data %>% 
  group_by(month, year) %>% 
  summarize(meantmax = mean(tmin_c), precip=sum(precip)) #maybe check if this is supposed to be mean rather than sum (slack notes)  
  
  precip_2 <- clim_monthly %>% 
  select(!meantmax) %>% 
  filter(month == 2)
  
  temp_1 <- clim_monthly %>% 
  select(!precip) %>% 
  filter(month == 1)
    
  df_anom <- data.frame(year = temp_1$year, y_anom = NA) 
  
  for(i in 1:nrow(df_anom)) {
    
  df_anom$y_anom[i] <- tn1*temp_1$meantmax[i] + tn2*temp_1$meantmax^2[i] + p1*precip_2$precip[i] + p2*precip_2$precip^2[i] + int
    
  }
  
  
  return((df_anom))
  
}




# solve for yield
yield_anom = (tn1*min_month_temp) + (tn2*(min_month_temp^2)) + (p1*precip) + (p2*(precip^2))+ int

# solve for max
max = 
  
  # solve for min 
  min = 
  


# to plot yield anom, you can make the first part of the output into a dataframe to plot


