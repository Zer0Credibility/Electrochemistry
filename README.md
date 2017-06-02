# Electrochemistry

This repository includes code that will:

1. Directly digest the output excel file from PalmSens MultiTrace potentiostat software.
2. Munge the data into a standard dataframe format
3. Plot the data using ggplot2

To do: 
1. Adjusting all baselines to zero
2. Implement integral calculation for chronoamperometric curves
3. t-test comparison between adjusted chronoamperometric normal curves

## Usage 

I have an included an example of how to use this repository in the Chronoamperometry_Substrate_Analysis.R file

The gist of the process is that excel file parsing, data munging, statistical analysis, and plotting have been broken into functions across multiple files so that additional functionality can be added for linear sweeps, cyclic voltammetry, etc without too much hastle. These functions are all called from the Chronoamperometry_Substrate_Analysis.R as needed. 

To use the code: 

Step 1: Adjust the path in the Chronoamperometry_Substrate_Analysis.R file.  
Step 2: Run the whole file

## Dependencies

1. ggplot2
2. readxl
3. reshape2
4. tidyverse
