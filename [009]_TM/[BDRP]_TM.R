# 한글 자연어 처리(KoNLP)
# 워드클라우드(wordcloud) 패키지 설치 및 로딩

install.packages("KoNLP") 
install.packages("wordcloud") 
library(KoNLP) 
library(wordcloud)



# 한글처리 ####
# 한글 사전 다운로드
# 최초 1회 실행     
# 여러 종류 사전
# useSejongDic()

useNIADic()



# 사용자 단어 추가

mergeUserDic(data.frame("하늘공원", "ncn"))

mergeUserDic(data.frame("버스킹", "ncn"))





# 파일 읽어오기 ####

mapo1 <- readLines("Read_Data/mapo.txt") 



head(mapo1) 



tail(mapo1)



length(mapo1)





# extractNoun() 함수 실행  ####
# sapply() 함수를 사용
# 문장을 단어단위로 처리

mapo2 <- sapply(mapo1, 
                extractNoun, 
                USE.NAMES = FALSE)



# 단어단위 처리결과 확인

head(mapo2)
length(mapo2)






# list구조를 vector구조로 변경

mapo3 <- unlist(mapo2) 

head(mapo3, 50)
length(mapo3)




# 불필요한 단어 처리
# 정규표현식 사용 - gsub( )

mapo3 <- gsub("\\d+", "", mapo3)
head(mapo3, 50)



mapo3 <- gsub("○○", "", mapo3)
head(mapo3, 50)



mapo3 <- gsub("secret", "", mapo3) 
head(mapo3, 50)





# 공백도 단어개수에 포함

length(mapo3)







# 빈도분석 수행 ####
# table() 함수 사용
# 공백문자도 빈도분석에 포함

Word_Freq <- table(mapo3)

head(sort(Word_Freq, decreasing = TRUE), 20)



# 공백 제거
# 정규표현식 사용 - grep( )

mapo4 <- grep(".", mapo3, value = TRUE)

head(mapo4, 50)
length(mapo4)



# 빈도분석 재수행 ####

Word_Freq <- table(mapo4)

head(sort(Word_Freq, decreasing = TRUE), 20)





# 불필요한 단어 처리
# 정규표현식 사용 - gsub( ) 

mapo4 <- gsub("행정과", "", mapo4)
mapo4 <- gsub("완료", "", mapo4)
mapo4 <- gsub("관련", "", mapo4)
mapo4 <- gsub("요청", "", mapo4)
mapo4 <- gsub("김", "", mapo4)
mapo4 <- gsub("이", "", mapo4)
mapo4 <- gsub("박", "", mapo4)
mapo4 <- gsub("것", "", mapo4)
mapo4 <- gsub("최", "", mapo4)
mapo4 <- gsub("축", "", mapo4)
mapo4 <- gsub("한", "", mapo4)
mapo4 <- gsub("정", "", mapo4)
mapo4 <- gsub("동", "", mapo4)
mapo4 <- gsub("홍", "", mapo4)



# 공백 제거
# 정규표현식 사용 - grep( )

head(mapo4, 50)
length(mapo4)

mapo5 <- grep(".", mapo4, value = TRUE)



# 공백 처리결과 확인

head(mapo5, 50)
length(mapo5)






# 빈도분석 재수행 ####

Word_Freq <- table(mapo5)

head(sort(Word_Freq, decreasing = TRUE), 20)





# 색상지정 패키지
# install.packages("RcolorBrewer")

library(RColorBrewer)



# 색상표 확인

display.brewer.all(type = "all")



display.brewer.all(type = "div")
display.brewer.all(type = "seq")
display.brewer.all(type = "qual")



# 색지정 ####

palete <- brewer.pal(8, "Dark2") 







# 워드클라우드 출력 ####

wordcloud(names(Word_Freq),
          freq = Word_Freq,
          scale = c(7, 1),
          rot.per = 0.25,
          min.freq = 6,
          random.order = FALSE,
          random.color = TRUE,
          colors = palete)










