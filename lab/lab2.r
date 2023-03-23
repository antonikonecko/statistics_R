# zad3
sample(wektor1 <- 1:3, 20, T, prob = c( 0.1, 0.3, 0.6))

#zad6
lliczba <- 1515
typeof(liczba)
switch(mode(liczba), factor = "typ czynnikowy", logical = "typ logiczny", numeric = "typ liczbowy", "inny typ")

#zad8
for (i in 1:33)
  if(33 %% i == 0)
    cat(i, "\n")

#zad9
fibo <- 1:15
fibo[1] <- 1
fibo[2] <- 1
for (i in 3:15) fibo[i] <- fibo[i - 2] + fibo[i - 1]
which(fibo == 233)


#zad10
kolumna_1 <- 1:10
kolumna_2 <- sample(z <-  1:10, 10, F)
kolumna_3 <- sample(y <- seq(10, 20), 10, T)
ramka <- data.frame(kolumna_1, kolumna_2, kolumna_3)
for(i in kolumna_1)
  srednia <- (kolumna_2[i] + kolumna_3[i]) /2 
cat(srednia)