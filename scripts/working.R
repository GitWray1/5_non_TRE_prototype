
df <- readr::read_csv(here::here("data/NABCOP_audit_data_wide.csv"),
                      col_types = "cccccccc",
                      na = c(""))

test <- df %>% 
  filter(audit_year == "2022")

df %>% 
  plot_ly() %>% 
  add_bars(data = test, 
           x = ~reorder(ods_trust_cd, -tda_strict_perc),
           y = ~tda_strict_perc,
           #type = "bar",
           hoverinfo = "text",
           hovertext = paste0("<b>Name:</b> ", test$ods_trust_nm,
                              "<br><b>ODS code:</b> ", test$ods_trust_cd,
                              "<br><b>Percent who recieved a TDA:</b> ", test$tda_strict_perc),
           showlegend = FALSE,
           color = I("#228096"),
           alpha = 0.6) %>% 
  add_lines(data = test2, 
            x = ~reorder(ods_trust_cd, -tda_strict_perc),
            y = ~tda_strict_perc,
            hoverinfo = "text",
            hovertext = paste0("<br><b>Percent who recieved a TDA:</b> ", test$tda_strict_perc),
            showlegend = FALSE,
            color = I("#00436c")) %>% 
  layout(yaxis = list(title = "Percentage of women (%)",
                      ticksuffix = "%",
                      rangemode = "tozero",
                      ticklabelstep = 10),
         xaxis = list(title = list(text = "NHS Organisation",
                                   font = list(size=12),
                                   standoff = 10),
                      showticklabels = FALSE,
                      ticks = "outside",
                      nticks = length(test$tda_strict_perc)),
         hovermode = "x unified",
         title = list(text = stringr::str_wrap("Percentage of women with non-screen detected early invasive breast cancer 
                                                that recieved a triple diagnostic assessment in a single visit, by 
                                                diagnosing NHS organisation and age at diagnosis", width = 100),
                      font = list(size = 12),
                      x = 0.05,
                      yanchor = "top"),
         margin = list(t = 50)) %>% 
  config(displaylogo = FALSE,
         modeBarButtonsToRemove = c("zoom", "pan", "select", "lasso"))
  
  
