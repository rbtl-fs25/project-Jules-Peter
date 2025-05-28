    Project Title: Fungal faecal sanitation
    Description: This project is analysing if fungi can be used as a treatment strategie to increase safety of re-use of human faeces.
    In this project scripts were created to analyse a generataed test data set. To have scripts prepared when real experimental data is coming in.
    Features: Checking mean growth speed and log10 change of E. coli and E. faeclies for normiality using q-q plot and Shapiro-Wilk test.
    Conducting statistical tests ANOVA and Tukey pairwise comparison for normally distributed data and Kruskal-Wallis and Dunn test for not normally distributed data.
    Installation/Setup: 1. Use the R/01-data_download.R to load the raw data in the corresponding folders
                        2. use R/02-data_cleaning.R to prepare the data set for analysis
                        3. Render rbtl_report_jules_peter.qmd
                        4. Oversee the analyzed data in the html output file
    License:CC0
    Contact/Support: jupeter@ethz.ch
    Credits/Acknowledgements: This project utilizes R, R-Studio, with the packages tidyverse, ggplot2, knitr, rstatix, dplyr, gt, googlesheets4
    Project Status: finished

