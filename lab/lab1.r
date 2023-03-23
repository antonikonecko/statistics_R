#zad1
x <- 22
y <- 9
x %% y
x%/%y

#zad2
#help.search przeszukuje dokumentacje i wyswietla nazwy, tytuly, slowa kluczowe,  pasującą do podanego w nawiasie ciągu znaków
#q() wyjście z RStudio
#demo()interfejs do uruchamiania niektórych demonstracyjnych skryptów języka R. demo () podaje listę dostępnych tematów.
#args() Wyświetla nazwy argumentów i odpowiadające im wartości domyślne funkcji.
#apropos() zwraca wektor znakowy, podając nazwy obiektów na liście wyszukiwania pasujące (wyrażenie regularne).
#example() Uruchamia cały kod R z bloku Examples w temacie pomocy online języka R z możliwymi wyjątkami dontrun, dontshow i donttest

#zad3
install.packages("txtplot")
txtplot(cars[,1],cars[,2],xlab="speed", ylab="distance")
#wynikiem jest wykres drogi od prędkości.

#zad4.
sqrt(7)
log(3,2)# logarytm o podstawie 2
sin(30)
log10(100) #logarytm dziesiętny
log(6) #logarytm naturalny

#zad5
a = b = 3 #a =3 i b = 3
a <- b <- 3 #a =3 i b = 3
a = b <- 3 #a =3 i b = 3
a <- b = 3 #Błąd w poleceniu 'a <- b = 3':nie udało się znaleźć funkcji '<-<-'
#<- ma wyższy priorytet niż = dlatego nie udało się przypisać 3 do a

#zad6
x <- 7
typeof(x) #double
class(x) #numeric
mode(x) #numeric

#zad7
print("Hello World!\n") # "Hello World!\n"
cat("Hello World!\n") #Hello World!
#print wyświetla wszystko w cudzyslowie:
#......razem z \n oraz cudzysłowem.
#cat wyświetla tylko Hello World!

#zad8
assign("y", 8)

#zad9
A <- matrix(1:4, 2, 2)
B <- matrix(1:4, 2, 2)
A%*%B

#zad10
wektor <- c(1, 10, NaN)
any(wektor = NaN) #NA
