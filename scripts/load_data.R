
library(dplyr)

df <- readr::read_csv("data/NABCOP_audit_data.csv",
                      col_types = "cccccccccc",
                      na = c("NA", "-", "NP", "")) 
# Check what to do with each of the above - should a "-" be a 0?


df <- df %>% 
  mutate(n_eibc_screen_pos = as.numeric(recode(n_eibc_screen_pos, "<10" = "10")),
         n_eibc_not_screen_pos = as.numeric(recode(n_eibc_not_screen_pos, "<10" = "10")),
         tda_strict_perc = as.numeric(recode(tda_strict_perc, "<10" = "10"))) # do we need this line, any <10 present?


df <- readr::read_csv("data/NABCOP_audit_data.csv",
                            col_types = "cccccccccc",
                            na = c("NA", "NP", "")) %>% 
        mutate(n_eibc_screen_pos = recode(n_eibc_screen_pos, "-" = "0"),
               n_eibc_screen_pos = as.numeric(recode(n_eibc_screen_pos, "<10" = "10")),
               n_eibc_not_screen_pos = as.numeric(recode(n_eibc_not_screen_pos, "<10" = "10")),
               tda_strict_perc = as.numeric(recode(tda_strict_perc, "<10" = "10")))
