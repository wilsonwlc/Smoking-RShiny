library(readxl)
library(stringr)
library(tidyr)
library(dplyr)

file_path <- "data/adultsmokinghabitsingreatbritain.xlsx"
df0 <- read_excel(file_path, sheet = "Table_1", range = "A9:T45")

colnames(df0) <- gsub("\r\n", "", colnames(df0))

pattern_sex <- "men|women|all persons"
pattern_age <- "\\d{2} to \\d{2}|\\d{2} and over"
name_target = "prop_cigarette_smokers"

df <- as.data.frame(df0) %>%
  pivot_longer(cols = names(df0)[-c(1, 2)],
               names_to = "group",
               values_to = name_target) %>%
  rename(
    weight = "Weight [note 4]",
    year0 = "Year [note 5]"
  ) %>%
  filter(weight == "Weighted") %>%
  mutate(
    year = str_extract(year0, "\\d{4}"),
    sex = str_extract(tolower(group), pattern_sex),
    age = str_extract(tolower(group), pattern_age)) %>%
  select(any_of(c("year", "sex", "age", name_target)))
