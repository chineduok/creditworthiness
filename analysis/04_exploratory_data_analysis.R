train <- import('rda/train.rda')
glimpse(train)

# Plot distribution plots

dist.plt1 <- train%>%
  ggplot(aes(Credit.Amount, fill= Credit.Application.Result)) +
  geom_density(alpha=0.5, color ='black') +
  scale_fill_brewer(palette = 'Dark2') +
  scale_x_log10()+
  xlab('Credit Amount') + ylab('Frequency')+
  theme_bw()

dist.plt1

dist.plt2 <- train%>%
  ggplot(aes(Age.years, fill= Credit.Application.Result)) +
  geom_density(alpha=0.5, color ='black') +
  scale_fill_brewer(palette = 'Dark2') +
  scale_x_log10()+
  xlab('Age (years)') + ylab('Frequency')+
  theme_bw()

dist.plt2

dist.plt3 <- train%>%
  ggplot(aes(Duration.of.Credit.Month, fill= Credit.Application.Result)) +
  geom_density(alpha=0.5, color ='black') +
  scale_fill_brewer(palette = 'Dark2') +
  scale_x_log10()+
  xlab('Duration of Credit (Months)') + ylab('Frequency')+
  theme_bw()
grid.arrange(dist.plt1, dist.plt2, dist.plt3)

#corresponding boxplots

bx.plt1 <- train%>%
  ggplot(aes(Credit.Amount, fill= Credit.Application.Result)) +
  geom_boxplot(color ='black') +
  scale_fill_brewer(palette = 'Dark2') +
  scale_x_log10()+
  xlab('Credit Amount') + ylab('Frequency')+
  theme_bw()

bx.plt2 <- train%>%
  ggplot(aes(Age.years, fill= Credit.Application.Result)) +
  geom_boxplot(color ='black') +
  scale_fill_brewer(palette = 'Dark2') +
  scale_x_log10()+
  xlab('Age (years)') + ylab('Frequency')+
  theme_bw()

bx.plt3 <- train%>%
  ggplot(aes(Duration.of.Credit.Month, fill= Credit.Application.Result)) +
  geom_boxplot(color ='black') +
  scale_fill_brewer(palette = 'Dark2') +
  scale_x_log10()+
  xlab('Duration of Credit (Months)') + ylab('Frequency')+
  theme_bw()
grid.arrange(bx.plt1, bx.plt2, bx.plt3)


