

# Final Project
## Project Overview
Dimovil is a company that commercializes electronic devices in the central and western regions of Mexico. The company has 30 branches where they sell different cell phone devices. Currently, they are trying to find a way to optimize their resources towards their most ideal inventory of phones based on a high turnover criteria.
Using all the tools learned during the boot camp, such as, Python, Postgres, Tableau and machine learning, the aim of this project consists in developing a model that generates a demand prediction based on different variables like location, make, model and season.  

### Description of the data
Basically, we had 5 different csv files with data that we will have to analyze first to further clean them and organize them.
Each team member will be assigned to analyze and clean one data base to further merge them together using PostgreSQL.


The productos.csv databaser is the main database, in which we will base and connect the other databases. This is a database with all the products and categories that we want to model. With it we will filter the information we want from the other databases. The objective was to clean it, obtain just the categories that are meaningful to obtain and optimal inventory, and finnaly to drop duplicates. In this database we filtered all the categories to just have 'DISPOSITIVO / CELULAR / LIBRE' and 'DISPOSITIVO / CELULAR / TELCEL', so we just have those to start making our models. 


On the Ventas_linea.csv we first filtered all the branches that generate transactions. Therefore, we kept only the strings that started with “SUC” (it means branch in Spanish).
After that, we dropped all the false values within our data frame. Likewise, we split some combined (strings and integers) into two separate columns.
Then, we removed all the values from our description column that are not phones, such as: Screen protectors, USB flash drives, Power Adapters, SIM cards, Cases, cables, tablets, earphones, etc.

The transformation process of the pdv_lineas.csv file first consisted in the filtering of all the branches, so that we kept only the strings that started with "SUC". After that we searched for "False" values inside the data frame, if those values were found they would be eliminated of the data frame. Once the data was cleaned, one column was split into two separate columns in order o differentiate the information and manage it better. The final transformation to the data frame was the filtering of the products by its description, this because we only are working with phones. 

On the Almacenes (2).csv which is a data base that shows the 30 stores along with the main distribution center what we did was clean the information firstly by making sure that the stores where just shown once in data base, each store could have multiple locations depending on the status of the product. So what we did afterwards was split the string which looked like this [8, 'WCENT/Existencias'] and dividing it in the 2 different columns that we need , firstly the number which is the id of my location which will help us connect to the other data bases in the course of the project and then the name of that location so we could identify them in a more easy way.

Once each one of the tables were created, PostgreSQL was used to create and manage a database, and to merge all the tables in a single one to train the Machine Learning model, the final tables was named "ventas_almacenes". This final table was exported from PostgreSQL and modified using Jupyter Notebook to create the "final_ventas.csv". 

### Description of the communication protocols
Since day 1, our team has created a whatsapp group where we use to communicate to each other in daily basis and we keep everyone on the loop of this project's progress. Likewise, we established a weekly meeting schedule which consists in having team meetings via zoom every Tuesday, Thrusday and Sunday night to keep working on our project. 
In addition to that, we are using google drive to share some important documantation, as well as we have created an indiviual branch in our github final project repository. 
After every Thrusday meeting we establish short term goals for each team member to be accompish by our Sunday meeting. 

### Machine Learning Model
To make predictions for ideal inventory per phone brand, per branch and per month, we will need to prepare the data in a way that includes the month, branch, phone brand, and current inventory levels as features, and the target variable will be the ideal inventory levels.

#### Data and Machine Learning model application
The Machine Learning model employeed for our project was an Approximation model in order to predict the amount of cellphones that a branch would sell in the future. The "final_ventas.csv" file included 6 columns "name", "brand", "month", "qty", "price_unit", and "total_sales"; the first three columns were encoded using the "pd.get_dummies()", this in order to give only numerical information to our model. All the encoded data columns were renamed and the dataframe employeed was divided into and X and y dataframe. 

The input features defined for this model were "name", "brand", "month", while the target variable was qty.

#### Explanation of model choice, including limitations and benefits 
