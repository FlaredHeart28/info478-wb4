library(dplyr)
library(ggplot2)

data <- read.csv("./data/feed_america_data/prepped/state_data.csv")
data_2 <- read.csv("./data/usda_data/prepped/food_security_data.csv")




data$X..food.insecure.Children.in.HH.w.HH.Incomes.Below.185.FPL.in.2016 <- as.numeric(sub("%", "", data$X..food.insecure.Children.in.HH.w.HH.Incomes.Below.185.FPL.in.2016))

data$group <- "<=60% of Food Insecure Children w/ Income <185k"
data$group[data$X..food.insecure.Children.in.HH.w.HH.Incomes.Below.185.FPL.in.2016 > 60] <- ">60% of Food Insecure Children w/ Income <185k"

a4 <- ggplot(data) +
  geom_bar(aes(x=State.Name, y=data$X2017.Food.Insecurity.Rate, fill=group), stat = "Identity") +
  coord_flip() +
  ggtitle("Food Insecurity Rate by State") +
  xlab("State") +
  ylab("Food Insecurity Rate")

ggsave("../wb4-image.png", a4)
