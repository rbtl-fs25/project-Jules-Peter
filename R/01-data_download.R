###This file will load the data into the raw folder

###install needed packages
library("tidyverse")
library("googlesheets4")

###Reading the files from google drive 
bacteria_1_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1McSNPNBHKzFB_rO39XHw6wTXRsa81-HBAM5tP5vicD8/edit?usp=drive_link")
experiment_1_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1_b1ZWjh_HEOkDq6cXnWLg7AWZ4pPo1yyCzESEFA7G-I/edit?usp=drive_link")
faeces_1_1 <- read_sheet("https://docs.google.com/spreadsheets/d/13989Xry9gG24fx4jVagXlzA72EJv_d2QsxogUl-8jQ0/edit?usp=drive_link")
growth_speed_1_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1Tv4JjurbPrUQyOatEn1Jdb8Ze_biEM2_E-fWjo3UbWc/edit?usp=drive_link")
inoculum_1_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1y0ZkTHQecAHVyPlak5AII1L1ZDVkS6Be4rwZk6LAJQg/edit?usp=drive_link")
dictionary <- read_sheet("https://docs.google.com/spreadsheets/d/1k_oQYACYyO3VeUZ3p8_7WpwCJgn5l3xVekfJubMF5C0/edit?usp=drive_link")



write_csv(bacteria_1_1, "data/raw/bacteria_1_1.csv")
write_csv(experiment_1_1, "data/raw/experiment_1_1.csv")
write_csv(faeces_1_1, "data/raw/faeces_1_1.csv")
write_csv(growth_speed_1_1, "data/raw/growth_speed_1_1.csv")
write_csv(inoculum_1_1, "data/raw/inoculum_1_1.csv")
write_csv(dictionary, "data/processed/dictionary")

###Writing the files in git hup directory follow up
