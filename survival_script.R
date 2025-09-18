
# Sample R code for Kaplan-Meier analysis

# Install and load necessary packages
# install.packages("survival")
# install.packages("survminer")
library(survival)
library(survminer)

# Sample data (replace with your actual data)
data <- data.frame(
  time = c(10, 20, 30, 15, 25, 35, 12, 22, 32, 18),
  event = c(1, 0, 1, 1, 0, 1, 0, 1, 0, 1),
  group = c("A", "A", "A", "B", "B", "B", "A", "A", "B", "B")
)

# Fit Kaplan-Meier survival curve
fit <- surv_fit(Surv(time, event) ~ group, data = data)

# Plot survival curve
ggsurvplot(fit, data = data,
           pval = TRUE, conf.int = TRUE,
           risk.table = TRUE, # Add risk table
           risk.table.col = "strata", # Color risk table by strata
           linetype = "strata", # Change line type by strata
           surv.median.line = "hv", # Add median survival lines
           ggtheme = theme_bw(), # Change ggplot2 theme
           palette = c("#E7B800", "#2E9FDF"))

# Print summary of the fit
summary(fit)
