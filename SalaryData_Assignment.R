#Package Installation
install.packages("kernlab")
library(kernlab)

#Data Initialisation
train <- read.csv(file.choose())
test <- read.csv(file.choose())
View(train)

#Data Modification
train$Salary <- as.factor(train$Salary)
test$Salary <- as.factor(test$Salary)  

#Model Formation
model <- ksvm(Salary~.,data=train,kernel="rbfdot")

#Prediction  
pred1 <- predict(model,test)
b <- table(pred1,test$Salary)
sum(diag(b))/sum(b) #85% Accuracy
