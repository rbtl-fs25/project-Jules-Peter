###Read files from raw data repository

###combining data frames for bacteria analysis between different species
bacterial_analysis <- inner_join(bacteria_1_1, experiment_1_1, by = "id_exp")

###Adding cfu/g coloumn
###Data needed bacterial analysis, inoculum, 
bacterial_analysis|>
mutate(cfu_g = counted*dilution/sample_weight)



###combining data frames for growth speed analysis, link  growthsepped to experiment data and to inoculum and faeces data.
###relevant coloumns, faecal_id, growth-speed, inoculum_substrate, inoculum_age, fungal_species
###goal compare growth speed between fungal species, within the same inoculum group
###Additional filtering could be about inoculum age

growthspeed_by_species <- inner_join(growth_speed_1_1
growth speed by inoculum <- join()




