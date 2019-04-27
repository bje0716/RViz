# 테마 종류
# theme_base
# theme_calc
# theme_economist
# theme_excel
# theme_few
# theme_fivethirtyeight
# theme_gdocs
# theme_hc
# theme_par
# theme_pander
# theme_solarized
# theme_stata
# theme_tufte
# theme_wsj





# 필요 패키지 호출

library("ggplot2")
library("ggthemes")






# 데이터 읽어오기

DF <- read.csv("Read_Data/PII.csv")



# 객체에 지정 ####

p1 <- ggplot(DF, aes(x = Height, y = Weight, colour = BloodType)) +
  geom_point(size = 5) +
  ggtitle("Slam Dunk 101")









# Economist theme ####

p1 + theme_economist() + scale_colour_economist() +
  scale_y_continuous(position = "right")






# Solarized theme ####

p1 + theme_solarized() +
  scale_colour_solarized("blue")

p1 + theme_solarized(light = FALSE) +
  scale_colour_solarized("red")

p1 + theme_solarized_2(light = FALSE) +
  scale_colour_solarized("blue")










# Stata theme ####

p1 + theme_stata() + scale_colour_stata()







# Excel 2003 theme ####

p1 + theme_excel() + scale_colour_excel()

ggplot(diamonds, aes(x = clarity, fill = cut)) +
  geom_bar() +
  scale_fill_excel() +
  theme_excel()


# Pander Theme ####

p1 + theme_pander() + scale_colour_pander()

ggplot(diamonds, aes(x = clarity, fill = cut)) +
  geom_bar() +
  theme_pander() +
  scale_fill_pander()


# Paul Tol Scales ####

p1 + geom_smooth(method = "lm", se = FALSE) +
  scale_color_ptol() +
  theme_minimal()

ggplot(diamonds, aes(x = clarity, fill = cut)) +
  geom_bar() +
  scale_fill_ptol() +
  theme_minimal()










# Fivethirtyeight theme ####

p1 + geom_smooth(method = "lm", se = FALSE) +
  theme_fivethirtyeight()






# Tableau Scales ####

p1 + theme_igray() + scale_colour_tableau()

p1 + theme_igray() + scale_colour_tableau("colorblind10")





# Inverse Gray Theme ####

p1 + theme_igray()







# Stephen Few's Practical Rules for Using Color ####

p1 + theme_few() + scale_colour_few()







# Wall Street Journal ####

p1 + theme_wsj() + scale_colour_wsj("colors6", "")







# Base and Par Themes ####

p1 + theme_base()







# Par theme ####

par(fg = "blue", bg = "gray", col.lab = "red", font.lab = 3)

p1 + theme_par()





# GDocs Theme ####

p1 + theme_gdocs() + scale_color_gdocs()







# Calc Theme ####

p1 + theme_calc() + scale_color_calc()







# Highcharts theme ####

p1 + theme_hc() + scale_colour_hc()

p1 + theme_hc(bgcolor = "darkunica") +
  scale_colour_hc("darkunica")














# etc ####
# ggplot2 내장 데이터 사용

mpg
head(mpg)

# cty(도심주행 연비), hwy(고속도로주행 연비)
# displ(배기량/리터), drv(f:전륜, r:후륜, 4:4륜)
# model(자동차 모델), class(자동차 형식: 2인승, SUV, 소형)

ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()

ggplot(mpg, aes(x = displ, y = cty)) + geom_point()

ggplot(mpg, aes(x = displ, y = cty, colour = class)) + 
  geom_point(size = 3)

ggplot(mpg, aes(x = displ, y = cty, colour = class)) + 
  geom_point(size = 3) + facet_wrap(~ class, scales = "free")











# geom_smooth()
# 표준오차를 출력

ggplot(mpg, aes(x = displ, y = hwy)) + geom_point() +
  geom_smooth()

ggplot(mpg, aes(x = displ, y = hwy)) + geom_point() +
  geom_smooth(se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) + geom_point() +
  geom_smooth(method = "lm")









# geom_jitter() and geom_violin()

ggplot(mpg, aes(drv, hwy)) + geom_point()

ggplot(mpg, aes(drv, hwy)) + geom_jitter()

ggplot(mpg, aes(drv, hwy)) + 
  geom_jitter(width = 0.25)

ggplot(mpg, aes(drv, hwy)) + 
  geom_jitter(width = 0.25) +
  xlim("f", "r") +
  ylim(20, 30)

ggplot(mpg, aes(drv, hwy)) + 
  geom_jitter(width = 0.25, na.rm = TRUE) +
  xlim("f", "r") +
  ylim(NA, 30)

ggplot(mpg, aes(drv, hwy)) + geom_boxplot()

ggplot(mpg, aes(drv, hwy)) + geom_violin()








# geom_histogram and geom_freqpoly()

ggplot(mpg, aes(hwy)) + geom_histogram()

ggplot(mpg, aes(hwy)) + geom_freqpoly()





# binwidth로 간격값 변경
# 기본값은 데이터를 30개의 간격으로 나눔

ggplot(mpg, aes(hwy)) + geom_freqpoly(binwidth = 3)

ggplot(mpg, aes(hwy)) + geom_freqpoly(binwidth = 1)

ggplot(mpg, aes(displ, colour = drv)) +
  geom_freqpoly(binwidth = 0.5)

ggplot(mpg, aes(displ, fill = drv)) +
  geom_histogram(binwidth = 0.5) +
  facet_wrap(~ drv, ncol =1)







# 축수정

ggplot(mpg, aes(cty, hwy)) + 
  geom_point(alpha = 0.3)

ggplot(mpg, aes(cty, hwy)) + 
  geom_point(alpha = 0.3) +
  xlab("City driving(mpg)") +
  ylab("Highway driving(mpg)")

ggplot(mpg, aes(cty, hwy)) + 
  geom_point(alpha = 0.3) +
  xlab(NULL) +
  ylab(NULL)






# qplot()

qplot(displ, hwy, data = mpg)

qplot(displ, data = mpg)





# geom_area(), geom_path(), geom_polygon()

df <- data.frame(x = c(3, 1, 5), 
                 y = c(2, 4, 6),
                 label = c("a", "b", "c"))

p <- ggplot(df, aes(x, y, label = label)) +
  labs(x = NULL, y = NULL) +
  theme(plot.title = element_text(size = 12))

p + geom_line() + ggtitle("line")
p + geom_area() + ggtitle("area")
p + geom_path() + ggtitle("path")
p + geom_polygon() + ggtitle("polygon")






# 회귀선

ggplot(mpg, aes(displ, hwy, colour = factor(cyl))) +
  geom_point()

ggplot(mpg, aes(displ, hwy, colour = factor(cyl))) +
  geom_point() + geom_smooth(method = "lm")

ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() + 
  geom_smooth(aes(colour = "loess"), method = "loess", se = FALSE) +
  geom_smooth(aes(colour = "lm"), method = "lm", se = FALSE) +
  labs(colour = "Method")



# 통계 객체

# 권장

ggplot(mpg, aes(trans, cty)) +
  geom_point() +
  stat_summary(geom = "point", fun.y = "mean", colour = "red", size = 5)



# 미권장

ggplot(mpg, aes(trans, cty)) +
  geom_point() +
  geom_point(stat = "summary", fun.y = "mean", colour = "blue", size = 5)





# 146...
