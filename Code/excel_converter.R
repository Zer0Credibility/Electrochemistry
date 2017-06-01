library(readxl)

# The file needs to be in the working directory within a folder called "Datasets"
build.dataframe <- function(file_name, dataset_folder_name) {
  wd <- getwd()
  path <- paste(wd, dataset_folder_name, sep = "")
  directory <- paste(path, file_name, sep = "")
  dataframe_raw <- read_excel(directory)
  return(dataframe_raw)
}



## Import the Excel File
#local_path <- ("/Datasets/NC_NS_NC/Chronamperometry_NegC_NC_NS.xlsx")
#wd <- getwd()
#directory <- paste(wd, local_path, sep = "")
#dataframe_raw <- read_excel(directory)







