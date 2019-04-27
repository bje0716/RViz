# ggplot2 package ####

install.packages("ggplot2")
install.packages("ggthemes")

library(ggplot2)
library(ggthemes)



# 그래프 출력함수 사용 ####

ggplot(iris, 
       aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) + 
       geom_point() + theme_wsj()





# 객체지정하여 사용하기 ####
# g1 객체지정

g1 <- ggplot(iris, 
             aes(x = Sepal.Length, y = Sepal.Width, colour = Species))



# g2 객체지정

g2 <- geom_point()



# g3 객체지정

g3 <- theme_bw()



# g1 + g2 + g3 그래프 출력

g1 + g2 + g3



# 테마변경

g1 + g2 + theme_fivethirtyeight()











# geom_point() and geom_line() ####

BD <- read.csv("Read_Data/BB_plyr_2.csv")



# 해더정보 확인

colnames(BD)



# 데이터 구조 확인

str(BD)

head(BD)



# 그래픽 객체지정

g1 <- ggplot(BD, aes(x = 연도, y = 안타))



# 포인트 출력

g1 + geom_point()



# 라인 출력

g1 + geom_line()



# 포인트 + 라인 출력

g1 + geom_point() + geom_line() 



# 사이즈 및 색 지정 ####

g1 + 
  geom_point(size = 5) + geom_line(size = 1)



g1 + 
  geom_point(size = 5, colour = "seagreen") + 
  geom_line(size = 1, colour = "gray55")






# aes( ) 색 지정 및 점모양 변경 ####

BD2 <- read.csv("Read_Data/KBO2.csv")

str(BD2)

(BD2$팀명)



ggplot(BD2, aes(x = 순위, y = 안타, colour = 팀명)) +
  geom_point(size = 2)



ggplot(BD2, aes(x = 순위, y = 안타, colour = 팀명)) +
  geom_point(size = 3, shape = 11)



ggplot(BD2, aes(x = 순위, y = 안타, colour = 팀명)) +
  geom_point(size = 5, shape = "$")








# geom_area() ####

# 라인과 영역으로 그래프 출력

ggplot(BD, aes(x = 연도, y = 이루타)) + geom_line()

ggplot(BD, aes(x = 연도, y = 이루타)) + geom_area()



# 색 채우기

ggplot(BD, aes(x = 연도, y = 이루타)) + 
  geom_area(fill = "tan")



# 색 채우기와 경계선 긋기

ggplot(BD, aes(x = 연도, y = 이루타)) + 
  geom_area(fill = "tomato") + 
  geom_line(size = 2, colour = "gray33")



# alpha : 투명도 지정

ggplot(BD, aes(x = 연도, y = 이루타)) + 
  geom_area(fill = "tomato", alpha = 0.5) + 
  geom_line(size = 2, colour = "gray33")










# geom_histogram() ####
# 객체지정

g1 <- ggplot(iris, aes(x = Sepal.Length))



# 히스토그램 출력

g1 + 
  geom_histogram(binwidth = 0.2, 
                 fill = "peru")



# 색 채우기 적용

g1 + 
  geom_histogram(aes(fill = Species), 
                 binwidth = 0.2)










# geom_text() ####

DF <- read.csv("Read_Data/PII.csv")

str(DF)

g1 <- ggplot(DF, aes(x = Height, y = Weight))


# 이름 표시하기

g1 + 
  geom_point(aes(colour = BloodType), size = 5) + 
  geom_text(aes(label = Name))



g1 + 
  geom_point(aes(colour = BloodType), size = 5) + 
  geom_text(aes(label = Name), 
            vjust = -1.1,
            colour = "gray33")








# geom_bar() ####

ggplot(DF, aes(x = BloodType)) + geom_bar()




# fill로 색지정

ggplot(DF, aes(x = BloodType, fill = Gender)) + 
  geom_bar()



# 성별 막대그래프 분리

ggplot(DF, aes(x = BloodType, fill = Gender)) + 
  geom_bar(position = "dodge")



# 막대그래프 폭 지정

ggplot(DF, aes(x = BloodType, fill = Gender)) + 
  geom_bar(position = "dodge", width = 0.3, stat = "count")



# stat = "identity"

ggplot(DF, aes(x = Name, y = Height, fill = BloodType)) +
  geom_bar(stat = "identity")

ggplot(DF, aes(x = Name, y = Height, fill = BloodType)) +
  geom_bar(stat = "identity", width = 0.3)



# geom_text() & theme()

ggplot(DF, aes(x = Name, y = Height, fill = BloodType)) +
  geom_bar(stat = "identity", width = 0.3) +
  geom_text(aes(label = paste(Grade, "학년")),
            vjust = -1, color = "gray35", size = 3) +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))
  














# geom_boxplot() ####

g1 <- ggplot(DF, aes(x = Gender, y = Height))

g1 + geom_boxplot()

g1 + geom_boxplot(aes(fill = Gender))

g1 + geom_boxplot(fill = c("skyblue", "pink"))



g2 <- ggplot(DF, aes(x = BloodType, y = Height))

g2 + geom_boxplot(aes(fill = BloodType))

g2 + geom_boxplot(aes(fill = BloodType),
                  outlier.colour = "red",
                  outlier.shape = "*",
                  outlier.size = 30)










# facet_grid(종속변수~독립변수)  ####
# 명목형 변수를 기준으로 별도의 그래프 작성

g1 <- ggplot(DF, aes(x = Height, y = Weight, 
                     colour = BloodType))



# x축 기준

g1 + 
  geom_line(size = 1) + 
  geom_point(size = 5) + 
  facet_grid(. ~ Gender)




# y축 기준

g1 + 
  geom_line(size = 1) + 
  geom_point(size = 5) + 
  facet_grid(Gender ~ .)




# scales = "free"를 적용하여 
# 명목변수 별 각각의 범위를 허용
# x축기준(facet_wrap( ))

g1 + 
  geom_line(size = 1) + 
  geom_point(size = 5) + 
  facet_wrap(. ~ Gender, scales = "free")



# y축기준(facet_grid( ))

g1 + 
  geom_line(size = 1) + 
  geom_point(size = 5) + 
  facet_grid(Gender ~ ., scales = "free")















# 시계열 데이터 ####
# 2007/2018년도 경기기록

BD <- read.csv("Read_Data/BB_plyr_2.csv")

str(BD)




# 모든 값이 출력되지 않는 문제 발생

ggplot(BD, aes(x = 연도, y = 안타)) + 
  geom_line()



# factor()를 사용하여 데이터 타입 변경

ggplot(BD, aes(x = factor(연도), y = 안타, 
               group = 1)) +
  geom_line()



# 점추가

ggplot(BD, aes(x = factor(연도), y = 안타, 
               group = 1)) +
  geom_line() + 
  geom_point()



# 테마적용

ggplot(BD, aes(x = factor(연도), y = 안타, 
               group = 1)) +
  geom_line() + 
  geom_point() + 
  theme_bw()



# 색상지정

ggplot(BD, aes(x = factor(연도), y = 안타, 
               group = 1)) +
  geom_line(size = 1, colour = "orange") + 
  geom_point(size = 5, colour = "tomato") + 
  theme_bw()



# 레이블 지정

ggplot(BD, aes(x = factor(연도), y = 안타, 
               group = 1)) +
  geom_line(size = 1, colour = "orange") + 
  geom_point(size = 5, colour = "tomato")  + 
  theme_bw() +
  xlab("년도") +
  ylab("안타수") + 
  ggtitle("연도별 기록") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))





