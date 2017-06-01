library(reshape2)
library(tidyverse)

full.dataset <- function(dataframe_raw) {
  dataframe = dataframe_raw[-c(1),]
  x_name <- "Time"
  y_name <- "Current"
  names(dataframe) <- c(x_name,y_name,x_name,y_name,x_name,y_name)
  ch1 = dataframe[,c(1,2)]
  ch2 = dataframe[,c(3,4)]
  ch3 = dataframe[,c(5,6)]
  return(dataframe)
}


reduced.dataset <- function(dataframe_raw) {
  dataframe = dataframe_raw[-c(1),]
  reduced_dataframe = dataframe[-c(0:1000),]
  x_name <- "Time"
  y_name <- "Current"
  names(reduced_dataframe) <- c(x_name,y_name,x_name,y_name,x_name,y_name)
  ch1 = reduced_dataframe[,c(1,2)]
  ch2 = reduced_dataframe[,c(3,4)]
  ch3 = reduced_dataframe[,c(5,6)]
  return(reduced_dataframe)
}

## Munge the Excel File
#dataframe = dataframe_raw[-c(1),]
#x_name <- "Time"
#y_name <- "Current"
#names(dataframe) <- c(x_name,y_name,x_name,y_name,x_name,y_name)
#ch1 = dataframe[,c(1,2)]
#ch2 = dataframe[,c(3,4)]
#ch3 = dataframe[,c(5,6)]

## Remove The Stabilization Region of Chronamperometric Graph
#reduced_dataframe = dataframe[-c(0:1000),]
#ch1r = reduced_dataframe[,c(1,2)]
#ch2r = reduced_dataframe[,c(3,4)]
#ch3r = reduced_dataframe[,c(5,6)]