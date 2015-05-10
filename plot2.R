plot2 <- function(file) {
  pow <- read.table(file, header=T, sep=";")
  pow$Date <- as.Date(pow$Date, format="%d/%m/%Y")
  df <- pow[(pow$Date=="2007-02-01") | (pow$Date=="2007-02-02"),]
  
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("plot2.png has been saved in", getwd())
}