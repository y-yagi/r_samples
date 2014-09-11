dates_count <- function(dates, element) {
  dates <- as.Date(as.vector(as.matrix(dates)), "%Y-%m-%dT%H:%M:%S")
  elements <- format(dates, element)
  date.frame(table(elements))$Freq
}


