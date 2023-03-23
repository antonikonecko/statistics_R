##################### plot() #####################

#przykład 1.1 plot()

#wykorzystaj dostępne dane: cars z pakietu datasets(), a następnie wyselekcjonuj 10 pierwszych rekordów
wybraneAuta <- head(cars, 10)

wybraneAuta
plot(wybraneAuta)


#przykład 1.2 plot() z dodatkowymi arg.

plot(x = wybraneAuta$speed, y = wybraneAuta$dist,
  xlab = "szybkość", ylab = "dystans",
  main = "Wykres szybkość vs dystans",
  col.main = "blue",
  sub = "dane cars z pakietu datasets",
  col = "blue", #zmiana koloru punktów, funkcja colors() żeby zobaczyć dostępne kolory
  pch = 16 #kształt punktów, zobacz: ?pch
)


#col.main - dla zmiany koloru tytułu
#col.sub - dla zmiany koloru podtytułu
#col.lab - dla zmiany koloru etykiet osi


#przykład 1.3 plot() i argument bg

plot(x = wybraneAuta$speed, y = wybraneAuta$dist,
  xlab = "szybkość", ylab = "dystans",
  main = "Wykres szybkość vs dystans",
  col.main = "blue",
  sub = "dane cars z pakietu datasets",
  col = "blue", #zmiana koloru punktów
  pch = 24, #kształt punktów, zobacz ?pch, pch = 21:25 umożliwiają użycie tła dla symbolu
  bg = "skyblue"
)


#przykład 1.4 argument type

plot(wybraneAuta, type="l")


#przykład 1.5 argument lty i lwd (?par)

plot(wybraneAuta, type="h", lwd = 10) #szerokość linii
plot(wybraneAuta, type="l", lty = 2) #typ linii


#przykład 1.6 argument bty

plot(wybraneAuta, type = "b", bty = "o") #domyślne pudełko
plot(wybraneAuta, type = "b", bty = "n") #brak kształtu, same osie


#przykład 1.7 funkcja axis()

plot(wybraneAuta, type = "b") 
axis(1, col = "gold", lty = 2, lwd = 0.5)  #lty - typ linii, lwd - grubość linii,
axis(2, lty = 2, lwd = 3, col.axis = "green") # col.axis - kolor wartości na osi


#przykład 1.8 argument xlim i ylim - skala na osiach

plot(wybraneAuta, type = "b", xlim = c(0,15), ylim = c(0,40))
axis(1, col = "gold", lty = 2, lwd = 0.5)  
axis(2, lty = 2, lwd = 3, col.axis = "green") 


#przykład 1.9 text()

plot(x = wybraneAuta$speed, y = wybraneAuta$dist,
  xlab = "szybkość", ylab = "dystans",
  main = "Wykres szybkość vs dystans",
  col = "blue", 
  pch = 16 
)
text(wybraneAuta$speed, wybraneAuta$dist, 
  paste("car", c(1:10)), 
  cex = 0.5, 
  pos = 1, # 1 - poniżej, 2 - po lewej, 3 - powyżej, 4 - po prawej
  col = "red"
)


#przykład 1.10 abline()

plot(x = wybraneAuta$speed, y = wybraneAuta$dist,
  xlab = "szybkość", ylab = "dystans",
  main = "Wykres szybkość vs dystans",
  col = "blue", 
  pch = 16 
)
abline(h = mean(wybraneAuta$dist), col="red") # v - wertykalnie, h – horyzontalnie

mean(wybraneAuta$dist)


#przykład 1.11 points() + with()

#wykorzystaj wcześniej przygotowane dane i wyselekcjonuj auta z szybkością większą niż 9
wybraneAuta
najszybszeAuta <- with(wybraneAuta, wybraneAuta[speed > 9, ])
najszybszeAuta

plot(wybraneAuta,
  xlab = "szybkość",
  ylab = "dystans",
  main = "Wykres szybkości",
  col = "blue", 
  pch = 20 
)
points(najszybszeAuta, col = "red", pch = 17)
abline(h = mean(wybraneAuta$speed), col="red") # v - wertykalnie, h – horyzontalnie
text(6, 10, "średnia szybkość", col = "red") #6,9 to współrzędne


#przykład 1.12 points() + w

#wykorzystaj wcześniej przygotowane dane i wyselekcjonuj auta z szybkością większą niż 9
wybraneAuta
wybraneAuta$speed
najszybsze <- wybraneAuta$speed[wybraneAuta$speed>9]
najszybsze
idNajszybsze<-which(wybraneAuta$speed>9)
idNajszybsze

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


#przykład 1.13 argument cex i pos z wartościami 1:4

x <- seq(0.5, 3, 0.5)
y <- rep(1, length(x))

plot(x, y, main = "Efekt zmiany czcionki")
text(x, y, pos = 1, labels = x, cex = x)


#przykład 1.14 argument cex i pos ze współrzędnymi 

plot(x, y, main = "Efekt zmiany czcionki", cex.main = 1.5)
text(x, y+0.1, labels = x, cex = x)



##################### boxplot()  i attach() #####################

#przykład 2.1 boxplot() dla poj. kolumny

#Utwórz przykładową ramkę danych - wiek przypadkowych osób
wiekPrzypadkowychLudzi <- data.frame(
  kobieta = c(25,27,30,27,35), 
  mezczyzna = c(40,35,29,50,27), 
  dziecko = c(6,7,10,15,8)
)
wiekPrzypadkowychLudzi

boxplot(wiekPrzypadkowychLudzi$kobieta)
abline(h = mean(wiekPrzypadkowychLudzi$kobieta), col="red")
text(1.3, 29.5, "średnia", col = "red") 
abline(h = median(wiekPrzypadkowychLudzi$kobieta), col="blue")
text(1.3, 27.5, "mediana", col = "blue")


#przykład 2.2 boxplot() z grupowaniem

#Utwórz przykładową ramkę danych
wiekPrzypadkowychLudzi2 <- data.frame(
  grupa = c("kobieta", "mezczyzna", "dziecko"),
  wiek = c(27,30,5,25,35,10,29,29,7,40,42,15)
)
wiekPrzypadkowychLudzi2

boxplot(wiekPrzypadkowychLudzi2$wiek ~ wiekPrzypadkowychLudzi2$grupa,
  xlab = "grupa",
  ylab = "wiek"
)


#przykład 2.3 boxplot() z grupowaniem + attach()

attach(wiekPrzypadkowychLudzi2)
wiek
boxplot(wiek ~ grupa, data = wiekPrzypadkowychLudzi2)


#przykład 2.4 boxplot() z kolorowaniem

boxplot(wiek ~ grupa, data = wiekPrzypadkowychLudzi2,
  border = c("#99cc00", "#660099", "#0047b3")
)

boxplot(wiek ~ grupa, data = wiekPrzypadkowychLudzi2,
  col = c("#99cc00", "#660099", "#0047b3")
)

boxplot(wiek ~ grupa, data = wiekPrzypadkowychLudzi2,
        col = c("green", "purple", "blue")
)


#przykład 2.5 par() i mfrow

par(mfrow=c(1, 3)) #określono 3 wykresy w jednym wierszu
boxplot(wiekPrzypadkowychLudzi$kobieta)
boxplot(wiekPrzypadkowychLudzi$mezczyzna)
boxplot(wiekPrzypadkowychLudzi$dziecko)
boxplot(wiekPrzypadkowychLudzi$dziecko)
dev.off() 


#par() vs dev.off()

wieleW1Oknie <- par(mfrow=c(1, 2)) #określono 3 wykresy w jednym wierszu
boxplot(wiekPrzypadkowychLudzi$kobieta)
boxplot(wiekPrzypadkowychLudzi$mezczyzna)
par(wieleW1Oknie) #lub dev.off()
boxplot(wiekPrzypadkowychLudzi$dziecko)
 

#przykład 2.6 ggboxplot, pakiet ggpubr
install.packages("ggpubr")
library("ggpubr")

ggboxplot(
  wiekPrzypadkowychLudzi2, x = "grupa", y = "wiek", 
  color = "grupa", palette = c("#99cc00", "#660099", "#0047b3"),
  order = c("dziecko", "kobieta", "mezczyzna"),
)




##################### scatterplot() #####################

#przykład 3.1 scatterplot()

install.packages("car")
library("car")

#utwórz dodatkową kolumnę do danych cars
wszystkieAuta <- cars
wszystkieAuta
mode(wszystkieAuta)
wszystkieAuta[["auto"]] <- c("BMW", "AUDI")
wszystkieAuta

attach(wszystkieAuta)
scatterplot(dist ~ speed, data = wszystkieAuta, grid = FALSE)


#przykład 3.2 scatterplot() z grupami

scatterplot(dist ~ speed | auto, data = wszystkieAuta)



##################### dotchar() i table() #####################

#przykład 4.1 dotchar() i funkcja table()

#utwórz dodatkowe dane
statystykiZawodow <- data.frame(
  plec = rep(c("kobieta", "mezczyzna"), each = 10),
  zawod = sample(c("lekarz", "prawnik", "strażak", "nauczyciel"), 20, replace = TRUE),
  wiek = sample(c(27:60), 20, replace = TRUE)
)
statystykiZawodow
attach(statystykiZawodow)

wybraneDane <- table(zawod, plec)
wybraneDane

dotchart(wybraneDane)


#przykład 4.2 dotchart() i dodatkowe argumenty dla ustawienia kolorów

dotchart(wybraneDane, 
  pch = 19,
  color="skyblue", #kolor punktów na osi
  gcolor="mediumblue", #kolor grup
  lcolor="darkblue", lwd=3 #kolor linii
)



##################### stripchart() alternatywa dla boxplot() #####################

#przykład 5.1 stripchart()

stripchart(wiekPrzypadkowychLudzi2$wiek ~ wiekPrzypadkowychLudzi2$grupa, 
  data = wiekPrzypadkowychLudzi2, pch = 16
)


#przykład 5.2 stripchart() vertical + attach()

attach(wiekPrzypadkowychLudzi2)
stripchart(wiek ~ grupa, data = wiekPrzypadkowychLudzi2, pch = 16, vertical = TRUE) 


#przykład 5.3 stripchart() z kolorem

stripchart(wiek ~ grupa, data = wiekPrzypadkowychLudzi2, vertical = TRUE,
  col = c("lightblue", "mediumblue", "darkblue"),
  pch = c(15, 17, 19)
)


##################### pie() #####################

#przykład 6.1 – pie()

#utwórz przykładowe dane
pewneStatystyki <- data.frame(
  grupa = c("lubi czekoladę", "nie lubi czekolady", "brak opinii"),
  licznosc = c(86,30,9)
)
pewneStatystyki

pie(pewneStatystyki$licznosc, labels = pewneStatystyki$grupa)


#przykład 6.2 – pie() i heat.colors()

pie(pewneStatystyki$licznosc, 
  main = "Jak bardzo lubimy czekoladę!",
  labels = c("lubi czekoladę", "nie lubi czekolady", "nie mam zdania"), 
  col=heat.colors(3)
)


#przykład 6.3 pie() i legend()

pie(pewneStatystyki$licznosc, 
  radius = 0.6,
  main = "Jak bardzo lubimy czekoladę!",
  labels = paste("liczba osób: ", pewneStatystyki$licznosc), 
  col = c("#99cc00", "#660099", "#0047b3")
)
legend("topright", 
  cex = 0.6,
  c("osoby lubiące czkoladę", "osoby nie lubiące czkolady", "osoby bez zdania"), 
  fill = c("#99cc00", "#660099", "#0047b3"),
  title = "legenda"
)



##################### barplot() #####################

#przykład 7.1 barplot() domyślnie

barplot(pewneStatystyki$licznosc)


#przykład 7.2 barplot() horyzontalnie

barplot(pewneStatystyki$licznosc, horiz = TRUE) #wersja horyzonlana wykresu słupkowego


#przykład 7.3 barplot() i names.arg

barplot(pewneStatystyki$licznosc, 
  names.arg = pewneStatystyki$grupa,
  col = "lightpink",
  border = "red"
)


#przykład 7.4 barplot(), names.arg i kolory

barplot(pewneStatystyki$licznosc, 
  main = "Nastawienie do czekolady",
  names.arg = c("lubi", "nie lubi", "brak opinii"),
  col = c("lightpink", "lightblue", "lightgreen"),
  border = c("red", "blue", "darkgreen")
)


#przykład 7.5 barplot() i funkcja legend()

barplot(pewneStatystyki$licznosc, 
  main = "Nastawienie do czekolady",
  col = c("lightpink", "lightblue", "lightgreen"),
  border = c("red", "blue", "darkgreen")
)
legend("topright",
  legend = c("lubi", "nie lubi", "brak opinii"), 
  fill = c("lightpink", "lightblue", "lightgreen"),
  title = "Legenda:"
)


#przykład 7.6 barplot() i argument legend

barplot(pewneStatystyki$licznosc, 
  main = "Nastawienie do czekolady",
  col = c("lightpink", "lightblue", "lightgreen"),
  border = c("red", "blue", "darkgreen"),
  legend = c("lubi", "nie lubi", "brak opinii"),
  names.arg = c("lubi", "nie lubi", "brak opinii")
)



##################### hist() #####################

#przykład 8.1 - hist()

#utwórz zbiór losowych ocen
oceny <- sample(c(2,3,3.5,4,4.5,5), 100, replace = TRUE)
head(oceny, 10)
oceny 

hist(oceny, col = "skyblue")


##################### zapisywanie #####################

#przykład 9.1 – zapisywanie wykresu jako .pdf

pdf("Wykres szybkość vs dystans.pdf")
  plot(x = wybraneAuta$speed, y = wybraneAuta$dist,
  xlab = "szybkość", ylab = "dystans",
  main = "Wykres szybkość vs dystans",
  col = "blue", #zmiana koloru punktów, funkcja colors() żeby zobaczyć dostępne kolory
  pch = 16 #kształt punktów, zobacz ?pch
)
dev.off()


#przykład 9.2 – zapisywanie wykresu jako .jpg

jpeg("Wykres szybkość vs dystans.jpg", width = 600, height = 400)
  plot(x = wybraneAuta$speed, y = wybraneAuta$dist,
  xlab = "szybkość", ylab = "dystans",
  main = "Wykres szybkość vs dystans",
  col = "blue", #zmiana koloru punktów, funkcja colors() żeby zobaczyć dostępne kolory
  pch = 16 #kształt punktów, zobacz ?pch
)
dev.off()

