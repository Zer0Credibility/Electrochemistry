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
nc_file_name_extension <- ("NC_NC_NS.xlsx")
pc_file_name_extension <- ("Chron_V2_D3.xlsx")

#Put the file location(from working directory)
nc_file_location <- ("/Datasets/NC_NS_NC/")
pc_file_location <- ("/Datasets/PC_50umol/")

pc_dataframe_raw <- build.dataframe(pc_file_name_extension, pc_file_location)
nc_dataframe_raw <- build.dataframe(nc_file_name_extension, nc_file_location)

pc_dataframe <- full.dataset(pc_dataframe_raw)
nc_dataframe <- full.dataset(nc_dataframe_raw)

pc_reduced_dataframe <- reduced.dataset(pc_dataframe_raw)
nc_reduced_dataframe <- reduced.dataset(nc_dataframe_raw)

plot.dataframe(pc_dataframe)
plot.dataframe(nc_dataframe)

## Or plot after stabilization

#plot.dataframe_reduced(reduced_dataframe)
plot.dataframe_reduced(pc_reduced_dataframe)
plot.dataframe_reduced(nc_reduced_dataframe)






