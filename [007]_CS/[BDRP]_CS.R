# 조건문(흐름제어) ####

n <- 3

# Type1

if(n == 3){
  print("n은 3입니다.")
} else {
  print("n은 3이 아닙니다.")
}



# Type2

ifelse(n == 3, "n은 3.", "n은 5.")



n <- 5

# Type1

if(n == 3){
  print("n은 3입니다.")
} else {
  print("n은 3이 아닙니다.")
}



# Type2

ifelse(n == 3, "n은 3.", "n은 5.")





# 반복문(반복실행) ####
# for()

for(num in 1:10){ 
  print(num + num) 
}


for(num in c("A", "K", "Z")){
  print(num)
}


for(num in 3:7){
  print("Hello World")
}




# 반복문 + 조건문 ####

for(n in 1:4){
  if(n == 3){
    cat("입력된 값", n, "은/는 3 입니다. \n")
  } else {
    cat("입력된 값", n, "은/는 3이 아닙니다. \n")
  }
}











