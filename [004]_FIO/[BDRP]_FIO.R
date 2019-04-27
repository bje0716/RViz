# 작업디렉토리 확인 ####

getwd()



# 작업디렉토리 내 파일 확인 ####

dir()











# readLines() ####
# 파일 읽어오기

readLines("Read_Data/TestFile_1.txt")


readLines("Read_Data/TestFile_2.txt")



# 읽어온 데이터를 객체에 지정

v1 <- readLines("Read_Data/TestFile_1.txt")


is(v1)


length(v1)











# read.csv() ####

read.csv("Read_Data/FileIO_1.csv")


read.csv("Read_Data/FileIO_2.csv")


read.csv("Read_Data/FileIO_2.csv", header = FALSE)



# 읽어온 데이터를 객체에 지정

DF_KBO <- read.csv("Read_Data/KBO.csv")


DF_KBO

DF_KBO$AVG

DF_KBO[,c(1, 3, 4)]

subset(DF_KBO, Team == "NC")






# 엑셀파일 읽어오기 ####

install.packages("readxl")

library(readxl)



read_xlsx(path = "Read_Data/PII.xlsx",
          sheet = "Sheet1")




# 읽어온 데이터를 객체에 지정

XL <- read_xlsx(path = "Read_Data/PII.xlsx", sheet = "Sheet1")

XL



# as.data.frame( ) 적용

is(XL)

XL <- as.data.frame(XL)

is(XL)











