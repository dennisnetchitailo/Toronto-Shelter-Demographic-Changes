#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Dennis Netchitailo
# Date: 26 September 2024 
# Contact: dennis.netchitailo@utoronto.ca 
# License: MIT
# Pre-requisites: Run the files "01-download_data.R" and "02-data_cleaning.R"
# Have the following libraries installed: "tidyverse"
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Test data ####

data <- read_csv("data/analysis_data/analysis_data.csv")

# Test for negative values
data$'returned_from_housing' |> min() >= 0
data$'returned_to_shelter' |> min() >= 0
data$'newly_identified' |> min() >= 0
data$'moved_to_housing' |> min() >= 0
data$'became_inactive' |> min() >= 0
data$'actively_homeless' |> min() >= 0 
data$'ageunder16' |> min() >= 0
data$'age16_24' |> min() >= 0
data$'age25_34' |> min() >= 0
data$'age35_44' |> min() >= 0
data$'age45_54' |> min() >= 0
data$'age55_64' |> min() >= 0
data$'age65over' |> min() >= 0
data$'gender_male' |> min() >= 0
data$'gender_female' |> min() >= 0
data$'gender_transgender_non_binary_or_two_spirit' |> min() >= 0

# Test for NA
all(is.na(data))

#Test Dates
all(data$date >= as.Date("2018-01-01") & data$date <= as.Date("2024-08-01"))
                                                            

