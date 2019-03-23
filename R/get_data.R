#' Get Transmittal Sheet data
#'
#' This gets the data
#'
#' @export
get_trans <- function(year = 2017) {
  Trans <- lapply(year, function(y){

    Url <- paste0("https://www.ffiec.gov/cra/xls/", stringr::str_sub(y, 3, 4), "exp_trans.zip")
    File <- tempfile()

    download.file(Url, File)
    unzip(File, exdir = tempdir())

    Temp <- filter(Layout, year <= y) %>%
      filter(row_number() == n())
    Temp2 <- unnest(Temp)

    Test <- list.files(tempdir(), pattern = ".dat", full.names = TRUE)

    Test2 <- read_fwf(Test, col_positions = fwf_positions(Temp2$start, Temp2$end, Temp2$col_names),
                      col_types = Temp$types)
    unlink(Test, recursive = TRUE)
    return(Test2)
  }) %>%
    bind_rows()

  return(Trans)
}
