#zad1
funkcja1<-function(wektor, b)
{
  for( i in wektor)
  {
    if(i%%b==0)
      print(i)
  }
}
funkcja1(1:10, 5)

#zad2
delta<-function(a,b,c){
  b^2-4*a*c
}

funkcja2 <- function(a,b,c){
  if(delta(a,b,c) > 0){
    x_1 = (-b+sqrt(delta(a,b,c)))/(2*a)
    x_2 = (-b-sqrt(delta(a,b,c)))/(2*a)
    result = c(x_1,x_2)
  }
  else if(delta(a,b,c) == 0){
    x = -b/(2*a)
  }
  else {"Brak rozwiazania rzeczywistego."} 
}

print(funkcja2(1,1,1))
print(funkcja2(2,10,3))
print(funkcja2(4,4,1))

#zad3

funkcja3<-function(wektor)
{
  result<-sort(wektor, decreasing = FALSE)
  print(result[1:3])
}

funkcja3(1:10)

#zad4

funkcja4<-function(wektor)
{
  if (length(wektor)<3)
    print("wektor jest za krotki (musi miec conajmniej 3 elementy)")
  else
  {
    najmniejsze<-sort(wektor, decreasing = FALSE)
    print("Najmniejsze")
    print(najmniejsze[1:3])    
    
    najwieksze<-sort(wektor, decreasing = TRUE)
    print("Najwieksze")
    print(najwieksze[1:3])
   
  }
}

funkcja4(1:10)

#zad5

funkcja5 <-function(arg1, arg2) {
  UseMethod("funkcja5")
}

funkcja5.numeric <-function(arg1,arg2){
  arg1*arg2
}

funkcja5.matrix <-function(arg1, arg2){
  arg1%*%arg2
}
funkcja5(1:5, 6:10)
funkcja5(matrix(2), matrix(2))