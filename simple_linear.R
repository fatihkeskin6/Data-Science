                        ### Regression Analysis ###

# Upload the dataset
install.packages('datarium')
library(datarium)
data('marketing',package = 'datarium')

# Upload of necessary libraries
install.packages('Amelia')
library(Amelia)
install.packages('corrplot')
library(corrplot)
install.packages('caret')
library(caret)

#Preprocessing
Head(marketing)
str(marketing)
missmap(marketing)
correlation<- cor(marketing) #Creating correlation values between columns
corrplot(correlation, method= 'color') #Creating visualized correlation map

#Creating test and train datasets
set.seed(100)
train_indexes<- createDataPartition(marketing$sales,p=0.8,list = F)
train_marketing<- marketing[train_indexes,]
test_marketing<- marketing[-train_indexes,]
nrow(test_marketing)
nrow(train_marketing)
#nrow: train_marketing > test_marketing is a must

#Creating model
model<- lm(sales~facebook,data = marketing)
summary(model)
summary(model)$coef
#stars on the line of 'Signif. codes:' means the significance of model, 3 is the best
#  MODEL = 11.17 + 0.202*facebook (facebook'a verilen reklam)

#Appyling model to new dataset of 1 and 1000 of facebook ad values

new_dataset <- data.frame(facebook=c(0,1000))
predict(model,new_dataset)
#        1         2 
#11.17397 213.66975 

#If we give facebook 0 for ad, our sale value is 11.17, If we give facebook 1000 for ad, our sale value is 213




