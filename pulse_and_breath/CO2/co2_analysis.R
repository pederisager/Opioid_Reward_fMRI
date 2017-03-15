
co2data <- read.csv(file = "CO2/etCO2_paired.csv", header = TRUE, sep = ",")

# T-test of mean co2 values for eachsubject
t.test(co2data$mean_Co2[co2data$Drug=="mor"],co2data$mean_Co2[co2data$Drug=="pla"],paired = TRUE)


# Creating a long format dataset
co2data_long <- reshape(data = co2data,
        varying = c("timepoint11","timepoint10","timepoint9","timepoint8","timepoint7","timepoint6","timepoint5","timepoint4","timepoint3","timepoint2","timepoint1","timepoint0"),
        v.names = "values",
        timevar = "timepoints",
        times = c("timepoint11","timepoint10","timepoint9","timepoint8","timepoint7","timepoint6","timepoint5","timepoint4","timepoint3","timepoint2","timepoint1","timepoint0"),
        direction = "long")
# Sorting the data to fit the paired assumption of the t-test below
co2data_long <- co2data_long[order(co2data_long$Drug, co2data_long$subj),]


# t-test of all values from the data in long format
t.test(co2data_long$values[co2data_long$Drug=="mor"],co2data_long$values[co2data_long$Drug=="pla"],paired = TRUE)


#Violin plot of the raw data
library(ggplot2)

ggplot(data = co2data_long, aes(x = Drug, y = values, col = Drug)) +
  theme_minimal(base_size = 25) +
  geom_violin(aes(fill = Drug)) +
  theme(legend.key = element_rect(), legend.title=element_text(size=25), legend.text=element_text(size=20)) +
  labs(x = "Drug", y = "mysterious CO2 values")