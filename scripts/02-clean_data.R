#### Preamble ####
# Purpose: Clean Data
# Author: Group 109
# Date: October 2024
# Contact: junhan.zhang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

# Load the dataset and remove rows with missing values
melb_data_clean <- na.omit(melb_data)
current_year <- 2024
melb_data_clean <- melb_data_clean %>%
  mutate(BuildingAge = ifelse(!is.na(YearBuilt), current_year - YearBuilt, 0))

#### Save data ####
write_csv(melb_data_clean, "data/02-analysis_data/cleaned_data.csv")
