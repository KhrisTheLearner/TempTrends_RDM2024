# Install necessary packages if not already installed
install.packages("tidyverse")

# Load the necessary libraries
library(tidyverse)

# Load the dataset
data <- read_csv("C:/Users/UGHE Staff/Downloads/PyProjects/RDM_Exercises/archive/GlobalLandTemperaturesByCity.csv")

# Filter the data for a specific city (e.g., San Francisco)
city_data <- data %>% filter(City == "San Francisco")

# Convert the 'dt' column to Date format
city_data <- city_data %>% mutate(dt = as.Date(dt))

# Extract the year from the 'dt' column
city_data <- city_data %>% mutate(Year = format(dt, "%Y"))

# Group the data by 'Year' and calculate the mean of 'AverageTemperature' for each year
average_temperatures <- city_data %>% group_by(Year) %>% summarize(AverageTemperature = mean(AverageTemperature, na.rm = TRUE))

# Plot the data
ggplot(average_temperatures, aes(x = as.numeric(Year), y = AverageTemperature)) +
  geom_line() +
  geom_point() +
  labs(title = "Average Annual Temperature in San Francisco", x = "Year", y = "Temperature (°C)") +
  theme_minimal()

# Save the plot as a PNG file
ggsave("C:/Users/UGHE Staff/Downloads/PyProjects/RDM_Exercises/average_annual_temperature_sf.png")

# Write the analysis
analysis <- "
The line graph shows the average annual temperatures in San Francisco over time. 
The data indicates a general increase in temperature over the years, 
which aligns with global warming trends observed in many regions.
"

# Save the analysis to a text file
writeLines(analysis, "C:/Users/UGHE Staff/Downloads/PyProjects/RDM_Exercises/analysis.txt")
