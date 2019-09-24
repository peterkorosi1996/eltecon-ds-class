library(data.table)
library(ggplot2)
schooling <- fread("data/cornwell.csv")
summary(schooling)

# iskolázottság és munkatapasztalat összefüggése:
ggplot(schooling, aes(ED, EXP)) + geom_point()
# iskolázottság és logaritmált bér összefüggése:
ggplot(schooling, aes(ED, LWAGE)) + geom_point()
# a logaritmált bérből vegyük ki az outliereket:
# (igazából ezek is fontos adatok, de nem tudtam jobbat kitalálni)
clearIrrelevantLWage <- function(schooling) {
  schooling[LWAGE > 8.2 | LWAGE < 5.2, LWAGE := NA]
}
clearIrrelevantLWage(schooling)
ggplot(schooling, aes(ED, LWAGE)) + geom_point()
# így kicsit tisztult a kép
