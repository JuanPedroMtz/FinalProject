

# Final Project
## Project Overview
Dimovil is a company that commercializes electronic devices in the central and western regions of Mexico. The company has 30 branches where they sell different cell phone devices. Currently, they are trying to find a way to optimize their resources towards their most ideal inventory of phones based on a high turnover criteria.
Using all the tools learned during the boot camp, such as, Python, Postgres, Tableau and machine learning, the aim of this project consists in developing a model that generates a demand prediction based on different variables like location, make, model and season.  

## Description of the data
Basically, we had 5 different csv files with data that we will have to analyze first to further clean them and organize them.
Each team member will be assigned to analyze and clean one data base to further merge them together using PostgreSQL.


The productos.csv databaser is the main database, in which we will base and connect the other databases. This is a database with all the products and categories that we want to model. With it we will filter the information we want from the other databases. The objective was to clean it, obtain just the categories that are meaningful to obtain and optimal inventory, and finally to drop duplicates. In this database we filtered all the categories to just have 'DISPOSITIVO / CELULAR / LIBRE' and 'DISPOSITIVO / CELULAR / TELCEL', so we just have those to start making our models. 


On the Ventas_linea.csv we first filtered all the branches that generate transactions. Therefore, we kept only the strings that started with “SUC” (it means branch in Spanish).
After that, we dropped all the false values within our data frame. Likewise, we split some combined (strings and integers) into two separate columns.
Then, we removed all the values from our description column that are not phones, such as: Screen protectors, USB flash drives, Power Adapters, SIM cards, Cases, cables, tablets, earphones, etc.

The transformation process of the pdv_lineas.csv file first consisted in the filtering of all the branches, so that we kept only the strings that started with "SUC". After that we searched for "False" values inside the data frame, if those values were found they would be eliminated of the data frame. Once the data was cleaned, one column was split into two separate columns in order to differentiate the information and manage it better. The final transformation to the data frame was the filtering of the products by its description, this because we only are working with phones. 

On the Almacenes (2).csv which is a data base that shows the 30 stores along with the main distribution center what we did was clean the information firstly by making sure that the stores where just shown once in data base, each store could have multiple locations depending on the status of the product. So, what we did afterwards was split the string which looked like this [8, 'WCENT/Existencias'] and dividing it in the 2 different columns that we need , firstly the number which is the id of my location which will help us connect to the other data bases in the course of the project and then the name of that location so we could identify them in an easier way.

Once each one of the tables were created, PostgreSQL was used to create and manage a database, and to merge all the tables in a single one to train the Machine Learning model, the final tables was named "ventas_almacenes". This final table was exported from PostgreSQL and modified using Jupyter Notebook to create the "final_ventas.csv". 

## Description of the communication protocols
Since day 1, our team has created a WhatsApp group where we use to communicate to each other in daily basis and we keep everyone on the loop of this project's progress. Likewise, we established a weekly meeting schedule which consists in having team meetings via zoom every Tuesday, Thursday and Sunday night to keep working on our project. 
In addition to that, we are using google drive to share some important documentation, as well as we have created an individual branch in our GitHub final project repository. 
After every Thursday meeting, we establish short term goals for each team member to be accomplish by our Sunday meeting. 

## Machine Learning Model
To make predictions for ideal inventory per phone brand, per branch and per month, we will need to prepare the data in a way that includes the month, branch, phone brand, and current inventory levels as features, and the target variable will be the ideal inventory levels.

### Data and Machine Learning model application
The Machine Learning model employed for our project was an Approximation model in order to predict the number of cellphones that a branch would sell in the future. The "final_ventas.csv" file included 6 columns "name", "brand", "month", "qty", "price_unit", and "total_sales"; the first three columns were encoded using the "pd.get_dummies()", this in order to give only numerical information to our model. All the encoded data columns were renamed and the data frame employed was divided into and X and y data frame. 

The input features defined for this model were "name", "brand", "month", while the target variable was qty.

### Explanation of model choice, including limitations and benefits.

Three models were used and compered between them in order to choose which model performs better for our objective. The three models employed were Linear Regression, Random Forest Regression and XGBoost Regression. Before each model were implemented data was split into training and test sets, the size of this sets was 80% of the information for the training set and the remaining information for the test set.

#### Linear Regression:
This approach models a linear relationship between a dependent variable and one or more independent variables. The results we've provided indicate that the performance of the linear regression model is very poor.

•	The mean squared error (MSE) is extremely high at 3.2742749224648484e+26, indicating that the model's predictions are very far off from the actual values.

•	The root mean squared error (RMSE) is also very high at 18094957646993.4, which is an indicator of the average distance between the predicted and actual values.

•	The R-squared value is negative, which is a sign that the model is performing worse than the baseline (a horizontal line at the mean of the target variable).

![image](https://github.com/JuanPedroMtz/FinalProject/blob/main/Resources/Linear%20Regression.png)

These results suggest that the model is not a good fit for the data and that other modeling techniques may need to be explored. It's possible that the features used in the model are not sufficiently informative in predicting the target variable, or that a linear relationship is not appropriate for this problem.

#### Random Forest Regression:
This algorithm builds a large number of decision trees and combines their predictions to get a more accurate prediction. Random Forest Regression is useful when you have a large number of input variables, some of which may not be important, as it can automatically select the most important variables for the prediction. The proposed model used 100 estimators.

•	The mean squared error (MSE) is 131.10976772334294, which is better than the precious model, but it still indicates that the model's predictions are quite far off from the actual values.

•	The root mean squared error (RMSE) is 11.450317363433335, which is an indicator of the average distance between the predicted and actual values.

•	The R-squared value is 0.6761627333383604, this value explains to what extent the variance of one variable explains the variance of the second variable. So, in this case the value is positive but it is still far from being a good result to use in a prediction model.

![image](https://github.com/JuanPedroMtz/FinalProject/blob/main/Resources/Random%20Forest%20Regression.png)

#### XGBoost Regression: 
It is an implementation of machine learning algorithms under the Gradient Boosting framework. XGBoost provides a parallel tree boosting. The implemented model used a 'reg:squarederror' solver.

• The mean squared error (MSE) measures the average squared difference between the predicted and actual target values. A lower MSE indicates better performance, and our model achieved an MSE of 105.99, which suggests that it is making relatively accurate predictions.

•	The root mean squared error (RMSE) is simply the square root of the MSE and is easier to interpret in terms of the target variable's units. In this case, the RMSE is 10.29, which indicates that, on average, your model's predictions are within +/- 10.29 units of the actual target values.

• The R-squared (or coefficient of determination) measures how well the model's predictions fit the actual data compared to a simple baseline model that always predicts the mean of the target variable. An R-squared of 0 indicates that the model's predictions are no better than the baseline, while an R-squared of 1 indicates perfect fit. In this case, your model achieved an R-squared of 0.74, which suggests that it explains a significant portion of the variation in the target variable beyond what the baseline model could capture.

![image](https://github.com/JuanPedroMtz/FinalProject/blob/main/Resources/XGBoost%20Regression.png)

The XGBoost model seems to have performed better than both the linear regression and random forest models in terms of RMSE and R-squared values.
It's always a good idea to evaluate a model using multiple metrics and compare the results to make sure you are choosing the best one for your specific problem. Additionally, we could also try optimizing the hyperparameters of each model to see if you can improve their performance even further.

Overall, these results suggest that your XGBoost regression model is performing well and is able to make relatively accurate predictions on the test data. However, it's always important to consider the specific context and goals of your project when interpreting these metrics and evaluating your model's performance.

To improve the results of each of these models, more data could be necessary. It's important to point out that the data used were limited to a short amount of time, so if we would like to improve the results of our model more data could help us to improve the overall results.

#### Visualizations:
All the visualizations created from the data generated in our models can be find in:
https://public.tableau.com/app/profile/emilio.segura/viz/Dimovil_Bootcamp/Dashboard1?publish=yes
