### Coursera Exploratory data analysis course project 1
### Reconstruct plots using  "Individual household electric power consumption Data Set"

### Plot 2: Line graph of Global active power in kilowatts against time
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
png(filename = "plot2.png", width = 480, height = 480)

# Construct plot

with(plotdata, plot(Time, Global_active_power, type = "l",
                    ylab = "Global Active Power (kilowatts)", xlab = ""))

# close file device
dev.off()