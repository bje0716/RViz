# 파일에서 읽어오기

DF <- read.csv("Read_Data/PII.csv")

head(DF)

tail(DF)



# (고수준) 벡터 ####

plot(DF$Age)

plot(DF$Age, type = "l")

plot(DF$Weight ~ DF$Height)

plot(DF$Weight ~ DF$Height, pch = 19)

plot(DF$Height ~ DF$Gender)

plot(DF$BloodType)

hist(DF$Weight)





# (고수준) 산점도 점모양 지정 ####
# pch : 0 ~ 25 까지 지정되어 있음

plot(DF$Weight ~ DF$Height, 
     pch = as.integer(DF$Gender))



# (저수준) 범례출력 ####
# topleft     top     topright
# left        center  right
# bottomleft  bottom  bottomright

legend("topleft",
       c("남자", "여자"),
       pch = DF$Gender)














# (고수준) 레이블 출력 안함

plot(DF$Weight ~ DF$Height, ann = FALSE)



# (저수준) 레이블 출력

title(main = "몸무게와 키의 관계")
title(xlab = "키")
title(ylab = "몸무게")



# (저수준) 키, 몸무게 평균선 출력

heightMean <- mean(DF$Height)
abline(v = heightMean, col = "red")


weightMean <- mean(DF$Weight)
abline(h = weightMean, col = "blue")


















# (고수준) 막대그래프 출력 ####

# 빈도분석표 생성

FreqBlood <- table(DF$BloodType)

FreqBlood

barplot(FreqBlood,
        col = "skyblue", border = "pink")



# (저수준) 레이블 출력

title(main = "혈액형별 빈도수",
      xlab = "혈액형",
      ylab = "빈도수")



# 가로막대 출력

barplot(FreqBlood,
        col = "seagreen", border = "tomato",
        horiz = TRUE)		




# 축(Axis) 방향 설정 - las : 0 ~ 3 

barplot(FreqBlood, las = 0)
barplot(FreqBlood, las = 1)
barplot(FreqBlood, las = 2)
barplot(FreqBlood, las = 3)














# (고수준) 박스플롯 출력

boxplot(DF$Height)



boxplot(DF$Height ~ DF$BloodType)



boxplot(DF$Height ~ DF$BloodType,
        col = c("pink", "green", "skyblue", "orange"))

grid(col = "tomato")



boxplot(DF$Height ~ DF$BloodType,
        col = c("pink", "green", "skyblue", "orange"),
        horizontal = TRUE)










# (고수준) 히스토그램 출력 ####

hist(DF$Height)

hist(DF$Height, col = "seagreen")

hist(DF$Height, breaks = 10)













# plot창 분할 ####

par(mfrow = c(2,3))

plot(DF$Weight ~ DF$Height)
barplot(FreqBlood)
plot(DF$Height, type = "o")
pie(FreqBlood)
boxplot(DF$Weight ~ DF$BloodType)
hist(DF$Weight)

par(mfrow = c(1,1))








# 두개의 자료 비교 ####
# (고수준) + (저수준)

DF1 <- read.csv("Read_Data/BB_plyr_1.csv")

DF2 <- read.csv("Read_Data/BB_plyr_2.csv")




# (고수준) 실선

plot(DF1$안타 ~ DF1$연도, 
       type = "l", col = "blue", lwd = 2)



# (저수준) 점선

lines(DF2$안타 ~ DF2$연도, 
        lty = 2, col = "tomato", lwd = 3)









# plot() 함수 옵션 ####

# 실습용 데이터 준비

v1 <- seq(-10, 10, 1)
v2 <- v1 ^ 2




# 선, 점 지정

plot(v2 ~ v1, type = "p",
     main = "Graph-1", sub = "산점도")

plot(v2 ~ v1, type = "l",
     main = "Graph-2", sub = "라인그래프")

plot(v2 ~ v1, type = "c",
     main = "Graph-3", sub = "라인그래프 - 산점도")

plot(v2 ~ v1, type = "b",
     main = "Graph-4", sub = "c + p")

plot(v2 ~ v1, type = "o",
     main = "Graph-5", sub = "l + p")

plot(v2 ~ v1, type = "h",
     main = "Graph-6", sub = "수직선")

plot(v2 ~ v1, type = "s",
     main = "Graph-7", sub = "계단형 영역")








# 색지정

plot(v2 ~ v1, type = "p", pch = 19, col = "blue")

plot(v2 ~ v1, type = "p", pch = 19, col = "#FF00FF")





# 점모양 지정(pch = 0~25), 점크기(cex = 1)

plot(v1, v2, type = "p", pch = 25)

plot(v1, v2, type = "p", pch = "$", cex = 3)





# 선모양 지정

plot(v1, v2, type = "l", col = "red")
plot(v1, v2, type = "l", col = "red", lwd = 3, lty = 1)
plot(v1, v2, type = "l", col = "red", lwd = 3, lty = 2)
plot(v1, v2, type = "l", col = "red", lwd = 3, lty = 3)
plot(v1, v2, type = "l", col = "red", lwd = 3, lty = 4)
plot(v1, v2, type = "l", col = "red", lwd = 3, lty = 5)
plot(v1, v2, type = "l", col = "red", lwd = 3, lty = 6)











