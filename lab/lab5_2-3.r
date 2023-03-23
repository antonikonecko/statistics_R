### zad2 ###
library(dplyr)
liczsrednia <-function(df){
  a <- df%>% mutate(srednia = rowMeans(df[,-1]))
  b <- a %>% mutate(maxsrednia = max(a$srednia))
  library(ggplot2)
  png("wykres.png", width = 1080, height = 720) 
  wykres <- ggplot(b, aes(x=imie, y=srednia, maxsrednia))+
    geom_point(color="black")+
    geom_hline(yintercept=max(b$maxsrednia), color= "orange", linetype= "dashed")
  print(wykres)
  dev.off()
  write.csv2(a, file = "wynik.csv")
}
oceny <- read.csv2("oceny.csv", sep = ";", dec = ",")
liczsrednia(oceny)


### zad3 ###

# Napisz funkcj�, kt�ra sprawdzi czy dane w kolumnach s� numeryczne, je�li tak,
# to funkcja wypisuje minimaln�,maksymaln� i �rednia warto�� dla takiej kolumny.
myDataFrame <- read.csv("http://www.cs.put.poznan.pl/kgutowska/RPiS/dane/SelectedPolandData.csv", header=TRUE, sep=",", dec=".", stringsAsFactors=FALSE)
funkcja<-function(dane){
  numer <- Filter(is.numeric, dane)
  print("max")
  apply(numer,2,max)
  print("min")
  apply(numer,2,min)
  print("srednia")
  apply(numer,2,mean)
}

funkcja(myDataFrame)

#Wy�wietl dane z wierszy o parzystych indeksach
parzyste <- read.csv("http://www.cs.put.poznan.pl/kgutowska/RPiS/dane/SelectedPolandData.csv")[c(FALSE,TRUE), ]
parzyste

# Wy�wietl dane dla kt�rych ca�kowita liczba przypadk�w (total_cases) jest mniejsza ni� 100 i ca�kowita liczba
# �mierci (total_deaths) jest r�wna 0. Ile jest takich rekord�w w pliku SelectedPolandData?

dane <- filter(myDataFrame, total_cases<100, total_deaths==0)
dane
#jest takich 8 rekord�w

# Wykorzystuj�c dane wyselekcjonowane w poprzednim punkcie, narysuj wykres zale�no�ci pomi�dzy zmienn�
#zawieraj�c� ca�kowit� liczb� przypadk�w (total_cases) a dat� (date). Nadaj wykresowi tytu� i nazwij odpowiednio osie. Do uzyskania 4 pkt
 
library(ggplot2)
g<- ggplot(dane, aes(x=date, y=total_cases)) +
  geom_point(size=2, color="red")
g + ggtitle("Plot of total cases per date") +
  xlab("Date") + ylab("Total cases")

