#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(janitor)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")


cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  rename("date" = "date_mmm_yy")
  #Reformat Date
  #date <- 
  #select()
  # Count Missing Values
cleaned_data <-
  cleaned_data |>
  remove_empty(c("rows", "cols"))
  
sum(is.na(raw_data))



#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")

