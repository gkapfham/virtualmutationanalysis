#' FUNCTION: create_dbms_data
#'
#' Create the data from the HyperSQL, Postgres, and SQLite databases.
#' @importFrom magrittr %>%
#' @export

create_dbms_data <- function(h, p, s) {
  h <- read_original_mutation_data_hypersql_subset() %>% summarise_mutation_analysis() %>% subset_all_attributes_except_identifier()
  p <- read_original_mutation_data_postgres_subset() %>% summarise_mutation_analysis() %>% subset_all_attributes_except_identifier()
  s <- read_original_mutation_data_sqlite_subset() %>% summarise_mutation_analysis() %>% subset_all_attributes_except_identifier()
  hps <- combine_dbms_data(h, p, s)
  hps <- hps %>% dplyr::mutate(technique="Original")
  return(hps)
}
