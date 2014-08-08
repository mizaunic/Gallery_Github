#Importing#
setwd("E:/Redzuan")
Student<-read.table("StudentData.csv",header=TRUE,sep=",",quote = "",row.names=NULL,stringsAsFactors=TRUE)


#Diagnostic#
str(Student)
summary(Student)



#Recoding#

library(car)
Student[,1]<-recode(Student[,1], "c('KAULA LUMPUR','kuala lumpur','KUALA LUMPUR')='Kuala Lumpur'")

levels(Student[,5])<-c("ACE","ACE","ACE","ACE","ACE","ACE","ACE")

        ######OR#######

Student[,5]<-"Agr & Consumer Economics"
Student[,5]<-as.factor(Student[,5])



#Checking#
str(Student)
summary(Student)
Student



#------------------------------------------------Save in Excel-------------------------------------------#

library(XLConnect)
# Load workbook; create if not existing
wb <- loadWorkbook("Try.xlsx", create = TRUE)
# Create a worksheet
createSheet(wb, name = "Student")
# Create a name reference
createName(wb, name = "Student", formula = "Student!$A$1")
# Write built-in data.frame 'Student' to the specified named region
writeNamedRegion(wb, Student, name = "Student")
# Save workbook
saveWorkbook(wb)













#Clearing#
rm(list=ls()) 


#Note#
newx <- recode(x, "c(1,2)='A'; else='B'")
recode(myColors, "'red'='rot'; 'blue'='blau'; 'purple'='violett'")








# Competency Data #

setwd("E:/Redzuan")
c<-read.table("Copy of excel.csv",header=TRUE,sep=",",quote = "",row.names=NULL,stringsAsFactors=TRUE)
str(c)
c1<-data.frame(table(c))
c1[1:100,]


c1<-read.table("Copy of excel.csv",header=TRUE,sep=",",quote = "",row.names=NULL,stringsAsFactors=FALSE)

c2<-toupper(c$COMPETENCY.TITLE) # Change all to UpperCase

Competency<-data.frame(Competency_Title=as.factor(c2))
str(Competency)

c3<-data.frame(table(Competency))
str(c3)
c3[1:100,]




#Select Cases#

selected<-"C++"
c4<-c3[c3$Competency %in% selected,]
c3[250:270,]

#--------OR---------#

require(sqldf)
c5<-sqldf("select * from c3 where Competency LIKE '%C++%'")
c5



c6<-sqldf("select * from c3 where Competency LIKE 'C%'")
c6

#------------------------------------------------Save in Excel-------------------------------------------#

library(XLConnect)
# Load workbook; create if not existing
wb <- loadWorkbook("Try1.xlsx", create = TRUE)
# Create a worksheet
createSheet(wb, name = "c6")
# Create a name reference
createName(wb, name = "c6", formula = "c6!$A$1")
# Write built-in data.frame 'c6' to the specified named region
writeNamedRegion(wb, c6, name = "c6")
# Save workbook
saveWorkbook(wb)


























#Remove Punctuation#
c6<-gsub(pattern="[[:punct:]]", c5$Competency, replacement=" ")


# Remove Punctuation EXCEPT + and &#
x <- "I like %$@to*&, C++ & C;: gum, but don't like|}{[] bubble@#^)( gum!?"
x2<- gsub("[^[:alnum:][:space:]+&]", "", x)




