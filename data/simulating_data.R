
## Generate fake dataset
dbh <- runif(1000, 5, 50)
hist(dbh)
#temp <- runif(10, 5, 20)
temp <- c(15.1, 18.0, 18.2, 20.4, 20.0, 20.1, 17.5, 11.6, 18.2, 19)
#temp.c <- temp - mean(temp)
plot.id <- seq(1:10)
plot <- sample(plot.id, 1000, replace=T,
               prob=c(0.4, 0.2, 0.11, 0.1, 0.1, 0.05, 0.02, 0.01, 0.005, 0.005))  # proportion of total trees in each plot
#intercs <- runif(10, 5, 20)   # varying intercepts: height when dbh = 0
intercs <- rnorm(10, 5 + 0.8*temp, 2)   # varying intercepts: height when dbh = 0
plot(temp, intercs)
height <- rnorm(1000, intercs[plot] + 0.6*dbh, 3)
plot(dbh, height)
sex <- sample(c("male", "female"), size=1000, replace=T)
dead <- rbinom(1000, 1, plogis(-4.5 + 0.04*dbh))
curve(plogis(-4.5 + 0.04*x), from=5, to=50)
trees <- data.frame(plot=plot, dbh=round(dbh, digits=2), height=round(height, digits=1), sex=sex, dead=dead)
write.csv(trees, file="trees.csv", row.names=F)
plotdata <- data.frame(plot=plot.id, temp=round(temp, digits=2))
write.csv(plotdata, file="plotdata.csv", row.names=F)

