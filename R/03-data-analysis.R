#This file is for data analysis

install.packages("rstatix")  # For ANOVA functions
library(tidyverse)
library(rstatix)

##################################################################################
###growth speed analysis 
##testing for normality within each group 

#Distribution of ctrl
distribution_ctrl <- growth_speed_analysis|>
  filter(species == "ctrl")

ggplot(distribution_ctrl, aes(sample = growth_speed)) +
  stat_qq() +
  stat_qq_line() +
  ggtitle("Q-Q Plot of Area Size") +
  theme_minimal()

# Plot the histogram for area_size for that species
ggplot(distribution_ctrl, aes(x = growth_speed)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Area Size for ctrl",
       x = "Area Size",
       y = "Frequency") +
  theme_minimal()

#Distribution of P. ostreatus replicates
distribution_postreatus <- growth_speed_analysis|>
  filter(species == "P. ostreatus")

ggplot(distribution_postreatus, aes(sample = growth_speed)) +
  stat_qq() +
  stat_qq_line() +
  ggtitle("Q-Q Plot of Area Size") +
  theme_minimal()

# Plot the histogram for area_size for that species
ggplot(distribution_postreatus, aes(x = growth_speed)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Area Size for ctrl",
       x = "Area Size",
       y = "Frequency") +
  theme_minimal()

#Distribution of P. ostreatus replicates
distribution_ccomatus <- growth_speed_analysis|>
  filter(species == "C. comatus")

ggplot(distribution_ccomatus, aes(sample = growth_speed)) +
  stat_qq() +
  stat_qq_line() +
  ggtitle("Q-Q Plot of Area Size") +
  theme_minimal()

### Data seems more or less normal distributed


ggplot(growth_speed_analysis,
       mapping=aes(x=species, y=growth_speed))+
  geom_boxplot()

growth_speed_anova <- growth_speed_analysis |>
  anova_test(growth_speed ~ species)  # Formula syntax
growth_speed_anova

tukey_results <- growth_speed_analysis |>
  tukey_hsd(growth_speed ~ species)
tukey_results
add_xy_position(x = "species")  # Auto-position labels

install.packages("ggpubr")
library(ggpubr)
ggboxplot(growth_speed_1_1, x = "species", y = "growth_speed", 
          add = "jitter", color = "Species")


##https://www.perplexity.ai/search/how-can-i-do-an-anova-in-r-ZkK58iR5SYOo5UmyXScREA 
## check to make testing for normailty easier

#################################################################################
###Bacterial analysis

### Read in processed csv file for bacterial analysis
bacteria_analysis<-read.csv("data/processed/bacteria_analysis.csv")

###Testing data for normal distribution e_coli 
ecoli_log <- bacteria_analysis|>
  select(species, log_change_ecoli)

shapiro_ecoli <- ecoli_log |>
  group_by(species)|>
  shapiro_test(log_change_ecoli)
print(shapiro_ecoli)

###qq-plot for each species 
ggplot(ecoli_log, aes(sample = `log_change_ecoli`)) +
  geom_qq() +
  facet_wrap(vars( species)) +
  geom_qq_line(color = "purple")

###Boxplot ecoli log change for analysing variance in the groups
ggplot(bacteria_analysis,
       mapping=aes(x=species, y=log_change_ecoli))+
  labs(title = "log change for E. coli",
       x = "Species",
       y = "Log10 change") +
  geom_boxplot()

###Anova and tukey test



