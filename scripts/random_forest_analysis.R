# Random Forest

covN1_data <- data %>% filter(type == "covN1")
covN2_data <- data %>% filter(type == "covN2")
colnames(covN1_data)[colnames(covN1_data) == "analysisDate"] <- "date"
colnames(covN2_data)[colnames(covN2_data) == "analysisDate"] <- "date"

covN1_data$date <- as.Date(covN1_data$date, format = "%Y-%m-%d")
covN1_data$log_N1 <- log(as.numeric(covN1_data$value))
covN2_data$date <- as.Date(covN2_data$date, format = "%Y-%m-%d")
covN2_data$log_N2 <- log(as.numeric(covN2_data$value))

# Merge the two datasets on both 'sampleID' and 'date'
merged_data <- covN1_data %>% left_join(covN2_data, by = c("sampleID", "date"))

niagara_combined <- subset(merged_data, grepl("^NF", sampleID))
niagara_combined <- niagara_combined %>% inner_join(niagara_hr, by = "date")

rf_data <- niagara_combined %>%
  select(value_daily, log_N1, log_N2, log_rolling_avg_7day) %>%
  filter(
    !is.na(log_N1), !is.na(log_N2), !is.na(value_daily),
    is.finite(log_N1), is.finite(log_N2), is.finite(value_daily)
  )

set.seed(123)  # for reproducibility> 

rf_model <- randomForest(value_daily ~ log_N1 + log_N2,
                         data = rf_data,
                         ntree = 500,
                         importance = TRUE)

print(rf_model)

# Optionally, plot the importance
varImpPlot(rf_model)

vif_model <- lm(log_rolling_avg_7day ~ log_N1 + log_N2 , data = rf_data)
vif(vif_model)

# Get variable importance
importance(rf_model)

# Plot variable importance
varImpPlot(rf_model)

# Set up a list of hyperparameters to tune
ntree_values <- c(100, 200, 500)
mtry_values <- c(1, 2, 3)

# Store the results of each model
results <- data.frame(ntree = integer(0), mtry = integer(0), RMSE = numeric(0))

# Loop through combinations of hyperparameters and fit models
for (ntree_value in ntree_values) {
  for (mtry_value in mtry_values) {
    rf_model <- randomForest(value_daily ~ log_N1 + log_N2,
                             data = rf_data,
                             ntree = ntree_value,
                             mtry = mtry_value)
    
    # Calculate RMSE (Root Mean Squared Error) for evaluation
    predictions <- predict(rf_model, rf_data)
    rmse <- sqrt(mean((predictions - rf_data$value_daily)^2))
    
    # Store results
    results <- rbind(results, data.frame(ntree = ntree_value, mtry = mtry_value, RMSE = rmse))
  }
}

# View the results
print(results)

# Find the best combination of hyperparameters
best_model <- results[which.min(results$RMSE),]
print(best_model)

# Fit the best Random Forest model with optimal hyperparameters
best_rf_model <- randomForest(value_daily ~ log_N1 + log_N2,
                              data = rf_data,
                              ntree = 100,    # Best number of trees
                              mtry = 3)       # Best number of variables per split

# Print the model summary
print(best_rf_model)

plot_data <- data.frame(Actual = rf_data$value_daily, Predicted = predictions_best)

# Plot using ggplot2
# Predictions using the trained model
predictions_best <- predict(best_rf_model, rf_data)
