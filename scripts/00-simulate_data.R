#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Dennis Netchitailo [...UPDATE THIS...]
# Date: 22 September 2024
# Contact: dennis.netchitailo@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Simulate data ####
# [...ADD CODE HERE...]

set.seed(1129)

start_date <- as.Date("2018-01-01")
end_date <- as.Date("2024-08-01")

# Set the number of random dates you want to generate
number_of_events <- 80

data <-
  tibble(
    dates = as.Date(
      runif(
        n = number_of_events,
        min = as.numeric(start_date),
        max = as.numeric(end_date)
      ),
      origin = "1970-01-01"
    ),
    number_of_all_population = rpois(n = number_of_events, lambda = 80)
    
    
  )


#### Write_csv

write_csv(data, file = "data/raw_data/SimulationData.csv")



