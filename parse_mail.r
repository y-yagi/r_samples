library(ggplot2)
library(mailminer)

inbox_data <- read.table("inbox_data_enron.csv", header=TRUE, sep=",", quote='')
sent_data <- read.table("sent_data_enron.csv", header=TRUE, sep=",", quote='')

# day
# inbox_count <- dates_count(dates=inbox_data['date'], element='%d')
# sent_count <- dates_count(dates=sent_data['date'], element='%d')

# df <- data.frame(days=1:31, inbox=inbox_count, sent=sent_count)

# month
inbox_count <- dates_count(dates=inbox_data['date'], element='%m')
sent_count <- dates_count(dates=sent_data['date'], element='%m')

month_names <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
df <- data.frame(mths=factor(month_names, levels=month_names), inbox=inbox_count, sent=sent_count)


ggplot(data=df) + scale_shape_manual(name="Mailbox", values=c(2,3)) +
  geom_point(aes(x=mths, y=inbox, shape='inbox')) +
  geom_smooth(aes(x=mths, y=inbox, group=1)) +
  geom_point(aes(x=mths, y=sent, shape='sent')) +
  geom_smooth(aes(x=mths, y=sent, group=2)) +
  scale_y_continuous('number of emails') +
  scale_x_discrete('month')



