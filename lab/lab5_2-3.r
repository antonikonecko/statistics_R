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

# Napisz funkcjê, która sprawdzi czy dane w kolumnach s¹ numeryczne, jeœli tak,
# to funkcja wypisuje minimaln¹,maksymaln¹ i œrednia wartoœæ dla takiej kolumny.
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

#Wyœwietl dane z wierszy o parzystych indeksach
parzyste <- read.csv("http://www.cs.put.poznan.pl/kgutowska/RPiS/dane/SelectedPolandData.csv")[c(FALSE,TRUE), ]
parzyste

# Wyœwietl dane dla których ca³kowita liczba przypadków (total_cases) jest mniejsza ni¿ 100 i ca³kowita liczba
# œmierci (total_deaths) jest równa 0. Ile jest takich rekordów w pliku SelectedPolandData?

dane <- filter(myDataFrame, total_cases<100, total_deaths==0)
dane
#jest takich 8 rekordów

# Wykorzystuj¹c dane wyselekcjonowane w poprzednim punkcie, narysuj wykres zale¿noœci pomiêdzy zmienn¹
#zawieraj¹c¹ ca³kowit¹ liczbê przypadków (total_cases) a dat¹ (date). Nadaj wykresowi tytu³ i nazwij odpowiednio osie. Do uzyskania 4 pkt
 
library(ggplot2)
g<- ggplot(dane, aes(x=date, y=total_cases)) +
  geom_point(size=2, color="red")
g + ggtitle("Plot of total cases per date") +
  xlab("Date") + ylab("Total cases")

