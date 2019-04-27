# 막대 그래프 ####

hotdogs <- read.csv("Read_Data/hotdog.csv")

head(hotdogs)

tail(hotdogs)



# 산점도 및 막대그래프

plot(hotdogs$Dogs.eaten, pch = 19)


barplot(hotdogs$Dogs.eaten)




# 연도 레이블 추가

barplot(hotdogs$Dogs.eaten, 
        names.arg = hotdogs$Year, las = 2)






# 축 레이블, 외곽선 설정, 색 추가

barplot(hotdogs$Dogs.eaten,
        names.arg = hotdogs$Year, las = 2, 
        col = "tomato", border = NA, 
        xlab = "Year", ylab = "Hotdog")




# 미국이 우승한 해의 색상 구별

fill_colors <- c()

for (i in 1:length(hotdogs$Country)){
  if (hotdogs$Country[i] == "United States"){
    fill_colors <- c(fill_colors, "tomato")
  } else {
    fill_colors <- c(fill_colors, "tan")  
  }
}

barplot(hotdogs$Dogs.eaten, 
        names.arg = hotdogs$Year, las = 2,
        col = fill_colors, border = NA, 
        xlab = "Year", ylab = "Hotdog")




# space 옵션으로 막대 간격 조정

barplot(hotdogs$Dogs.eaten, 
        names.arg = hotdogs$Year, las = 2,
        col = fill_colors, border = NA, 
        space = 0.5,
        main = "Hotdog Eating Contest(1980-2010)",
        xlab = "Year", ylab = "Hotdog")












# 누적 막대 그래프 ####

hotdog2 <- read.csv("Read_Data/hotdog2.csv")

hotdog2



# 해더명 재설정

names(hotdog2) <- c("2000", "2001", "2002", 
                    "2003", "2004", "2005", 
                    "2006", "2007", "2008", 
                    "2009", "2010")
hotdog2

hotdog2 <- as.matrix(hotdog2)
hotdog2

barplot(hotdog2, border = NA, 
        col = c("tomato", "tan", "seagreen"),
        space = 0.25, 
        ylim = c(0, 200), 
        xlab = "Year", ylab = "Hotdog",
        main = "Hotdog Eating Contest(2000-2010)")















# pie() 그래프 ####

BD <- read.csv("Read_Data/KBO.csv")


# 그래프 출력

pie(BD$HR, 
    labels = BD$Name, 
    main = "선수별 홈런")



pie(BD$HR, 
    labels = BD$Name,
    main = "선수별 홈런",
    init.angle = 90)



pie(BD$HR, 
    labels = paste(BD$Name, "-", BD$HR, "개"),
    main = "선수별 홈런",
    init.angle = 90)






# 3D 파이 그래프 ####
# install.packages("plotrix")

library(plotrix)

pie3D(BD$HR,
      labels = paste(BD$Name, "-", BD$HR, "개"),
      main = "선수별 홈런",
      explode = 0.09, 
      labelcex = 1)










# 모자이크 플롯(Mosaic Plot) ####
# install.packages("ggmosaic")

library(ggmosaic)
library(ggthemes)


TD <- read.csv("Read_Data/Titanic.csv")

str(TD)

head(TD)

tail(TD)






# 변수별 사망, 생존자 수

subset(TD, Class == "1st" & Sex == "Male")
subset(TD, Class == "1st" & Sex == "Female")

subset(TD, Class == "2nd" & Sex == "Male")
subset(TD, Class == "2nd" & Sex == "Female")

subset(TD, Class == "3rd" & Sex == "Male")
subset(TD, Class == "3rd" & Sex == "Female")

subset(TD, Class == "Crew" & Sex == "Male")
subset(TD, Class == "Crew" & Sex == "Female")







# 선실별 생존

ggplot(TD) +
  geom_mosaic(aes(weight = Freq, 
                  x = product(Class), 
                  fill = Survived)) + 
  xlab("Class") + ylab("Survived") + theme_light()



# 성별별 생존

ggplot(TD) +
  geom_mosaic(aes(weight = Freq, 
                  x = product(Sex), 
                  fill = Survived)) + 
  xlab("Sex") + ylab("Survived") + theme_economist()



# 나이별 생존

ggplot(TD) +
  geom_mosaic(aes(weight = Freq, 
                  x = product(Age), 
                  fill = Survived)) + 
  xlab("Age") + ylab("Survived") + theme_few()



# 선실과 나이별 생존

ggplot(TD) +
  geom_mosaic(aes(weight = Freq, 
                  x = product(Class, Age), 
                  fill = Survived)) + 
  xlab("Survived:Age") + ylab("Class") + theme_hc() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))



# 선실과 성별별 생존

ggplot(TD) +
  geom_mosaic(aes(weight = Freq, 
                  x = product(Class, Sex), 
                  fill = Survived)) + 
  xlab("Survived:Sex") + ylab("Class") + theme_igray() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))



# 나이와 성별, 선실별 생존

ggplot(TD) +
  geom_mosaic(aes(weight = Freq, 
                  x = product(Age, Sex), 
                  fill = Survived)) + 
  xlab("Survived:Sex") + ylab("Age") + theme_gdocs() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))



# 나이와 성별별 생존

ggplot(TD) +
  geom_mosaic(aes(weight = Freq, 
                  x = product(Class, Age, Sex), 
                  fill = Survived)) + 
  xlab("Class:Sex") + ylab("Survived:Age") + theme_gdocs() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))



















# Heatmap ####

TeamData <- read.csv("Read_Data/score.csv")

head(TeamData)

tail(TeamData)



# 행이름을 선수명으로 변경

row.names(TeamData) <- TeamData$name

TeamData <- TeamData[ , 2:12]

head(TeamData)



# 데이터 타입을 행렬로 변경
# 2~7열까지 10명 선수정보만 추출

TeamData_MX <- as.matrix(TeamData[1:10, 2:7])

TeamData_MX




# col = cm.colors(256)
# 파랑(cryn)에서 빨강(magenta)까지 색범위 지정
# scale = "column" : 열기준으로 최대최소값 설정

# 001

heatmap(TeamData_MX, Rowv = NA, Colv = NA,
        col = cm.colors(256), scale = "column",
        margin = c(5, 10))



# 002

heatmap(TeamData_MX, Rowv = NA, Colv = NA,
        col = heat.colors(256), scale = "column",
        margin = c(5, 10))



# 003

red_colors <- c("#ffd3cd", "#ffc4bc", "#ffb5ab", 
                "#ffa69a", "#ff9789", "#ff8978", 
                "#ff7a67", "#ff6b56", "#ff5c45", 
                "#ff4d34")
heatmap(TeamData_MX, Rowv = NA, Colv = NA,
        col = red_colors, scale = "column",
        margin = c(5, 10))



# 색상 팔레트 사용
# install.packages("RColorBrewer")

library(RColorBrewer)

# 004

heatmap(TeamData_MX, Rowv = NA, Colv = NA,
        col = brewer.pal(9, "Blues"), scale = "column",
        margin = c(5, 10))


















# Tree Map ####
# install.packages("treemap")

library(treemap)


TM <- read.csv("Read_Data/KBO.csv")

TM


treemap(TM, index = "Team", vSize = "HR")

treemap(TM, index = "Team", vSize = "HR",
        fontsize.labels = 25,
        fontcolor.labels = "white")

treemap(TM, index = "Team", vSize = "HR",
        fontsize.labels = 25,
        fontcolor.labels = "white",
        border.lwds = 7,
        border.col = "gray33")
        
treemap(TM, index = "Team", vSize = "HR",
        fontsize.labels = 25,
        fontcolor.labels = "white",
        border.lwds = 7,
        border.col = "gray33",
        title = "팀별 홈런",
        fontsize.title = 25)



# Sub-Group 지정

TM_Sub <- read.csv("Read_Data/KBO3.csv")

treemap(TM_Sub, 
        index = c("Name", "Hit"), 
        vSize = "value",
        fontsize.labels = c(25, 15),
        fontcolor.labels = c("white", "tan"),
        bg.labels = "transparent",
        border.lwds = c(8, 3),
        border.col = c("gray33", "white"),
        title = "선수별 성적",
        fontsize.title = 12)













# Bubble Chart ####

CRIME <- read.csv("Read_Data/crime.csv")

head(CRIME)





symbols(CRIME$burglary ~ CRIME$murder, 
        circles = CRIME$population)



symbols(CRIME$burglary ~ CRIME$murder, 
        circles = CRIME$population, 
        inches = 1, 
        fg = "red", 
        bg = "pink", 
        xlab = "Murder Rate", 
        ylab = "Burglary Rate")

text(CRIME$murder, CRIME$burglary,
     CRIME$state, cex = 0.6)





# 사각형 출력

symbols(CRIME$burglary ~ CRIME$murder, 
        squares = sqrt(CRIME$population),
        fg = "blue", 
        bg = "skyblue", 
        xlab = "Murder Rate", 
        ylab = "Burglary Rate")

text(CRIME$murder, CRIME$burglary,
     CRIME$state, cex = 0.6)









# Radar Chart ####
# install.packages("fmsb")

library(fmsb)

KBO <- read.csv("Read_Data/KBO4.csv")

KBO

radarchart(KBO)










# lattice 3D 그래프 ####
# install.packages("lattice")

library(lattice)

colnames(iris)

head(iris)

tail(iris)

cloud(data = iris,
      Petal.Length ~ Sepal.Length + Sepal.Width)







# plot3d( ) 동적3D 그래프 ####
# install.packages("rgl")

library(rgl)

# 왼쪽마우스 클릭 : 확대
# 오른쪽마우스 클릭 : 회전

plot3d(iris$Petal.Length ~ iris$Sepal.Length + iris$Sepal.Width,
       xlab = "Sepal.Length",
       ylab = "Sepal.Width",
       zlab = "Petal.Length")


















# etc ####

koo <- read.csv("Read_Data/PII.csv")


# geom_dotplot()
ggplot(koo, aes(x = Gender, fill = Gender)) + 
  geom_dotplot()



# coord_flip()

ggplot(koo, aes(x = Gender, fill = Gender)) + 
  geom_bar() + coord_flip()





# ggThemeAssistGadget()
# install.packages("ggThemeAssist")

library(ggThemeAssist)

KU <- ggplot(koo, aes(x = Height, y = Weight)) + 
              geom_point()

KU

ggThemeAssistGadget(KU)









# geom_point() ####

library(ggplot2)

head(iris)



ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point(colour = "darkblue", fill = "chocolate",
             shape = 21, size = 9,
             alpha = 0.5, stroke = 2)








# ggMarginal() ####
# install.packages("ggExtra")

library(ggplot2)
library(ggExtra)





# Data Frame

DF <- read.csv("Read_Data/PII.csv")



HW <- ggplot(DF, aes(x = Height, y = Weight, 
                     colour = BloodType, size = Height)) +
  geom_point() +
  theme(legend.position="none")


HW



# with marginal histogram

ggMarginal(HW, type = "histogram")



# marginal density

ggMarginal(HW, type = "density")



# marginal boxplot

ggMarginal(HW, type = "boxplot")









# Ring Plot ####

library(ggplot2)

# BD2 데이터 프레임

BD <- read.csv("Read_Data/KBO.csv")



BD2 <- BD[,c(2,7)]



# 추가 Column 생성

BD2$fraction <- BD2$HR / sum(BD2$HR)


BD2 <- BD2[order(BD2$fraction),]


BD2$ymax <- cumsum(BD2$fraction)


BD2$ymin <- c(0, head(BD2$ymax, n = -1))




# geom_rect()로 그래프 생성

ggplot(BD2, aes(ymax = ymax, ymin = ymin, 
                xmax = 6, xmin = 3, 
                fill = Team)) +
  geom_rect() +
  coord_polar(theta = "y") +
  xlim(c(0, 6)) +
  theme(panel.grid = element_blank()) +
  theme(axis.text = element_blank()) +
  theme(axis.ticks = element_blank()) +
  annotate("text", x = 0, y = 0, label = "팀별 홈런") +
  labs(title="")







