# Final Project
## Project Overview
Dimovil is a company that commercializes electronic devices in the central and western regions of Mexico. The company has actually 30 branches where they sell different cell phone devices. Currently, they are trying to find a way to optimize their resources towards their most ideal  inventory of phones based on a high turnover criteria.
Using all the tools learned during the boot camp, such as, Python, Postgres, Tableau and machine learning, the aim of this project consists in developing a model that generates a demand prediction based on different variables like: location, make, model and season.  

### Description of the data
Basically, we had 5 different csv files with data that we will have to analyze first to further clean them and organize them.
Each team memeber will be assinged to analyze and clean one data base to further merge them together using postgres.

Ricardo Donoso:
On the Ventas_linea.csv we first filtered all the branches that generate transactions. Therefore, we kept only the strings that started with “SUC” (it means branch in Spanish).
After that, we dropped all the false values within our data frame. Likewise, we split some combined (strings and integers) into two separate columns .
Then, we removed all the values from our description column that are not phones, such as: Screen protectors, USB flash drives, Power Adapters, SIM cards, Cases, cables, tablets, earphones, etc.

Likewise, we performed similar activities with the Stock move.csv file.

#### Results
So, far we have clean our data and generated two new data frames which were exported as CSV files: ventas_linea_devices.csv and new_stock_move.csv

