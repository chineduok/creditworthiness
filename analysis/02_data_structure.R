library(dplyr)
class(train)
dim(train)
names(train)
str(train)
glimpse(train)

head(train)%>%View()

train%>%
  group_by(Purpose)%>%
  top_n(5, wt = `Credit-Amount`)%>%View()
