## STAT 650 Assignment 5
## by Brendan Wakefield, March 9, 2018
## Adapted from: cgen.r (Caffein and Gender) and Tutorial 6 by CJ Schwartz

setwd("~/sfuvault/04 2018 Spring/STAT650/Asst5/")

options(useFancyQuotes=FALSE) # renders summary output corrects
options(width=200)
options(digits=3) # display at most 3 sig. digits

library(ggplot2)
library(lmerTest)
library(emmeans)
library(plyr)
library(car)
library(ggfortify)
library(grid)
library(gridExtra)

source("http://www.stat.sfu.ca/~cschwarz/Stat-650/Notes/MyPrograms/schwarz.functions.r")

###############################------- SECTION 1 -------######################################
# EXPERIMENTAL DESIGN
# Assign males and females to their student numbers (2=female, 1=male)
sample(c(rep(1, 8), rep(2, 8)), replace = FALSE)
# Assign run order by experimental slot number
sample(1:32, replace=FALSE)
# Assign mask treatment to student by run order (1=plain, 2=apple, 3=banana, 4=skunk)
trt.list <- lapply(1:4, function(n)sample(c(1:4), replace=FALSE))
trt.order <- as.vector(lapply(1:4, function(i)trt.list[[i]]))

# Read in the data
scent5.data <- read.csv('scent5.RawOut.csv', header=TRUE, as.is=TRUE, strip.white=TRUE)
# Don't forget to change Gender and Scent to factors
scent5.data$GenderF <- factor(scent5.data$Gender)
scent5.data$ScentF   <- factor(scent5.data$Scent)
scent5.data$Trt     <- with(scent5.data, interaction(Gender,Scent))
head(scent5.data)

# Create Box Plots
