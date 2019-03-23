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
  nest()

devtools::use_data(Layout, internal = TRUE)

# Transmittal sheet data for package
Trans <- get_trans(2017)
devtools::use_data(Trans, overwrite = TRUE)
