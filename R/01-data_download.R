###This file will load the data into the raw folder

###install needed packages
install.packages("tidyverse")
install.packages("googlesheets4")
library("tidyverse")
library("googlesheets4")

###Reading the files from google drive 
bacteria_1_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1LGOmrLPlFZUEU4gXjfc9EzX8EB-_k9W2F9gMQ3K8huo/edit?usp=drive_link")
experiment_1_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1HRrUeZnLuuOFzQvdle4Wm1IgzZprEFPrlV-5HEcVgU0/edit?usp=drive_link")
faeces_1_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1yj4_VGf45YmPL-rADW9fG-bieRz0R-B6NNafTRnl7fs/edit?usp=drive_link")
growth_speed_1_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1-pIbs76X7ioAar68U0D1lmaUb9bBv3o3A3-3a6un5x0/edit?usp=drive_link")
inoculum_1_1 <- read_sheet("https://docs.google.com/spreadsheets/d/15DHORS051C1QRs6C-4zK1BKX6WpPUC1UEqBhKpEFuEg/edit?usp=drive_link")

###Writing the files in git hup directory follow up



