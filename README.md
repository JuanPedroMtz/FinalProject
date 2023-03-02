# FinalProject
## Project Overview

Dimovil is a company that commercializes electronic devices in the central and western regions of Mexico. The company has actually 30 branches where they sell different cell phone devices. Currently, Dimovil is trying to find a way to optimize his resources towards his most ideal inventory of phones based on a high turnover criteria. Using all the tools learned during the Data Analytics and Visualization boot camp, such as, Python, Postgres, Tableau and machine learning, the aim of this project consists in developing a model that generates a demand prediction based on different variables like: location, make, model and season.

## Description of the data

The data used for the first part of the project consisted in five different csv files: almacenes.csv, pdv_lineas.csv, productos.csv, stock_move.csv, and ventas_lineas.csv. The pdv_lineas.csv file consisted in a database that contained information about cash transactions in all of the branches. 

The transformation process of the pdv_lineas.csv file first consisted in the filtering of all the branchesm, so that we kept only the strings that started with "SUC". After that we searched for "False" values inside the dataframe, if those values were found they would be eliminated of the datarame. Once the data was cleaned, one column was splited into two separate columns in order o differentiate the information and manage it better. The final transformation to the dataframe was the filtering of the products by its description, this because we only are working with phones. 

All the remaining csv files had a similar transformation but with slight differences.

## Results

