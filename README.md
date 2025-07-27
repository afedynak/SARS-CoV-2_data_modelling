# SARS-CoV-2 Wastewater Surveillance Modeling
This repository presents an analysis and modeling pipeline for wastewater-based epidemiology (WBE) in tracking SARS-CoV-2 concentrations in Ontario, Canada. The primary objective is to leverage wastewater data, including qPCR concentrations of N1 and N2 gene markers, to predict daily viral loads using advanced statistical and machine learning models.

## Key Features
Wastewater Data Analysis: Analysis of SARS-CoV-2 gene concentrations in wastewater from Guelph and Niagara Falls, Ontario.

Random Forest Regression: Machine learning approach used to predict daily SARS-CoV-2 concentrations in wastewater with high accuracy (R² = 0.96).

Model Evaluation: Comparison of Random Forest with traditional multivariable linear regression to highlight the strengths of non-linear modeling.

7-Day Rolling Average: Time series modeling and smoothing of daily cases to better identify trends.

## Objectives
To develop a robust machine learning model (Random Forest) for predicting SARS-CoV-2 concentrations in wastewater based on gene markers (N1, N2) and rolling averages.

To assess the impact of wastewater surveillance for public health monitoring and early detection of COVID-19 trends.

To compare traditional statistical methods with modern machine learning techniques to evaluate performance in complex data settings.

#  Repository Contents
data/: Raw and processed data of wastewater SARS-CoV-2 concentrations.

scripts/: R scripts for data preprocessing, statistical analysis, and model building.

figures/: Visualizations of SARS-CoV-2 trends, including daily cases, rolling averages, and predicted vs. observed values.

docs/: Documentation for methods and usage.

## How to Use
Clone the repository:

```bash
git clone https://github.com/your-username/repository-name.git
```


## Install required R packages:

```R
install.packages(c("ggplot2", "randomForest", "dplyr", "zoo", "caret"))
```


## Citation
If you use or adapt this work, please cite:

A.Fedynak. (2025). Modeling and Analysis of Daily SARS-CoV-2 Concentrations in Wastewater in Ontario, Canada Using N1 and N2 Gene Targets and Random Forest Regression. DOI: 10.6084/m9.figshare.29651705

## License
This project is licensed under the MIT License.
