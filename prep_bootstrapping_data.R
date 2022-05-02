# read 100 frequent female names
library(tidyverse)
library(writexl)
names <- read.csv("data-input/names.csv")

nsample <- 100
samples <- tibble("obs_no" = c(1:nsample))

for (i in 1:20) {
  set.seed(i)  
  samp_idx <- sample(seq_len(nrow(names)), nsample, prob=names$'Počet', replace = TRUE)
  sample_i <- as.data.frame(names[samp_idx, 'Jména.ženská'])
  names(sample_i) <- paste0("sample_", i)
  samples <- bind_cols(samples,sample_i)
}


write_xlsx(samples, "data_various/name_samples.xlsx")

