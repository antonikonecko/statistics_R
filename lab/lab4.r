wybraneAuta <- head(cars, 10)
#zad 4


plot(x = wybraneAuta$speed, y = wybraneAuta$dist,
     xlab = "szybkość", ylab = "dystans",
     main = "Wykres szybkość vs dystans",
     col = "blue", 
     pch = 16 
)
abline(h = mean(wybraneAuta$dist), col="red") # v - wertykalnie, h – horyzontalnie

abline(v = mean(wybraneAuta$speed), col="green", lty = 2, lwd = 2)


#zad5


wybraneAuta$speed
najszybsze <- wybraneAuta$speed[wybraneAuta$speed>9]
najszybsze
idNajszybsze<-which(wybraneAuta$speed>9)
idNajszybsze

#
najwolniejsze <- wybraneAuta$speed[wybraneAuta$speed<6]
najwolniejsze
idNajwolniejsze<-which(wybraneAuta$speed<6)
idNajwolniejsze
#

plot(wybraneAuta$speed,
  xlab = "numer auta",
  ylab = "szybkość",
  main = "Wykres szybkości",
  col = "blue", 
  pch = 20 
)
points(idNajszybsze, najszybsze, col = "red", pch = 17)
abline(h = mean(wybraneAuta$speed), col="red") # v - wertykalnie, h – horyzontalnie
text(2.5, 8.3, "średnia szybkość", col = "red")
#
points(idNajwolniejsze, najwolniejsze, col = "violet", pch = 22)
#


wiekPrzypadkowychLudzi2 <- data.frame(
  grupa = c("kobieta", "mezczyzna", "dziecko"),
  wiek = c(27,30,5,25,35,10,29,29,7,40,42,15)
)
wiekPrzypadkowychLudzi2


#zad6
boxplot(wiek ~ grupa, data = wiekPrzypadkowychLudzi2, horizontal = TRUE)


#zad7
attach(wiekPrzypadkowychLudzi2)

par(mfrow = c(1,2))
boxplot(wiek ~ grupa, data = wiekPrzypadkowychLudzi2)
stripchart(wiek ~ grupa, data = wiekPrzypadkowychLudzi2)
dev.off()
############################


pewneStatystyki <- data.frame(
  grupa = c("lubi czekolade", "nie lubi czekolady", "brak opinii"),
  licznosc = c(86,30,9)
)

#zad8
install.packages("plotrix")
library(plotrix)


pie3D(pewneStatystyki$licznosc,labels=pewneStatystyki$grupa, main="Jak bardzo lubimy czekolade!")

#zad9
pie(pewneStatystyki$licznosc, 
    radius = 0.6,
    main = "Jak bardzo lubimy czekolade!",
    labels = paste(pewneStatystyki$licznosc/sum(pewneStatystyki$licznosc) * 100, "%" ),
    col = c("#99cc00", "#660099", "#0047b3")
)

legend("topright", cex = 0.6, 
    c("osoby lubiace czkolade", "osoby nie lubiace czekolady", "osoby bez zdania"), 
    fill = c("#99cc00", "#660099", "#0047b3"), title = "legenda"
)