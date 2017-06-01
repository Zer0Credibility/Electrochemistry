wd <- getwd()
code <- ("/code/")
directory <- paste(wd, code, sep = "")
excel_converter <- paste(directory, "excel_converter.R", sep = "")
data_munging <- paste(directory, "data_munging.R", sep = "")
statistical_analysis <- paste(directory, "statistical_analysis.R", sep = "")
plotting <- paste(directory, "plotting.R", sep = "")

source(excel_converter)
source(data_munging)
source(statistical_analysis)
source(plotting)

#Put the name of your file here including the extension
file_name_extension <- ("NC_NC_NS.xlsx")

#Put the file location(from working directory)
file_location <- ("/Datasets/NC_NS_NC/")


dataframe_raw <- build.dataframe(file_name_extension, file_location)
dataframe <- full.dataset(dataframe_raw)
reduced_dataframe <- reduced.dataset(dataframe_raw)
plot.dataframe(dataframe)

## Or plot after stabilization

#plot.dataframe_reduced(reduced_dataframe)






