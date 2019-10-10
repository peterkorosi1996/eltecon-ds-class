library(data.table)
library(ggplot2)
library(magrittr)

crime <- fread("eltecon-ds-class/data/crime.csv")

shooting <- crime[SHOOTING == "Y"]
freq_crimes <- names(sort(table(shooting$OFFENSE_CODE_GROUP), decreasing=TRUE)[1:5])

crime_sorted <- shooting[OFFENSE_CODE_GROUP %in% freq_crimes]

crimeplot <- crime_sorted[, .N, c("HOUR", "OFFENSE_CODE_GROUP")]

ggplot(crimeplot, aes(x= HOUR, y = N)) + geom_col(width = 0.5, fill = "red") +
  facet_wrap(~OFFENSE_CODE_GROUP) + 
  xlab("Hours") + ylab("No. of crimes") +
  labs(title = "The 5 most common shooting crimes")