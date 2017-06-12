library(ggplot2)

plot.dataframe <- function(dataframe) {
  ch1 = dataframe[,c(1,2)]
  ch2 = dataframe[,c(3,4)]
  ch3 = dataframe[,c(5,6)]
  
  print(
    ggplot() + 
      geom_line(data=ch1, aes(x=Time, y=Current, group = 1, color = "red"))  + 
      geom_line(data=ch2, aes(x=Time, y=Current, group = 1, color = "blue"))  + 
      geom_line(data=ch3, aes(x=Time, y=Current, group = 1, color = "chartreuce4"))  + 
      geom_smooth(data=ch1, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
      geom_smooth(data=ch2, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
      geom_smooth(data=ch3, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
      ggtitle("Chronoamperometry Data - Biological Replicates") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") +
      theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
      labs(color = "Channels\n") +
      scale_color_manual(labels = c("Channel 1", "Channel 2", "Channel 3"), values = c("indianred2", "mediumpurple2", "olivedrab3")) 
  
  )
}

plot.dataframe_reduced <- function(dataframe) {
  ch1 = dataframe[,c(1,2)]
  ch2 = dataframe[,c(3,4)]
  ch3 = dataframe[,c(5,6)]
  
  print(
    ggplot() + 
      geom_line(data=ch1, aes(x=Time, y=Current, group = 1, color = "red"))  + 
      geom_line(data=ch2, aes(x=Time, y=Current, group = 1, color = "blue"))  + 
      geom_line(data=ch3, aes(x=Time, y=Current, group = 1, color = "chartreuce4"))  + 
      #geom_smooth(data=ch1, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
      #geom_smooth(data=ch2, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
      #geom_smooth(data=ch3, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
      ggtitle("Chronoamperometry Data - Biological Replicates") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") +
      theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
      labs(color = "Channels\n") +
      scale_color_manual(labels = c("Channel 1", "Channel 2", "Channel 3"), values = c("indianred2", "mediumpurple2", "olivedrab3")) 
    
  )
}

## Plot the Data
#ggplot() + 
#  geom_line(data=ch1, aes(x=Time, y=Current, group = 1, color = "red"))  + 
#  geom_line(data=ch2, aes(x=Time, y=Current, group = 1, color = "blue"))  + 
#  geom_line(data=ch3, aes(x=Time, y=Current, group = 1, color = "chartreuce4"))  + 
#  geom_smooth(data=ch1, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
#  geom_smooth(data=ch2, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
#  geom_smooth(data=ch3, aes(x=Time, y=Current, group = 1, level = 0.9995))  + 
#  ggtitle("Chronoamperometry Data - Biological Replicates") + xlab("Time (Seconds)") + ylab("Current (microAmperes)") +
#  theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold")) +
#  labs(color = "Channels\n") +
#  scale_color_manual(labels = c("Channel 1", "Channel 2", "Channel 3"), values = c("indianred2", "mediumpurple2", "olivedrab3")) 

