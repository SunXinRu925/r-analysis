
library(png)
img <- readPNG("D:/r/r-analysis/spss/1.png")
plot(1:2, type = "n", xlab = "", ylab = "", main = "Display Image", axes = FALSE)
rasterImage(img, 1, 1, 2, 2)


View(example_excel)

#1.anxiety
#gender
library(tidyverse)
df1<-dplyr::select(example_excel,gender,anxiety)
df1<-dplyr::mutate(df1,gender=as.factor(gender))
base::summary(df1)
stats::t.test(data=df1,
              anxiety~gender,
              var.equal=TRUE)%>%
  capture.output()
#revenue
library(tidyverse)
df2<-dplyr::select(example_excel,revenue,anxiety)
df2<-dplyr::mutate(df2,revenue=as.factor(revenue))
base::summary(df2)
aov1<-stats::aov(data=df2,anxiety~revenue)
summary(aov1)

df3<-dplyr::select(example_excel,revenue,anxiety,gender)
df3<-dplyr::mutate(df3,revenue=as.factor(revenue),gender=as.factor(gender))
model <- lm(anxiety ~ gender * revenue, data = df3)
summary(model)
#spss
library(png)
img <- readPNG("D:/r/r-analysis/spss/2.png")
plot(1:2, type = "n", xlab = "", ylab = "", main = "Display Image", axes = FALSE)
rasterImage(img, 1, 1, 2, 2)

#2.behavior
df6<-dplyr::select(example_excel,revenue,gender,behavior)
df6<-dplyr::mutate(df6,revenue=as.factor(revenue),gender=as.factor(gender))
summary(df6)
res1<-bruceR::MANOVA(data=df6,
                     dv="behavior",
                     between = c("gender","revenue"))
#spss
library(png)
img <- readPNG("D:/r/r-analysis/spss/3.png")
plot(1:2, type = "n", xlab = "", ylab = "", main = "Display Image", axes = FALSE)
rasterImage(img, 1, 1, 2, 2)


#3.self-efficacy
df7<-dplyr::select(example_excel,revenue,gender,SE)
df7<-dplyr::mutate(df7,revenue=as.factor(revenue),gender=as.factor(gender))
res2<-bruceR::MANOVA(data=df7,
                     dv="SE",
                     between = c("gender","revenue"))
#spss
library(png)
img <- readPNG("D:/r/r-analysis/spss/4.png")
plot(1:2, type = "n", xlab = "", ylab = "", main = "Display Image", axes = FALSE)
rasterImage(img, 1, 1, 2, 2)


#4.
cor_matrix <- cor(example_excel[, c("anxiety", "SE","behavior1","behavior2",
                                    "behavior3","behavior")], method = "pearson")
print(cor_matrix)

# 
library(ggplot2)
library(reshape2)

cor_melted <- melt(cor_matrix)
ggplot(data = cor_melted, aes(Var1, Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, size = 12, hjust = 1),
        axis.text.y = element_text(size = 12)) +
  coord_fixed() +
  ggtitle("Pearson Correlation Matrix")
#spss
library(png)
img <- readPNG("D:/r/r-analysis/spss/5.png")
plot(1:2, type = "n", xlab = "", ylab = "", main = "Display Image", axes = FALSE)
rasterImage(img, 1, 1, 2, 2)
