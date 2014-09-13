library(ggplot2)

data <- read.table("result.csv", header=TRUE, sep=",")

mean <- mean(data$count)
median <- median(data$count)
max <- max(data$count)

df <- data.frame(data, mean = mean, median = median, max = max)

ggplot(df, aes(x = date, y=count)) + geom_point()

mean_str <- paste("mean: ", mean(data$count))
sum_str <- paste("sum: ", sum(data$count))
pdf("myplot.pdf", width=30, height=5)

bp <- ggplot(data, aes(x=date, y=count)) + geom_point()
bp + theme(axis.text.x = element_text(angle=90, hjust=1, vjust=.5)) +
  annotate("text", x=10, y=80, label=mean_str) +  annotate("text", x=10, y=70, label=sum_str)
dev.off()
