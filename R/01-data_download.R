###This file will load the data into the raw folder

###install needed packages
library("tidyverse")
library("googlesheets4")

###Reading the files from google drive 
bacteria_1_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1ebVGUMhg8nP3Gw3SB31uc8O0oHBcpB5spuHSfflGB3Y/edit?usp=drive_link")
experiment_1_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1MomeP7Ze-__ckRGYnVc0vEGAYguyDYRCSwLjdqlNdo0/edit?usp=drive_link")
faeces_1_1 <- read_sheet("https://docs.google.com/spreadsheets/d/14D7pKH48NwMo57FGLHlRrPSq0tUb_e_OCZGtBfb3pfQ/edit?usp=drive_link")
growth_speed_1_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1_HANDFM0bu00BEnb98vUIvHjrrEzJmIhUPWiKvE4Pw0/edit?usp=drive_link")
inoculum_1_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1HOQQ1kHausy6wV6syHrEa-nih1btRHIXwTIr__fGrGA/edit?usp=drive_link")

###Writing the files in git hup directory follow up
