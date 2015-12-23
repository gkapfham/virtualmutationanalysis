#' FUNCTION: combine_dbms_data
#'
#' Combine the data from the HyperSQL, Postgres, and SQLite databases.
#' @importFrom magrittr %>%
#' @export

combine_dbms_data <- function(h, p, s) {
  # Join the HyperSQL and Postgres data frames together
  hp = dplyr::bind_rows(h, p)
  hps = dplyr::bind_rows(hp, s)
  return(hps)
}


