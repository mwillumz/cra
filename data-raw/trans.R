library(tidyverse)

Layout <- bind_rows(tibble(year = 1996,
                           types = "ciicccccc",
                           start = c(1, 11, 12, 16, 46, 86, 111, 113, 123),
                           end = c(10, 11, 15, 45, 85, 110, 112, 122, 132),
                           col_names = c("respondent_id", "agency_code",
                                         "activity_year", "respondent_name",
                                         "respondent_address", "respondent_city",
                                         "respondent_state", "respondent_zip",
                                         "tax_id")),
                    tibble(year = 1997,
                           types = "ciicccccccc",
                           start = c(1, 11, 12, 16, 46, 86, 111, 113, 123, 133, 143),
                           end = c(10, 11, 15, 45, 85, 110, 112, 122, 132, 142, 152),
                           col_names = c("respondent_id", "agency_code",
                                         "activity_year", "respondent_name",
                                         "respondent_address", "respondent_city",
                                         "respondent_state", "respondent_zip",
                                         "tax_id", "id_rssd", "assets"))) %>%
  group_by(year, types) %>%
  nest() %>%
  mutate(table_id = "TS")

Layout2 <- tibble(table_id = "D6",
                 year = 2016,
                 types = "cciicccccccccc",
                 start = c(1, 6, 16, 17, 21, 23, 26, 31, 38, 42, 43, 44, 45, 48),
                 end = c(5, 15, 16, 20, 22, 25, 30, 37, 41, 42, 43, 44, 47, 48),
                 col_names = c('table_id', 'respondent_id', 'agency_code', 'activity_year', 'statefp', 'countyfp',
                               'cbsafp', 'tractce', 'aa_number', 'partial_county', 'split_county', 'population',
                               'income', 'loan')) %>%
  group_by(table_id, year, types) %>%
  nest()

Layout <- bind_rows(Layout, Layout2)

usethis::use_data(Layout, internal = TRUE, overwrite = TRUE)

# Transmittal sheet data for package
Trans <- get_trans(2017)
usethis::use_data(Trans, overwrite = TRUE)

# Discl <- get_discl(2017)
