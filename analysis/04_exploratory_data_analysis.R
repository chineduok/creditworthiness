summary(train)
bar_plots<- train%>%select(-`Duration-of-Credit-Month`,-`Credit-Amount`,-`Instalment-per-cent`,-`Age-years`)%>%
  gather(-`Credit-Application-Result`, key = "var",value = "value")%>%
  ggplot(aes(x = value, fill=`Credit-Application-Result`))+
  geom_bar()+
  facet_wrap(~var,scales = 'free') +
  theme_bw()
save(plots, file = "fig/bar_plots.fig")

low_variability_plots <-train%>%
  select(`Concurrent-Credits`,`Foreign-Worker`,Guarantors, `No-of-dependents`,
         Occupation)%>%
  gather(key ="var", value ="value")%>%
  ggplot(aes(x = value))+
  geom_bar() +
  facet_wrap(~var,scales = 'free') +
  theme_bw()
save(low_variability_plots, file ="fig/low_variability_plots.fig")

# Drop variables with low variability including telephone number

train_low_variability <- train%>%
  select(-`Concurrent-Credits`,-`Foreign-Worker`,
         -Guarantors,-`No-of-dependents`,-Occupation,-Telephone)

# Plotting boxplots
box_plots <-train%>%
  select(`Credit-Application-Result`,`Duration-of-Credit-Month`,`Credit-Amount`,
         `Instalment-per-cent`,`Age-years`)%>%
  gather(-`Credit-Application-Result`,key = "var",value = "value")%>%
  ggplot(aes(x = value,y = `Credit-Application-Result`, 
             fill=`Credit-Application-Result`))+
  geom_boxplot()+
  facet_wrap(~var,scales = 'free') +
  theme_bw()

save(box_plots, file = "fig/box_plts.fig")

save(train_low_variability,file ="rda/train_2.rda")