# Fit multivariable linear regression

niagara_combined <- inner_join(niagara_combined_N1, niagara_combined_N2, by = c("sampleID", "date"))

# Join with niagara_hr
niagara_combined <- niagara_combined %>%
  inner_join(niagara_hr, by = "date")
fit_multi_niagara <- lm(value_daily ~ log_N1 + log_N2, data = niagara_combined)
summary_multi_niagara <- summary(fit_multi_niagara)

# Extract metrics
r2_multi <- round(summary_multi_niagara$r.squared, 3)
adj_r2_multi <- round(summary_multi_niagara$adj.r.squared, 3)
pval_N1 <- signif(summary_multi_niagara$coefficients["log_N1", 4], 3)
pval_N2 <- signif(summary_multi_niagara$coefficients["log_N2", 4], 3)

# Print summary and metrics
print(summary_multi_niagara)

cat("\n--- Multivariable Linear Regression Summary ---\n")
cat("R²       :", r2_multi, "\n")
cat("Adj R²   :", adj_r2_multi, "\n")
cat("P-value (log_N1):", pval_N1, "\n")
cat("P-value (log_N2):", pval_N2, "\n")

