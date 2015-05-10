plot1 <- function(file) {
  
  pow <- read.table(file, header=T, sep=";")
  pow$Date <- as.Date(pow$Date, format="%d/%m/%Y")
  
  df <- pow[(pow$Date=="2007-02-01") | (pow$Date=="2007-02-02"),]
  
  df$Global_active_pow <- as.numeric(as.character(df$Global_active_pow))
  
  hist(df$Global_active_pow, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("Plot1.png has been saved in", getwd())
}