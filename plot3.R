### Coursera Exploratory data analysis course project 1
### Reconstruct plots using  "Individual household electric power consumption Data Set"

### Plot 3: Line graph of energy sub metering 1, 2 and 3 against time
### for 1st to 2nd February 2007

# Download, extract and read in data

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./electric.zip")
unzip("./electric.zip")
electric <- read.table("./household_power_consumption.txt", sep = ";",
                       header = TRUE, na.strings = "?")

# convert Date and Time variables to date/time format
electric$Date <- as.Date(electric$Date, "%d/%m/%Y")
# first paste date and time together, otherwise strptime will use current date
electric$Time <- paste(electric$Date, electric$Time)
electric$Time <- strptime(electric$Time, "%Y-%m-%d %H:%M:%S")

# subset to use only data from dates 2007-02-01 and 2007-02-02

plotdata <- subset(electric, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# open PNG file device to save plot
png(filename = "plot3.png", width = 480, height = 480)

# Construct plot
with(plotdata, {
        plot(Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(Time, Sub_metering_2, col = "red")
        lines(Time, Sub_metering_3, col = "blue")
        } )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))



# close file device
dev.off()