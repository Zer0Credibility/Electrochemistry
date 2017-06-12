library(ggplot2)
library(readxl)
library(reshape2)

setwd("~/Documents/Electrochemistry/")


#Put the name of your file here including the extension
nc_file_name_extension <- ("NC_NC_NS.xlsx")
pc_file_name_extension <- ("Chron_V2_D2.xlsx")

#Put the file location(from working directory)
nc_file_location <- ("/Datasets/NC_NS_NC/")
pc_file_location <- ("/Datasets/PC_50umol/")

# The file needs to be in the working directory within a folder called "Datasets"
wd <- getwd()
path <- paste(wd, nc_file_location, sep = "")
directory <- paste(path, nc_file_name_extension, sep = "")
dataframe_raw <- read_excel(directory)
dataframe = dataframe_raw[-c(1),]
maxrow = nrow(dataframe)
dataframe = dataframe[-c(maxrow),]
reduced_dataframe = dataframe[-c(0:5000),]
nc_reduced_dataframe = reduced_dataframe #[-c(20000:60000),]

wd <- getwd()
path <- paste(wd, pc_file_location, sep = "")
directory <- paste(path, pc_file_name_extension, sep = "")
dataframe_raw <- read_excel(directory)
dataframe = dataframe_raw[-c(1),]
maxrow = nrow(dataframe)
dataframe = dataframe[-c(maxrow),]
reduced_dataframe = dataframe[-c(0:5000),]
pc_reduced_dataframe = reduced_dataframe[-c(20000:60000),]

x_name <- "Time"
y_name <- "Current"
names(pc_reduced_dataframe) <- c(x_name,y_name,x_name,y_name,x_name,y_name)
ch1 = pc_reduced_dataframe[,c(1,2)]
ch2 = pc_reduced_dataframe[,c(3,4)]
ch3 = pc_reduced_dataframe[,c(5,6)]

names(nc_reduced_dataframe) <- c(x_name,y_name,x_name,y_name,x_name,y_name)
ch4 = nc_reduced_dataframe[,c(1,2)]
ch5 = nc_reduced_dataframe[,c(3,4)]
ch6 = nc_reduced_dataframe[,c(5,6)]


ggplot() + 
  geom_line(data=ch1df, aes(x=Time, y=Current, group = 1, color = "red"))  + 
  geom_line(data=ch2df, aes(x=Time, y=Current, group = 1, color = "blue"))  + 
  geom_line(data=ch3df, aes(x=Time, y=Current, group = 1, color = "chartreuce4"))  + 
  geom_line(data=ch4, aes(x=Time, y=Current, group = 1, color = "red"))  + 
  geom_line(data=ch5, aes(x=Time, y=Current, group = 1, color = "blue"))  + 
  geom_line(data=ch6, aes(x=Time, y=Current, group = 1, color = "chartreuce4"))  + 
  
  geom_smooth(data=ch1df, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
  geom_smooth(data=ch2df, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
  geom_smooth(data=ch3df, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
  geom_smooth(data=ch4, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
  geom_smooth(data=ch5, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
  geom_smooth(data=ch6, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
  
  
  ggtitle("Chronoamperometry Data - Biological Replicates") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
  labs(color = "Channels\n") +
  
  scale_color_manual(labels = c("Channel 1", "Channel 2", "Channel 3", "Channel 4", "Channel 5", "Channel 6"), values = c("indianred2", "mediumpurple2", "olivedrab3","indianred2", "mediumpurple2", "olivedrab3")) +
  scale_x_discrete(breaks = seq(0, 50000, by = 10000)) +
  scale_y_discrete(breaks = seq(-3, 4, by = 0.1))





#######################################################################################################

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
ch1x2 <- x[-c(0:5000)]
y = ch1[,2]
ch1y2 <- y[-c(0:5000 )]
ch1x = ch1x2
ch1y = ch1y2
x_name <- "Time"
y_name <- "Current"
ch1df <- data.frame(ch1x,ch1y)
names(ch1df) <- c(x_name,y_name)


# channel 2 data setup
x = ch2[,1]
ch2x2 <- x[-c(0:1, 300:70000 )]
y = ch2[,2]
ch2y2 <- y[-c(0:1, 300:70000 )]
ch2x = ch2x2
ch2y = ch2y2
x_name <- "Time"
y_name <- "Current"
ch2df <- data.frame(ch2x,ch2y)
names(ch2df) <- c(x_name,y_name)

plot(ch2df, type="n", main = "Chronoamperometric Stabilization")
lines(ch2df)

# channel 3 data setup

x = ch3[,1]
ch3x3 <- x[-c(0:5000)]
y = ch3[,2]
ch3y3 <- y[-c(0:5000 )]
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


