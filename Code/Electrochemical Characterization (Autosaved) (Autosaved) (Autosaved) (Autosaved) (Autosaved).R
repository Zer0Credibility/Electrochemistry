#install relevent library

install.packages("car")
library(car)
install.packages("ggplot2")
library(ggplot2)
install.packages("reshape2")
library(reshape2)

#Load the data sets

RhodoChronoAmperometry2 <- read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/R plot rhodo 07.11.16.csv")



LinSweepCh1 <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/2016-11-07 Rhodo mm+G+ur 1500uL 8.1OD660 Linear Sweep CH1.txt")

LinSweepCh2 <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/2016-11-07 Rhodo mm+G+ur 1500uL 8.1OD660 Linear Sweep CH2.txt")


LinSweepCh2P <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/2016-11-07 Rhodo mm+G+ur 1500uL 8.1OD660 Linear Sweep CH2 Linnear Sweep Potential.txt")
LinSweepCh2C <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/2016-11-07 Rhodo mm+G+ur 1500uL 8.1OD660 Linear Sweep CH2 Linnear Sweep Current.txt")

#chronoamperometry curve data setup

RCA1 <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/R plot rhodo 07.11.16.txt")
Chrono2 <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/chrono11-02.txt")

bigchrono <- (Chrono2*3)

plot(Chrono2, type="l", ylim=c(0,1.5), col="red", xlab="Time(seconds)", ylab="Current(microAmperes)", main="Comparison between Large and Small Device WT Rhodo 8.2 OD 660" )

plot(RCA1, type="l", ylim=c(0,1.5), col="red", xlab="Time(seconds)", ylab="Current(microAmperes)", main="Comparison between Large and Small Device WT Rhodo 8.2 OD 660" )

lines(RCA1,col="blue")

# using ggplot2
library(ggplot2)

glucose_2umol_chrono_ch1 <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/ch1_2017-05-12_chronoamperometry_glucose_2mmol.txt")
glucose_2umol_chrono_ch2 <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/ch2_2017-05-12_chronoamperometry_glucose_2mmol.txt")
glucose_2umol_chrono_ch3 <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/ch3_2017-05-12_chronoamperometry_glucose_2mmol.txt")
Chrono2 <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/chrono11-02.txt")

ggplot(data=glucose_2umol_chrono_ch1, aes(x=x2, y=y2, group=1)) + geom_line() + geom_point()
ggplot(data=glucose_2umol_chrono_ch2, aes(x=V1, y=V2, group=1)) + geom_line() + geom_point()
ggplot(data=glucose_2umol_chrono_ch3, aes(x=V1, y=V2, group=1)) + geom_line() + geom_point()
ggplot(data=Chrono2, aes(x=V1, y=V2, group=1)) + geom_line() + geom_point() + geom_smooth() + ggtitle("Chronoamperometry Data") + xlab("Time (Seconds)") + ylab("Current (microAmperes)")


ggplot(data=Chrono2, aes(x=V1, y=V2, group=1)) + geom_line() + geom_smooth(span=0.1) + ggtitle("Chronoamperometry 0.25 mL MFC Rhodopseudomonas paulustris OD 8.8 660 - GLYCEROL") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") + theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"))

ggplot(data=RCA1, aes(x=V1, y=V2, group=1)) + geom_line() + geom_smooth(span=0.1) + ggtitle("Chronoamperometry 1.3 mL MFC Rhodopseudomonas paulustris OD 8.8 660 - GLYCEROL") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") + theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"))




library(ggplot2)
library(reshape2)

chronoglycerol1 <-read.table("~/Documents/2017-05-12 Claytonch1.txt")
chronoglycerol2 <-read.table("~/Documents/2017-05-12 Claytonch2.txt")
chronoglycerol3 <-read.table("~/Documents/2017-05-12 Claytonch3.txt")
ch1 = chronoglycerol1
ch2 = chronoglycerol2
ch3 = chronoglycerol3
ch1x = ch1[,1]
ch2x = ch2[,1]
ch3x = ch3[,1]
ch1y = ch1[,2]
ch2y = ch2[,2]
ch3y = ch3[,2]
x_name <- "Time"
y_name <- "Current"
ch1df <- data.frame(ch1x,ch1y)
ch2df <- data.frame(ch2x,ch2y)
ch3df <- data.frame(ch3x,ch3y)
names(ch1df) <- c(x_name,y_name)
names(ch2df) <- c(x_name,y_name)
names(ch3df) <- c(x_name,y_name)

ggplot(data=ch1, aes(x=V1, y=V2, group=1)) + geom_line() + geom_smooth(span=0.1) + ggtitle("Chronoamperometry Data - Biological Replicates") + xlab("Time (Seconds)") + ylab("Current (microAmperes)")

ggplot() + 
+ geom_line(data=ch1df, aes(x=Time, y=Current)) + 
+ ggtitle("Chronoamperometry Data") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") +
+ geom_smooth(span=0.3)

#multiplot setup
ggplot() + 
geom_line(data=ch1df, aes(x=Time, y=Current, color = "red")) + geom_smooth(span=0.3) +
geom_line(data=ch2df, aes(x=Time, y=Current, color = "blue"))  + geom_smooth(span=0.3) +
geom_line(data=ch3df, aes(x=Time, y=Current, color = "green"))  + geom_smooth(span=0.3) +
ggtitle("Chronoamperometry Data - Biological Replicates") + xlab("Time (Seconds)") + ylab("Current (microAmperes)")

ggplot() + 
geom_line(data=ch1, aes(x=V1, y=V2, color = "blue")) + geom_smooth(span=0.3) +
geom_line(data=ch2, aes(x=V1, y=V2, color = "red"))  + geom_smooth(span=0.3) +
geom_line(data=ch3, aes(x=V1, y=V2, color = "green"))  + geom_smooth(span=0.3) +
ggtitle("Chronoamperometry Data - Biological Replicates") + xlab("Time (Seconds)") + ylab("Current (microAmperes)")

ggplot() + 
geom_line(data=ch1, aes(x=V1, y=V2, color = "blue")) + 
geom_line(data=ch2, aes(x=V1, y=V2, color = "red"))  + 
geom_line(data=ch3, aes(x=V1, y=V2, color = "green"))  + 
ggtitle("Chronoamperometry Data - Biological Replicates") + xlab("Time (Seconds)") + ylab("Current (microAmperes)")






melted = melt(chronoglycerol, id.vars="Seconds", value.name="value", variable.name="Year")

id.vars="Company", value.name="value", variable.name="Year"

plot.title = element_text(color="red", size=14, face="italic"),
axis.title.x = element_text(color="blue", size=14, face="bold"),
axis.title.y = element_text(color="#993333", size=14, face="bold")
####################################
# Channel 1 Data Setup

x = glucose_2umol_chrono_ch1[,1]
ch1x2 <- x[-c(0:5000)]
y = glucose_2umol_chrono_ch1[,2]
ch1y2 <- y[-c(0:5000 )]
ch1x = ch1x2
ch1y = ch1y2
x_name <- "Time"
y_name <- "Current"
ch1df <- data.frame(ch1x,ch1y)
names(ch1df) <- c(x_name,y_name)
#ggplot(data=ch1df, aes(x=Time, y=Current, group=1)) + geom_line() + geom_point() +
#ggtitle("Chronoamperometry Data") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") +
#geom_smooth(span=0.3)

# channel 2 data setup
x = glucose_2umol_chrono_ch2[,1]
ch2x2 <- x[-c(0:5000)]
y = glucose_2umol_chrono_ch2[,2]
ch2y2 <- y[-c(0:5000 )]
ch2x = ch2x2
ch2y = ch2y2
x_name <- "Time"
y_name <- "Current"
ch2df <- data.frame(ch2x,ch2y)
names(ch2df) <- c(x_name,y_name)
#ggplot(data=ch2df, aes(x=Time, y=Current, group=1)) + geom_line() + geom_point() +
#ggtitle("Chronoamperometry Data") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") +
#geom_smooth(span=0.3)

# channel 3 data setup

x = glucose_2umol_chrono_ch3[,1]
ch3x3 <- x[-c(0:5000)]
y = glucose_2umol_chrono_ch3[,2]
ch3y3 <- y[-c(0:5000 )]
ch3x = ch3x3
ch3y = ch3y3
x_name <- "Time"
y_name <- "Current"
ch3df <- data.frame(ch3x,ch3y)
names(ch3df) <- c(x_name,y_name)
#ggplot(data=ch3df, aes(x=Time, y=Current, group=1)) + geom_line() + geom_point() +
#ggtitle("Chronoamperometry Data") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") +
#geom_smooth(span=0.3)

#multiplot setup
ggplot() + 
geom_line(data=ch1df, aes(x=Time, y=Current, color = variable)) + geom_smooth(span=0.3) +
geom_line(data=ch2df, aes(x=Time, y=Current, color = variable))  + geom_smooth(span=0.3) +
geom_line(data=ch3df, aes(x=Time, y=Current, color = variable))  + geom_smooth(span=0.3) +
ggtitle("Chronoamperometry Data - Biological Replicates") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") 

#multiplot setup
ggplot() + 
geom_line(data=ch1df, aes(x=Time, y=Current, group = 1))  +
geom_line(data=ch2df, aes(x=Time, y=Current, group = 1))  +
geom_line(data=ch3df, aes(x=Time, y=Current, group = 1))  +
ggtitle("Chronoamperometry Data - Biological Replicates") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") 

##########################

ggplot() + 
geom_line(data=Chrono2, aes(x=V1, y=V2, group=1)) + 
ggtitle("Chronoamperometry Data") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") +
geom_smooth(span=0.3)

ggplot() +
geom_line(data = glucose_2umol_chrono_ch1, aes(x = V1, y = V2, color = "red")) +
geom_line(data = glucose_2umol_chrono_ch2, aes(x = V1, y = V2, color = "blue"))  +
geom_line(data = glucose_2umol_chrono_ch3, aes(x = V1, y = V2, color = "green"))  +
ggtitle("Chronoamperometry Data") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") +
geom_smooth(span=0.3)

ggplot() +
geom_line(data = ch1, aes(x = V1, y = V2, color = "red", group = 1)) +
geom_line(data = ch2, aes(x = V1, y = V2, color = "blue", group = 1))  +
geom_line(data = ch3, aes(x = V1, y = V2, color = "green", group = 1))  +
ggtitle("Chronoamperometry Data") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") +
geom_smooth(span=0.3)

##########################


# May 2017 Chronoamperometry Data

plot(RCA1, type="l", ylim=c(0,1.5), col="red", xlab="Time(seconds)", ylab="Current(microAmperes)", main="Comparison between Prior Data (red) and Current Data (blue)" )

glucose_2umol_chrono_ch1 <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/ch1_2017-05-12_chronoamperometry_glucose_2mmol.txt")
glucose_2umol_chrono_ch2 <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/ch2_2017-05-12_chronoamperometry_glucose_2mmol.txt")
glucose_2umol_chrono_ch3 <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/ch3_2017-05-12_chronoamperometry_glucose_2mmol.txt")

plot(glucose_2umol_chrono_ch1, type="l", ylim=c(0,1.5), col="red", xlab="Time(seconds)", ylab="Current(microAmperes)", main="2umol glucose - 1.3 mL MFC - 10 OD 660" )

lines(glucose_2umol_chrono_ch1,col="blue")
lines(glucose_2umol_chrono_ch2,col="blue")
lines(glucose_2umol_chrono_ch3,col="blue")

plot(glucose_2umol_chrono_ch3, type="l", ylim=c(0,1.5), col="red", xlab="Time(seconds)", ylab="Current(microAmperes)", main="2umol glucose - 1.3 mL MFC - 10 OD 660" )


#somerandom garbage

plot(LinSweepCh1)
lines(LinSweepCh2)

tester <-read.table("~/Documents/2016-11-07 Rhodo mm+G+ur 1500uL 8.1OD660 Linear Sweep CH2 Linnear Sweep Test.txt")

#positive vs negative control linear sweep 

ch1 <-read.table("~/Documents/Rhodo Linear Sweep Files R/Ch1 R.txt")
ch2 <-read.table("~/Documents/Rhodo Linear Sweep Files R/Ch2 R.txt")

plot(ch1, type="l", col="blue",main="Linear Sweep Rhodo WT 2016-11-07 vs Negative Control", xlab="Current (uA)", ylab="Potential(V)")
lines(ch2, col="red")

#Power curve
ch1P = (ch1[,1]*ch1[,2])
ch2P = (ch2[,1]*ch2[,2])
plot(ch1[,1],ch1P, type="l",col="blue", main="Power Curve Rhodo WT 2016-11-07 vs Negative Control", xlab="Current (uA)", ylab="Power (uW)")
lines(ch2[,1],ch2P, col="red")
