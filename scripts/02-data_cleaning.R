#### Preamble ####
# Purpose: Cleans the "Toronto  Shelter System Flow" data 
# downloaded as "01-download_data.R".
# Author: Dennis Netchitailo
# Date: 26 September 2024 
# Contact: dennis.netchitailo@utoronto.ca 
# License: MIT
# Pre-requisites: Run the file "01-download_data.R"

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(janitor)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  rename(date_dmy = date_mmm_yy)

cleaned_data <-
  cleaned_data |>
  mutate(date_dmy = dmy(paste0("01-",cleaned_data$date_dmy)))
  print(cleaned_data$date_dmy)

#Remove unnecessary rows & columns
cleaned_data <-
  cleaned_data |>
  remove_empty(c("rows", "cols"))

#Check if NA values exist
num_na <- sum(is.na(cleaned_data)) 
if (num_na == 0){
  print(paste("All data is available"))
} else{
    print(paste("Check missing values and decide what further steps\
                for cleaning"))
  }

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")

