
### Logic bases of R ###

#simple operators

My_exam = 8.5 
You_exam = 5.9

My_exam == 10
My_exam <= 6
My_exam >= 6
My_exam > 6 & My_exam < 8
My_exam != You_exam
My_exam != 8.5
My_exam < 6 | You_exam < 6

#Strings

user="Nachito"

user=="Faker"

#number of characters 
nchar(user) < 10
val_numchar=nchar(user) < 10

#Ban words 
!grepl("Noob",user)
val_noob=!grepl("Noob",user)

#Ban characters
substr(user,1,1)!="."
val_dot=substr(user,1,1)!="."

#complete validation

val_dot & val_noob & val_numchar

### Example

user= "RIOT Mictlan"
nchar(user) < 10 & !grepl("RIOT",user) & user != "Elvaipa" & user != "Ixtli"

#Vectors

views= c(8321,2974,5792,4932,4889,7433,6651)
names= c("video1","video2","video3","video4","video5","video6","video7")

#operations with vectors

length(views)
max(views)
min(views)
mean(views)
summary(views)
sum(views)

views+1000
views/500
log(views)
sqrt(views)
nchar(names)

#new entry

views=c(views,5600)
names=c(names,"video8")

#Put names

names(views)=names

#organised

sort(views)
sort(views,decreasing = TRUE)

#logic vectors

any(views > 8000)
all(views > 8000)
which(views < 5000)

#subset

views[c(2,3)]
views[-c(1,4,5,6,7,8)]
views[c("video2","video3")]

#Modify entries

views[1]=1000
views[views > 6000]=6000
views

#vectors like sets

I=c("GTAV","HollowKnigth","Fallout3","DevilMayCry5")
Friend=c("GTAV","ZeldaBOW","MarioWorld","Fallout3")

c(I,Friend)

#Join

union(I,Friend)
intersect(I,Friend)
setdiff(I,Friend)
setdiff(Friend,I)
setequal(I,Friend)
"ZeldaBOW" %in% Friend
c("ZeldaBOW","AOE2") %in% Friend

#Random vectors

results=c("victory","defeat")
sample(results,size = 10,replace = TRUE,prob = c(0.3,0.7))

#Random distributions

runif(n=20, min = 0,max = 10)
rnorm(n=20,mean = 15,sd=2)
rbinom(n=20,size = 5,p=0.5)

#Exercise
set.seed(123)
compras=rnorm(n=10000,mean = 5000,sd=1000)

compras[c(435,678)]
sum(compras > 8000)
max(compras)
min(compras)
sum(compras >= 4000 & compras <= 6000)/length(compras)

#Exercise 
usuario="NoobSlayer9"
any(strsplit(usuario,split = "")[[1]]%in%1:9)
all(strsplit(usuario,split = "")[[1]]%in%1:9)

#if / else if / else
elo=250
if(elo >=750){
  rango="gran mastetro"
}else if (elo >=500){
  rango="maestros"
}else if(elo >= 250){
  rango="profesional"
}else{
  rango="novato"
}
rango

#Functions

square = function(num){
  return(num**2)
}
square(8)

# 1
cel_to_far= function(tem){
  farenheit=tem*9/5+32
  return(farenheit)
}
cel_to_far(25)

#2

user_valid = function(name){
  val_long =nchar(name) < 10
  val_riot = !grepl("RIOT",name)
  val_jet = !name %in% c("ElVaipa","Ixtli")
  validation = val_long & val_riot & val_jet
  return(validation)
}
user_valid("Nachito")

#Data frame  

series= data.frame(
  nombre = c("Arcane","Mad Men","The office","Invincible","Seinfekd"),
  imbd = c(9.4,8.6,8.9,8.7,8.8),
  episodios = c(10,92,188,13,173),
  concluida = c(FALSE,TRUE,TRUE,FALSE,TRUE)
)

View(series)
nrow(series)
ncol(series)
summary(series)

#Add row

band_of_brothers = data.frame(nombre = "Band of brothers",
                              imbd = 9.4,
                              episodios = 10,
                              concluida = TRUE)

series = rbind(series,band_of_brothers)

#Add col

series$metascore = c(8.7,8.6,6.6,8.5,8.4,8.7)
series$mean = (series$imbd + series$metascore) / 2

#Extrac info

series$imbd
series[1,] #row
series[,1] #col
series[series$imbd >= 9]
series[series$episodios >= 50, 1 ]

#Exercice 

videogames = read.csv("all_games.csv")
nrow(videogames)
ncol(videogames)
summary(videogames)

colSums(is.na(videogames))

videogames$platform = trimws(videogames$platform)
sort(table(videogames$platform),decreasing = TRUE)

nrow(videogames[videogames$platform == "PC" &
             videogames$meta_score > 80, ])

nrow(videogames[videogames$platform %in% c ("GameCube","PSP") ,])

nrow(videogames [videogames$platform == "Switch" &
                   videogames$meta_score <= 70 &
                   videogames$meta_score >= 50, ])
