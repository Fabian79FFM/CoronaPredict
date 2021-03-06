library(readr)
full_data <- read_csv("full_data.csv", col_types = cols(date = col_date(format = "%Y-%m-%d")))
full_data$Reproduktion <- sapply(full_data[,"total_cases"], function(x) x/c(NA,head(x,-1)))
full_data$AenderungReproduktion <- sapply(full_data[,"Reproduktion"], function(x) x/c(NA,NA,NA, head(x,-3)))
teil_daten <- full_data %>% filter(total_cases > 10000)
p <- teil_daten %>% ggplot(aes(date, Reproduktion, colour = location))+geom_line()
ggplotly(p)
p <- teil_daten %>% ggplot(aes(date, AenderungReproduktion, colour = location))+geom_line()
ggplotly(p)
