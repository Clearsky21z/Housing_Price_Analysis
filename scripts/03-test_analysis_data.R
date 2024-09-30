# Load necessary library
library(ggplot2)

# Load the dataset and remove rows with missing values
melb_data <- read.csv("data/01-raw_data/melb_data.csv")
melb_data_clean <- na.omit(melb_data)

# Fit the linear regression model using the cleaned dataset
model <- lm(Price ~ Bedroom2 + Bathroom + Distance + Landsize + Type, data = melb_data_clean)

# Summary of the model
summary(model)


# Extract residuals and fitted values from the model
y_value <- resid(model)
x_value <- fitted(model)

# Plot Residuals vs Fitted Values
plot(x = x_value, y = y_value, main = "Residual vs Fitted", xlab = "Fitted", ylab = "Residuals")

# Residual plots for each numeric predictor using the cleaned dataset
plot(x = melb_data_clean$Bedroom2, y = y_value, main = "Residual vs Bedroom2",
     xlab = "Bedroom2", ylab = "Residual")

plot(x = melb_data_clean$Bathroom, y = y_value, main = "Residual vs Bathroom",
     xlab = "Bathroom", ylab = "Residual")

plot(x = melb_data_clean$Distance, y = y_value, main = "Residual vs Distance",
     xlab = "Distance", ylab = "Residual")

plot(x = melb_data_clean$Landsize, y = y_value, main = "Residual vs BuildingArea",
     xlab = "Landsize", ylab = "Residual")

# Residual plot for the categorical predictor "Type" using boxplot
boxplot(y_value ~ melb_data_clean$Type,
        main = "Residuals vs Type",
        xlab = "Type",
        ylab = "Residuals",
        col = "lightblue")

qqnorm(y_value)
qqline(y_value)

# Additional Condition Check: Response vs Fitted Values
# Extract fitted values from the model
fitted_values <- fitted(model)

# Extract the response variable (Price)
response_values <- melb_data_clean$Price

# Plotting the Response vs Fitted values to check additional condition
plot(x = fitted_values, y = response_values, main = "Response vs Fitted",
     xlab = "Fitted Values", ylab = "Price")

# Add a reference line (diagonal)
abline(a = 0, b = 1, lty = 2, col = "red")

# Commentary:
# If we observe random scatter along the red diagonal line, it indicates that there is no
# functional relationship violation. Any systematic deviation (such as curvature or clear pattern)
# might suggest some relationships are not properly captured by the linear model.

pairs(melb_data_clean[, c("Bedroom2", "Bathroom", "Distance", "Landsize")],
      main = "Pairwise Plots of Predictors",
      col = "pink")
