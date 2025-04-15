###Read files from raw data repository
#Growthspeed analysis
#Calculate growth speed per day
# Calculate growth per day

install.packages("tidyverse")
install.packages("googlesheets4")
library("tidyverse")
library("googlesheets4")

#join tables for growth speed analysis
exp_growth_speed <-left_join(experiment_1_1, growth_speed_final)
growth_speed_analysis <- left_join(inoculum_1_1, exp_growth_speed)

print(growth_speed_analysis)

growth_speed_analysis|>
  group_by(species)

### Preparing tables for bacterial analysis

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
  select(id_treatment, species, cfu_ecoli_end, cfu_enterococcus_end, cfu_ecoli_start, cfu_enterococcus_start )

###Calculate log-change for each treatment
bacteria_analysis <- bacteria_selected|>
  mutate(log_change_ecoli= log10(cfu_ecoli_start/cfu_ecoli_end))|>
  mutate( log_change_enterococcus= log10(cfu_enterococcus_start/cfu_enterococcus_end))

glimpse(bacteria_analysis)

### Save bacteria analysis as csv in processed
write_csv(bacteria_analysis, "data/processed/bacteria_analysis.csv")  
write_rds(bacteria_analysis, "data/processed/bacteria_analysis.rds")
