library(ggplot2)
library(reshape2)

chronoglycerol1 <-read.table("/Users/Clayton/Documents/Rhodopseudomonas\ Analysis\ PaoloBPV/Negative\ Control\ No\ Substrate\ No\ Cells/Ch1.txt")
chronoglycerol2 <-read.table("/Users/Clayton/Documents/Rhodopseudomonas\ Analysis\ PaoloBPV/Negative\ Control\ No\ Substrate\ No\ Cells/Ch2.txt")
chronoglycerol3 <-read.table("/Users/Clayton/Documents/Rhodopseudomonas\ Analysis\ PaoloBPV/Negative\ Control\ No\ Substrate\ No\ Cells/Ch3.txt")

chronoglycerol1 <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/Tripple Replicate Fail/2017-05-12 Claytonch1.txt")
chronoglycerol2 <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/Tripple Replicate Fail/2017-05-12 Claytonch2.txt")
chronoglycerol3 <-read.table("~/Documents/Rhodopseudomonas Analysis PaoloBPV/Tripple Replicate Fail/2017-05-12 Claytonch3.txt")
ch1 = chronoglycerol1
ch2 = chronoglycerol2
ch3 = chronoglycerol3

# Channel 1 Data Setup

x = ch1[,1]
ch1x2 <- x[-c(0:10000, 15000:60001)]
y = ch1[,2]
ch1y2 <- y[-c(0:10000, 15000:60001)]
ch1x = ch1x2
ch1y = ch1y2
x_name <- "Time"
y_name <- "Current"
ch1df <- data.frame(ch1x,ch1y)
names(ch1df) <- c(x_name,y_name)

ggplot(data=ch1df, aes(x=Time, y=Current, group=1)) + geom_line() + geom_point() +
ggtitle("Chronoamperometry Data") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") +
geom_smooth(span=0.3)

# Channel 1 setup 2

x = ch1[,1]
ch1x2 <- x[-c(0:1000)]
y = ch1[,2]
ch1y2 <- y[-c(0:1000 )]
ch1x = ch1x2
ch1y = ch1y2
x_name <- "Time"
y_name <- "Current"
ch1df <- data.frame(ch1x,ch1y)
names(ch1df) <- c(x_name,y_name)


# channel 2 data setup
x = ch2[,1]
ch2x2 <- x[-c(0:1000)]
y = ch2[,2]
ch2y2 <- y[-c(0:1000 )]
ch2x = ch2x2
ch2y = ch2y2
x_name <- "Time"
y_name <- "Current"
ch2df <- data.frame(ch2x,ch2y)
names(ch2df) <- c(x_name,y_name)


# channel 3 data setup

x = ch3[,1]
ch3x3 <- x[-c(0:1000)]
y = ch3[,2]
ch3y3 <- y[-c(0:1000 )]
ch3x = ch3x3
ch3y = ch3y3
x_name <- "Time"
y_name <- "Current"
ch3df <- data.frame(ch3x,ch3y)
names(ch3df) <- c(x_name,y_name)

#multiplot setup (Current)
ggplot() + 
geom_line(data=ch1df, aes(x=Time, y=Current, group = 1, color = "red"))  + 
geom_line(data=ch2df, aes(x=Time, y=Current, group = 1, color = "blue"))  + 
geom_line(data=ch3df, aes(x=Time, y=Current, group = 1, color = "chartreuce4"))  + 
geom_smooth(data=ch1df, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
geom_smooth(data=ch2df, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
geom_smooth(data=ch3df, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
ggtitle("Chronoamperometry Data - Biological Replicates") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") +
theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
labs(color = "Channels\n") +
scale_color_manual(labels = c("Channel 1", "Channel 2", "Channel 3"), values = c("indianred2", "mediumpurple2", "olivedrab3")) 


#######################################################################################################################################


#multiplot setup (Depreciated)
ggplot() + 
geom_line(data=ch1df, aes(x=Time, y=Current, color = variable)) + geom_smooth(span=0.3) +
geom_line(data=ch2df, aes(x=Time, y=Current, color = variable))  + geom_smooth(span=0.3) +
geom_line(data=ch3df, aes(x=Time, y=Current, color = variable))  + geom_smooth(span=0.3) +
ggtitle("Chronoamperometry Data - Biological Replicates") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") 

#multiplot setup (Depreciated)
ggplot() + 
geom_smooth(data=ch1df, aes(x=Time, y=Current, group = 1, color = "blue"))  + 
geom_smooth(data=ch2df, aes(x=Time, y=Current, group = 1, color = "red"))  + 
geom_smooth(data=ch3df, aes(x=Time, y=Current, group = 1, color = "green"))  + 
ggtitle("Chronoamperometry Data - Biological Replicates") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") 


