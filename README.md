

# Final Project
## Project Overview
Dimovil is a company that commercializes electronic devices in the central and western regions of Mexico. The company has 30 branches where they sell different cell phone devices. Currently, they are trying to find a way to optimize their resources towards their most ideal inventory of phones based on a high turnover criteria.
Using all the tools learned during the boot camp, such as, Python, Postgres, Tableau and machine learning, the aim of this project consists in developing a model that generates a demand prediction based on different variables like location, make, model and season.  

### Description of the data
Basically, we had 5 different csv files with data that we will have to analyze first to further clean them and organize them.
Each team member will be assigned to analyze and clean one data base to further merge them together using PostgreSQL.


This is the main database, in which we will base and connect the other databases. This is a database with all the products and categories that we want to model. With it we will filter the information we want from the other databases. The objective was to clean it, obtain just the categories that are meaningful to obtain and optimal inventory, and finnaly to drop duplicates. In this database we filtered all the categories to just have 'DISPOSITIVO / CELULAR / LIBRE' and 'DISPOSITIVO / CELULAR / TELCEL', so we just have those to start making our models. 

The analysis and cleaning process on Product.csv is where we will be able to query data from the rest of the tables. It includes all the products and categories that we want to model. Consequently, we will filter the information we want to show in the consolidated database. The objective is to clean, transform the data, and obtain the primary keys to farther merge the remaining tables.

On the Ventas_linea.csv we first filtered all the branches that generate transactions. Therefore, we kept only the strings that started with “SUC” (it means branch in Spanish).
After that, we dropped all the false values within our data frame. Likewise, we split some combined (strings and integers) into two separate columns.
Then, we removed all the values from our description column that are not phones, such as: Screen protectors, USB flash drives, Power Adapters, SIM cards, Cases, cables, tablets, earphones, etc.

The transformation process of the pdv_lineas.csv file first consisted in the filtering of all the branches, so that we kept only the strings that started with "SUC". After that we searched for "False" values inside the data frame, if those values were found they would be eliminated of the data frame. Once the data was cleaned, one column was split into two separate columns in order o differentiate the information and manage it better. The final transformation to the data frame was the filtering of the products by its description, this because we only are working with phones. 

Likewise, we performed similar activities with the Stock move.csv file, such as, we filter for false values inside data frames, split columns, drop null values and filter only for phone devices in de description column.

On the Almacenes (2).csv which is a data base that shows the 30 stores along with the main distribution center what we did was clean the information firstly by making sure that the stores where just shown once in data base, each store could have multiple locations depending on the status of the product. So what we did afterwards was split the string which looked like this [8, 'WCENT/Existencias'] and dividing it in the 2 different columns that we need , firstly the number which is the id of my location which will help us connect to the other data bases in the course of the project and then the name of that location so we could identify them in a more easy way.


