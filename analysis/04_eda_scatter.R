# investigating collinearity

sc.plt1 <- train%>%
  ggplot(aes(x = Credit.Amount, y = Duration.of.Credit.Month, 
             color = Credit.Application.Result))+
  geom_point(alpha=0.5, size =3)+
  scale_y_log10()+ scale_x_log10()+
  scale_fill_brewer(palette = 'Dark2')+
  xlab('Credit Amount')+ylab('Duration of Credit (Months)')+
  ggtitle('Scatter Plot Credit Amount vs Duration of Credit')


sc.plt2 <- train%>%
  ggplot(aes(x = Credit.Amount, y = Age.years, 
             color = Credit.Application.Result))+
  geom_point(alpha=0.5, size =3)+
  scale_y_log10()+ scale_x_log10()+
  scale_fill_brewer(palette = 'Dark2')+
  xlab('Credit Amount')+ylab('Age (Years)')+
  ggtitle('Scatter Plot Credit Amount vs Age of Loan Applicant')

sc.plt3 <- train%>%
  ggplot(aes(x = Duration.of.Credit.Month, y = Age.years, 
             color = Credit.Application.Result))+
  geom_point(alpha=0.5, size =3)+
  scale_y_log10()+ scale_x_log10()+
  scale_fill_brewer(palette = 'Dark2')+
  xlab('Duration of Credit (Months)')+ylab('Age (Years)')+
  ggtitle('Scatter Plot Duration of Credit vs Age of Loan Applicant')

grid.arrange(sc.plt1, sc.plt2, sc.plt3)


sc.plt4 <- train%>%filter(Credit.Application.Result=='Creditworthy' )%>%
  ggplot(aes(x = Credit.Amount, y = Age.years, 
             color = Purpose))+
  geom_point(alpha=0.5, size =3)+
  scale_y_log10()+ scale_x_log10()+
  scale_fill_brewer(palette = 'Dark2')+
  xlab('Credit Amount')+ylab('Age (Years)')+
  ggtitle('Scatter Plot of Credit Amount vs Age of "Creditworthy"Loan Applicant 
            ')+ 
  theme_light()

sc.plt5 <- train%>%filter(Credit.Application.Result=='Non.Creditworthy' )%>%
  ggplot(aes(x = Credit.Amount, y = Age.years, 
             color = Purpose))+
  geom_point(alpha=0.5, size =3)+
  scale_y_log10()+ scale_x_log10()+
  scale_fill_brewer(palette = 'Dark2')+
  xlab('Credit Amount')+ylab('Age (Years)')+
  ggtitle('Scatter Plot of Credit Amount vs Age of "Non-Creditworthy"Loan Applicant 
            ') +
  theme_dark()

grid.arrange(sc.plt4, sc.plt5)

sc.plt6 <- train%>%filter(Credit.Application.Result=='Creditworthy' )%>%
  ggplot(aes(x = Credit.Amount, y = Age.years, 
             color = Value.Savings.Stocks))+
  geom_point(alpha=0.5, size =3)+
  scale_y_log10()+ scale_x_log10()+
  scale_fill_brewer(palette = 'Dark2')+
  xlab('Credit Amount')+ylab('Age (Years)')+
  ggtitle('Scatter Plot of Credit Amount vs Age of "Creditworthy"Loan Applicant 
            ')+ 
  theme_light()

sc.plt7 <- train%>%filter(Credit.Application.Result=='Non.Creditworthy' )%>%
  ggplot(aes(x = Credit.Amount, y = Age.years, 
             color = Value.Savings.Stocks))+
  geom_point(alpha=0.5, size =3)+
  scale_y_log10()+ scale_x_log10()+
  scale_fill_brewer(palette = 'Dark2')+
  xlab('Credit Amount')+ylab('Age (Years)')+
  ggtitle('Scatter Plot of Credit Amount vs Age of "Non-Creditworthy"Loan Applicant 
            ') +
  theme_dark()

grid.arrange(sc.plt6, sc.plt7)