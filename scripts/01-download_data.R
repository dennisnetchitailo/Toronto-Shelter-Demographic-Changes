#### Preamble ####
# Purpose: Downloads and saves the data from OpenTorontoData.
# Author: Dennis Netchitailo
# Date: 23 September 2024 
# Contact: dennis.netchitailo@utoronto.ca 
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
# [...UPDATE THIS...]

#### Download data ####
# [...ADD CODE HERE TO DOWNLOAD...]

package <- show_package("ac77f532-f18b-427c-905c-4ae87ce69c93")
package

resources <- list_package_resources("ac77f532-f18b-427c-905c-4ae87ce69c93")


datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

data <- filter(datastore_resources, row_number()==1) %>% 
  get_resource()


#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.

write_csv(data, "data/raw_data/raw_data.csv") 

