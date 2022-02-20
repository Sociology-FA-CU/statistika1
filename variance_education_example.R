library(tidyverse)
library(scales)

cvvm = read_csv("https://raw.githubusercontent.com/alesvomacka/Uvod_do_analyzy_dat_v_R/master/data/cvvm_cerven_2019.csv",
                locale = locale(encoding = "Windows-1250"))

# IDE_10A je cisty osobni prijem. Jeste muzes zkusit IDE_10, coz je cisty prijem domacnosti

income_agg <- cvvm %>%
  select(IDE_10A, t_VZD) %>% 
  filter(!is.na(t_VZD)) %>% 
  mutate(IDE_10A = as.numeric(IDE_10A)) %>% 
  group_by(t_VZD) %>% 
  summarise(average = mean(IDE_10A, na.rm = TRUE),
            deviation = sd(IDE_10A, na.rm = TRUE),
            variance = var(IDE_10A, na.rm = TRUE))

cvvm %>% select(IDE_10A, t_VZD) %>% 
  filter(!is.na(t_VZD)) %>% 
  mutate(IDE_10A = as.numeric(IDE_10A)) %>% 
  ggplot(aes(x = t_VZD, y = IDE_10A)) +
  geom_jitter(height = 0, width = 0.2, alpha = 0.4) +
  geom_text(data = income_agg,
            mapping = aes(x = t_VZD, y = -2000,
                          label = paste0("SD: ", round(deviation)))) +
  scale_x_discrete(labels = str_to_sentence) +
  scale_y_continuous(labels = number_format(scale = 0.001, suffix = " tis. Kč")) +
  labs(x = element_blank(),
       y = "Čistý měsiční příjem",
       caption = "Zdroj dat: Naše společnost, červen 2019")



income_agg <- cvvm %>%
  select(IDE_10, t_VZD) %>% 
  filter(!is.na(t_VZD)) %>% 
  mutate(IDE_10 = as.numeric(IDE_10)) %>% 
  group_by(t_VZD) %>% 
  summarise(average = mean(IDE_10, na.rm = TRUE),
            deviation = sd(IDE_10, na.rm = TRUE),
            variance = var(IDE_10, na.rm = TRUE))

cvvm %>% select(IDE_10, t_VZD) %>% 
  filter(!is.na(t_VZD)) %>% 
  mutate(IDE_10 = as.numeric(IDE_10)) %>% 
  ggplot(aes(x = t_VZD, y = IDE_10)) +
  geom_jitter(height = 0, width = 0.2, alpha = 0.4) +
  geom_text(data = income_agg,
            mapping = aes(x = t_VZD, y = -2000,
                          label = paste0("SD: ", round(deviation)))) +
  scale_x_discrete(labels = str_to_sentence) +
  scale_y_continuous(labels = number_format(scale = 0.001, suffix = " tis. Kč")) +
  labs(x = element_blank(),
       y = "Čistý měsiční příjem domácnosti",
       caption = "Zdroj dat: Naše společnost, červen 2019")
