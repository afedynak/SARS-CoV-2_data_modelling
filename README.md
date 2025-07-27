# SARS-CoV-2 Wastewater Surveillance Modelling
This repository presents an analysis and modeling pipeline for wastewater-based epidemiology (WBE) in tracking SARS-CoV-2 concentrations in Ontario, Canada. The primary objective is to leverage wastewater data, including qPCR concentrations of N1 and N2 gene markers, to predict daily viral loads using advanced statistical and machine learning models.

## Key Features
Wastewater Data Analysis: Analysis of SARS-CoV-2 gene concentrations in wastewater from Guelph and Niagara Falls, Ontario.

Random Forest Regression: Machine learning approach used to predict daily SARS-CoV-2 concentrations in wastewater.

Model Evaluation: Comparison of Random Forest with traditional multivariable linear regression to highlight the strengths of non-linear modeling.

7-Day Rolling Average: Time series modeling and smoothing of daily cases to better identify trends.

## Objectives
To develop a robust machine learning model (Random Forest) for predicting SARS-CoV-2 concentrations in wastewater based on gene markers (N1, N2) and rolling averages.

To assess the impact of wastewater surveillance for public health monitoring and early detection of COVID-19 trends.

To compare traditional statistical methods with modern machine learning techniques to evaluate performance in complex data settings.

# Repository Contents

**data/**: Raw and processed data files
- **`sars_cov2_raw_data.csv`**: Original, unprocessed dataset containing daily SARS-CoV-2 concentrations in wastewater from multiple sites.
- **`sars_cov2_processed_data.csv`**: Cleaned and transformed dataset, ready for analysis and modeling.
  
**scripts/**: R scripts for data analysis and modeling
- **`data_preprocessing.R`**: Script for cleaning, merging, and transforming the raw data (e.g., handling missing values, aggregating by date).
- **`random_forest_analysis.R`**: R script to train and evaluate the Random Forest regression model for predicting SARS-CoV-2 concentrations.
- **`linear_regression_analysis.R`**: Script to perform multivariable linear regression analysis for comparison with Random Forest.

**figures/**: Saved figures from the analysis
- **`sars_cov2_trends.jpg`**: Visualization of SARS-CoV-2 concentration trends over time.
- **`predicted_vs_observed_sars_cov2.jpg`**: Scatter plot comparing predicted vs. observed SARS-CoV-2 concentrations.

**docs/**: Documentation for methods and repository usage
- **`methodology.pdf`**: A comprehensive guide explaining the methods used for data collection, preprocessing, modeling, and evaluation in this repository.
- **`usage_guide.md`**: Step-by-step instructions for setting up the repository, running the analysis, and reproducing the results.

## How to Use
Clone the repository:

```bash
git clone https://github.com/afedynak/SARS-CoV-2_data_modelling.git
```


## Install required R packages:

```R
install.packages(c("ggplot2", "randomForest", "dplyr", "zoo", "caret"))
```


## Citation
If you use or adapt this work, please cite:

A.A. Fedynak. (2025). Modeling and Analysis of Daily SARS-CoV-2 Concentrations in Wastewater in Ontario, Canada Using N1 and N2 Gene Targets and Random Forest Regression. <br>
DOI: https://dx.doi.org/10.6084/m9.figshare.29651705

## License
This project is licensed under the MIT License.
