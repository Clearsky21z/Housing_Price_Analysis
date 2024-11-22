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

melb_data <- read.csv("/Users/clearsky21/Housing_Price_Analysis/data/01-raw_data/melb_data.csv")

# Load the dataset and remove rows with missing values
melb_data_clean <- na.omit(melb_data)

# Define the current year
current_year <- 2024

# Add BuildingAge and filter out rows with non-positive values
melb_data_clean <- melb_data_clean %>%
  mutate(
    BuildingAge = ifelse(!is.na(YearBuilt), current_year - YearBuilt, 0)
  ) %>%
  filter(
    Distance > 0,
    Landsize > 0,
    BuildingArea > 0,
    Price > 0,
    Propertycount > 0,
  )

#### Save data ####
write_csv(melb_data_clean, "data/02-analysis_data/cleaned_data.csv")

