MARS Model for Financial Data Analysis Project

This project aims to apply the MARS (Multivariate Adaptive Regression Splines) model using financial data to evaluate the model's performance. The focus is on developing a machine learning model to examine the relationship between Opening Gold Price, Real Interest Rate, and other macroeconomic indicators.

Dataset and Variables Used in the Project

The analysis used a dataset named Duzenlenmis_calısma_veri.csv, which includes the following variables:

![image](https://github.com/user-attachments/assets/ff7f1d91-2afd-4bab-8407-46d4e2e7c035)


The independent variables include opening prices of financial indexes and macroeconomic indicators, while the dependent variable is Acilis_Altin.
Method and Tools Used
The project followed these steps:
1. Data Preparation:

   -Data was split into independent (X) and dependent (y) variables.

   -Using the caret package, the data was divided into 80% training and 20% testing sets.

2. Building the MARS Model:

   -The earth package was used to build the MARS model with degree = 1, modeling the relationship between financial variables and gold prices.

   -pmethod = "forward" was used to perform forward selection to identify significant predictors.

3.Model Performance Evaluation:

- The model summary (summary) was examined to evaluate the significance of the coefficients.
- Variable importance was calculated using the evimp function.
  Predictions on test data were visualized to assess their alignment with actual values.

5.	Visualization:
o	Predictions and important variables were visualized using ggplot2 and plotmo packages.

MARS Model Results
Model Complexity and Performance
•	The MARS model selected 10 terms from candidate models containing 14 terms, and six predictors out of 11. This shows that the model effectively minimized unnecessary complexity while selecting key variables.
•	The model's R-squared value is 0.987, indicating it explains 98.7% of the variance in the Acilis_Altin variable. The Generalized R-Squared (GRSq) is also 0.987, demonstrating consistent, high accuracy.
•	The model’s GCV (Generalized Cross-Validation) value is 2879, and RSS (Residual Sum of Squares) is 561390.
Key Variables

![image](https://github.com/user-attachments/assets/63398188-2534-4eb4-8f31-e553231be564)


•	Analysis using evimp identified Acilis_Gumus, Acilis_NASDAQ, Acilis_Nikkei, Acilis_BIST, Reel_Faiz_Orani, and Acilis_Dolar as the most influential variables in predicting Acilis_Altin.
•	Acilis_Gumus holds the highest importance score (100%), followed by Acilis_NASDAQ (39.2%) and Acilis_Nikkei (21.0%). This indicates that gold prices are strongly correlated with other commodities and some stock indices.
Coefficient Significance
•	Regression results show all coefficients have a p-value less than 0.001, meaning they are statistically significant. Acilis_Gumus, Acilis_NASDAQ, Acilis_Nikkei, and Reel_Faiz_Orani are among the variables with a significant effect on gold prices.
•	For example, the coefficient of h(24180 - Acilis_Gumus) is -0.0738, suggesting that increases in silver price have a negative effect on gold price.
Model Validation and Fit

![image](https://github.com/user-attachments/assets/13b506bb-89e7-47c7-afd3-26a1c7cb85f0)


•	The F-statistic of the model is 1512, indicating that the model as a whole significantly explains variation in gold prices.
•	The Multiple R-squared is 0.9866, and the Adjusted R-squared is 0.9859, both showing high goodness of fit.
Project Requirements
To run this project, the following R packages are required:
•	caret
•	earth
•	dplyr
•	readxl
•	ggplot2
Additionally, the dataset file Duzenlenmis_calısma_veri.csv should be included in the same directory as the project.

