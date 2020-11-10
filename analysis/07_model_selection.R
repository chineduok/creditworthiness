## Comparing the models
#Accuracy
fit.compare <-resamples(list(LogisticRegression = glmFit,Tree =treeFit,
                             Forest=rfFit, Boosted =gbmFit))
summary(fit.compare)

#ROC
fit.compare2 <-resamples(list(LogisticRegression = glmFit2,Tree =treeFit2,
                             Forest=rfFit2, Boosted =gbmFit2))
summary(fit.compare2)

# Based on the highest mean Accuracy of 78.42% and highest mean ROC of 77.54% 
#The Forest model performed better and will be selected for our prediction

theme1 <- trellis.par.get()
theme1$plot.symbol$col = rgb(.2, .2, .2, .4)
theme1$plot.symbol$pch = 16
theme1$plot.line$col = rgb(1, 0, 0, .7)
theme1$plot.line$lwd <- 2
trellis.par.set(theme1)
bwplot(fit.compare2, layout = c(3, 1))


trellis.par.set(caretTheme())
dotplot(fit.compare2, metric = "ROC")


splom(fit.compare2)
