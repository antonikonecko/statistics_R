#"C:\Program Files\R\R-4.0.4\bin\R.exe" CMD BATCH --vanilla "--args http://www.cs.put.poznan.pl/kgutowska/RPiS/dane/25-April-owid-covid-data.csv" rpis-AKonecko130528-lab5-zad1.R
#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0) {
        stop("Nalezy podac co najmniej jeden argument wejsciowy")
}

allCovidData2 <- read.csv(file=args[1], header=TRUE)
GermanyData <- with(allCovidData2, allCovidData2[iso_code == "DEU", ])

jpeg("grafika1.jpg", width = 1080, height = 720) 
plot(as.Date(GermanyData$date), GermanyData$total_cases, col = "green", 
     main = "Liczba zarazonych na SARS-COV-2",
     ylab = "Liczba przypadkow",
     xlab = "data",
     xlim = as.Date(c("2020-03-01", "2020-04-30"))
)
lines(as.Date(GermanyData$date), GermanyData$total_deaths, type = "p", col = "blue")
legend("topleft", 
       cex = 0.8,
       c("przypadki potwierdzone", "przypadki smiertelne"), 
       fill = c("red", "grey"),
       title = "Dane z covid.ourworldindata.org (25.04.2020)"
)
dev.off()
