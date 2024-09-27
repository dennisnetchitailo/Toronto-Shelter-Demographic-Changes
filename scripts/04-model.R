#### Preamble ####
# Purpose: Models the population change and statistics about it. 
# Author: Dennis Netchitailo
# Date: 26 September 2024 
# Contact: dennis.netchitailo@utoronto.ca 
# License: MIT
# Pre-requisites: Run the files "01-download_data.R" and "02-data_cleaning.R"
# Have the following libraries installed: "tidyverse", "ggplot2", "dplyr"
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(ggplot2)
library(dplyr)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

### Model data ####


#Model 1 : Mean Proportion of Total Population by Gender 

all_population_data <- analysis_data %>% filter(population_group 
                                                == "All Population")

male_mean_all_pop <- mean(all_population_data$gender_male)
female_mean_all_pop <- mean(all_population_data$gender_female)
other_gender_mean_all_pop <- 
  mean(all_population_data$gender_transgender_non_binary_or_two_spirit)

df_gender <- data.frame(
  values = c(male_mean_all_pop, female_mean_all_pop, other_gender_mean_all_pop),
  groups = c("Male","Female","Other Genders")
)

mean_gender_all_pop <- ggplot(df_gender, aes(x="", y=values, fill=groups)) +
  geom_bar(stat="identity", width=1, color="black") +
  coord_polar("y", start=0) + 
  scale_fill_brewer(palette="Dark2")
  theme_void()

#### Save model 1 : Mean Proportion of Total Population by Gender ####
saveRDS(
  mean_gender_all_pop,
  file = "models/mean_gender_all_pop.rds"
)
  
  
#Model 2 : Change in Total Young Population
all_population_data <- analysis_data %>% filter(population_group 
                                                == "All Population")

change_age16_24 <- ggplot(all_population_data, aes(x = date_dmy, y = age16_24)) +
  geom_bar(stat = "identity") + labs(x = "Date", y = "Age 16-24", title = 
                                       "Change in the total shelter population of those Ages 16-24") + theme_minimal()


#### Save model 2 : Change in Total Young Population  ####
saveRDS(
  change_age16_24,
  file = "models/change_age16_24.rds"
)


#Model 3 : Change in Total  Population
all_population_data <- analysis_data %>% filter(population_group 
                                                == "All Population")

change_total_pop <- ggplot(all_population_data, aes(x = date_dmy, y = age16_24)) +
  geom_bar(stat = "identity") + labs(x = "Date", y = "Whole Population", title = 
                                       "Change in the total shelter population") + theme_minimal()


#### Save model 3  ####
saveRDS(
  change_total_pop,
  file = "models/change_total_pop.rds"
)
  

  ####################################
#d <- readRDS("models/mean_gender_all_pop.rds")
#b <- readRDS("models/change_age16_24.rds")
#c <- readRDS("models/change_total_pop.rds") 
  