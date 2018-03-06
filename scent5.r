## STAT 650 Assignment 5
## by Brendan Wakefield, March 9, 2018
## Adapted from: cgen.r by CJ Schwartz

# Set working directory:
setwd("~/sfuvault/04 2018 Spring/STAT650/Asst5/")

options(useFancyQuotes=FALSE) # renders summary output corrects

options(width=200)

# which libraries are needed
library(ggplot2)
library(lmerTest)
library(emmeans)
library(plyr)

# get the schwarz functions for summaries etc
source("http://www.stat.sfu.ca/~cschwarz/Stat-650/Notes/MyPrograms/schwarz.functions.r")


# Read in the data
##***part-readdatab;
sink('cgen-R-readdata.txt', split=TRUE)
cycle <- read.csv('caffeinegender.txt', header=TRUE, as.is=TRUE, strip.white=TRUE)
cat('*** Part of the raw data *** \n\n')
# Don't forget to change Gender and DoseF to factors
cycle$GenderF <- factor(cycle$Gender)
cycle$DoseF   <- factor(cycle$Dose)
cycle$Trt     <- with(cycle, interaction(Gender,Dose))
head(cycle)
##***part-readdatae;
sink()