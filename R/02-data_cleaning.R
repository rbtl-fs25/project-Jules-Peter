###Read files from raw data repository
#Growthspeed analysis
#Calculate growth speed per day
# Calculate growth per day

library("tidyverse")
library("googlesheets4")

######## Formatting the growth speed data showing are size change for each day#########
glimpse(growth_speed_1_1)

growth_speed_transformed <- growth_speed_1_1 |>
### Adding dpi calculated from starting date and picture date
  mutate(dpi = as.numeric(date -starting_date,
                          units = "days"))|>
  select(id_treatment, dpi, area_size)|>
### Make table wide putting all measured area sizes to the corresponding treatment choosing dpi as variable
  pivot_wider(names_from = dpi,
              values_from = area_size)

### change from area size per day to area size difference per day
# Define the column names to select (as characters because they start with numbers)
#To calculate difference between the time point, create two vectors to calculate the difference between days to select
current_day_cols <- as.character(1:9)
previous_day_cols <- as.character(0:8)

### Select the two sets of columns
df_current <- growth_speed_transformed |> 
  select(all_of(current_day_cols))
df_previous <- growth_speed_transformed |> 
  select(all_of(previous_day_cols))

### Subtract the data frames element-wise
diff_values <- df_current - df_previous

### Rename the columns of the result
names(diff_values) <- paste0("diff_", current_day_cols) # e.g., diff_1, diff_2

###Combine id column with the differences
growth_speed_area_increase <- growth_speed_transformed |>
  select(id_treatment) |>
  bind_cols(diff_values)
print(growth_speed_area_increase)

### join tables of the growth speed data
exp_growth_speed_inoculum_faeces <- experiment_1_1 |>
  left_join(growth_speed_area_increase) |>
  left_join(inoculum_1_1) |>
  left_join(faeces_1_1)|>
  ###Add column with inoculum age
  mutate(inoculum_age = as.numeric(starting_date - production_date,
                                   units = "days"))|>
  ###Add column with mean_growth_speed
  mutate(mean_growth_speed = rowMeans(across(starts_with("diff_"))))
glimpse(exp_growth_speed_inoculum_faeces)

### select coloumns according to research questions ( by inoculum substrate, species....)
growth_speed_analysis_long <- exp_growth_speed_inoculum_faeces |>
    # Gather columns diff_1 through diff_9
  pivot_longer(
    cols = starts_with("diff_"), # Selects all columns starting with "diff_"
    names_to = "time_period",   # New column for the original column name (e.g., "diff_1")
    values_to = "difference") |>   # New column for the numeric difference value)
  # Extract the numeric part from the time_period column for the x-axis
  mutate(
    time_step = parse_number(time_period) # Extracts number (1 from "diff_1", etc.)
  )|>
group_by(species)|>  # Group by species
  summarise(mean_diff_values = mean(parse_number(time_period), na.rm = TRUE), # Calculate the mean
            sd_diff_values = sd(parse_number(time_period), na.rm = TRUE)) # Calculate the standard deviation


### For mean growth speed and dependence on incoulum age and substrate 
growth_speed_analysis <- exp_growth_speed_inoculum_faeces|>
  select(species, material, inoculum_age, mean_growth_speed)
glimpse(growth_speed_analysis)


### Save growth speed as csv in processed
write_csv(growth_speed_analysis, "data/processed/growth_speed_analysis.csv")  
write_csv(growth_speed_analysis_long, "data/processed/growth_speed_analysis_long.csv")

############ Preparing tables for bacterial analysis ###############
bacteria_conc <- bacteria_1_1|>
  mutate(cfu_ecoli_end = ecoli_counted*dilution_ecoli/sample_weight)|>
  mutate(cfu_enterococcus_end = enterococcus_counted*dilution_enterococcus/sample_weight)

faeces_conc <- faeces_1_1|>
  mutate(cfu_ecoli_start = e_coli_counted*dilution_factor_ecoli/sample_weight)|>
  mutate(cfu_enterococcus_start = enterococcus_counted*dilution_factor_enterococcus/sample_weight)

exp_bacteria <-left_join(experiment_1_1, bacteria_conc, by="id_treatment")
bacteria_exp_faeces <- left_join(exp_bacteria, faeces_conc, by="id_faeces")
bacteria_joined <-left_join(bacteria_exp_faeces, inoculum_1_1)

### Select for relevant coloumns
bacteria_selected <- bacteria_joined |>
  select(id_treatment, species, cfu_ecoli_end, cfu_enterococcus_end, cfu_ecoli_start, cfu_enterococcus_start)

###Calculate log-change for each treatment
bacteria_analysis <- bacteria_selected|>
  mutate(log_change_ecoli= log10(cfu_ecoli_end/cfu_ecoli_start))|>
  mutate( log_change_enterococcus= log10(cfu_enterococcus_end/cfu_enterococcus_start))

glimpse(bacteria_analysis)

### Save bacteria analysis as csv in processed
write_csv(bacteria_analysis, "data/processed/bacteria_analysis.csv")  
write_rds(bacteria_analysis, "data/processed/bacteria_analysis.rds")

