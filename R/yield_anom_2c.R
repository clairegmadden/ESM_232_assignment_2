

# to calculate yield anomaly with 2c warming


yield_anom_2c = function(tn1 = -0.015, tn2 = -0.0046, p1 = -0.07, p2 = 0.0043, int = 0.28, clim_data) {
  
  clim_monthly <- clim_data %>% 
    group_by(month, year) %>% 
    summarize(meantmin_2c = mean(tmin_c+2),
              precip=mean(precip)) %>%  #maybe check if this is supposed to be mean rather than sum (slack notes)  
    ungroup()
  
  clim_monthly$precip = ifelse(clim_monthly$precip < 0, return("Precipitation cannot be less than zero"), clim_monthly$precip)
  
  precip_2 <- clim_monthly %>% 
    select(-meantmin_2c) %>% 
    filter(month == 2)
  
  temp_1 <- clim_monthly %>% 
    select(-precip) %>% 
    filter(month == 1)

  
  df_anom_2c <- data.frame(year = temp_1$year, y_anom_2c = NA) 
  
  
  for(i in 1:nrow(df_anom_2c)) {
    
    df_anom_2c$y_anom_2c[i] <- tn1*temp_1$meantmin_2c[i] + 
      tn2*temp_1$meantmin_2c[i]^2 + 
      p1*precip_2$precip[i] + 
      p2*precip_2$precip[i]^2 + 
      int
    
  }

  y_anom_yr_2c <- dplyr::select(df_anom_2c, c(year,y_anom_2c))
  
  min_anom_2c <- min(y_anom_yr_2c$y_anom_2c)
  max_anom_2c <- max(y_anom_yr_2c$y_anom_2c)
  
  return(list(y_anom_yr_2c, min_anom_2c, max_anom_2c))
  
}

