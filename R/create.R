#' FUNCTION: create_original_data
#'
#' Create the "original" data from the HyperSQL, Postgres, and SQLite databases.
#' @importFrom magrittr %>%
#' @export

create_original_data <- function() {
  # create the data frames for the three individual database management systems
  h <- read_original_mutation_data_hypersql_subset() %>% summarise_mutation_analysis() %>% subset_all_attributes_except_identifier()
  p <- read_original_mutation_data_postgres_subset() %>% summarise_mutation_analysis() %>% subset_all_attributes_except_identifier()
  s <- read_original_mutation_data_sqlite_subset() %>% summarise_mutation_analysis() %>% subset_all_attributes_except_identifier()
  # combine these three data frames into a single data frame
  hps <- combine_dbms_data(h, p, s)
  # add in an attribute signalling that this is the Original data set
  hps <- hps %>% dplyr::mutate(technique="Standard")
  return(hps)
}

#' FUNCTION: create_virtual_data
#'
#' Read virtual data from the virtual data file, then transform it and munge it into the right format.
#' @importFrom magrittr %>%
#' @export

create_virtual_data <- function() {
  v <- read_virtual_mutation_data_subset() %>% transform_virtual_mutation_time()
  return(v)
}

#' FUNCTION: create_original_and_virtual_data
#'
#' Create a combined data file that contains both the original and the virtual data sets.
#' @importFrom magrittr %>%
#' @export

create_original_and_virtual_data <- function() {
  o <- create_original_data()
  v <- create_virtual_data()
  ov <- dplyr::bind_rows(o, v) %>%
    dplyr::mutate(dbms = plyr::revalue(dbms, c(
            "Postgres" = "PostgreSQL"
            )))
  return(ov)
}
