library(tidyverse)
library(glmnet)

# Sim setting
iters <- 1000
f_hat <- vector("list", iters)     # create a empty list

# Model of the world
vars <- 10    # 10 variables in the world
model_vars <- 3

rep(1, model_vars)  #sequence of ones
rep(0, vars - model_vars)

beta <- c(rep(1, model_vars), rep(0, vars - model_vars))
beta

paste0("x", 1:vars)
paste0("x", 1:vars, collapse = " + ")
paste("y ~", paste0("x", 1:vars, collapse = " + "))

form <- paste("y ~", paste0("x", 1:vars, collapse = " + ")) %>%
  as.formula()

 # build x0 which is a dataframe x1=1, x2=1, x3 =1, ..., x10 = 1)
x0 <- tibble(id = 1, names = 1:vars) %>%
  pivot_wider(id_cols = id, names_from = names,
              values_from = value, names_prefix = "x")
x0

lm <- lm(form, sim_data)
predict(lm, newdata = x0)

set.seed(123)

sum(1,1,1)
