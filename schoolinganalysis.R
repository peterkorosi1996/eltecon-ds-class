library(data.table)
library(ggplot2)
schooling <- fread("data/cornwell.csv")
summary(schooling)

# iskolázottság és munkatapasztalat összefüggése:
ggplot(schooling, aes(ED, EXP)) + geom_point()

# iskolázottság és logaritmált bér összefüggése:
ggplot(schooling, aes(ED, LWAGE)) + geom_point()
#elég jól látszik, hogy a nagyobb iskolázottság növeli a jövőbeli bért

# a logaritmált bérből vegyük ki az outliereket:
# (igazából ezek is fontos adatok, de nem tudtam jobbat kitalálni)
clearIrrelevantLWage <- function(schooling) {
  schooling[LWAGE > 8.2 | LWAGE < 5.2, LWAGE := NA]
}
clearIrrelevantLWage(schooling)
ggplot(schooling, aes(ED, LWAGE)) + geom_point()
# így kicsit tisztult a kép

longdata <- melt(schooling, measure.vars = c("EXP", "LWAGE", "BLK"))
ggplot(longdata, aes(value)) + geom_histogram(bins = 10) + 
  facet_wrap(~ variable, scales = "free_x")

#logaritmált bér a munkatapasztalat függvényében,
# a baloldali ábrán a fehér, a jobb oldalin a fekete munkások bére:
ggplot(schooling, aes(EXP,LWAGE)) + geom_point() + facet_wrap(~ as.factor(BLK))

# logaritmált bér az iskolázottság függvényében, baloldalon északi államok lakói,
# jobb oldalon déli államok lakói:
ggplot(schooling, aes(ED,LWAGE)) + geom_boxplot() + facet_wrap(~ as.factor(SOUTH))
